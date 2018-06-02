#include <stdio.h>
#include <stdint.h>
#include <stddef.h>
#include <string.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/event_groups.h"
#include "freertos/semphr.h"
#include "freertos/queue.h"
#include "esp_system.h"
#include "esp_wifi.h"
#include "esp_event_loop.h"
#include "esp_log.h"
#include "nvs_flash.h"

#include "lwip/err.h"
#include "lwip/sys.h"
#include "lwip/sockets.h"
#include "lwip/dns.h"
#include "lwip/netdb.h"

#include "mqtt_client.h"
#include "driver/spi_master.h"
#include "soc/gpio_struct.h"
#include "driver/gpio.h"

#define EXAMPLE_ESP_WIFI_MODE_AP   CONFIG_ESP_WIFI_MODE_AP //TRUE:AP FALSE:STA
#define EXAMPLE_ESP_WIFI_SSID      "208C"
#define EXAMPLE_ESP_WIFI_PASS      ""
#define EXAMPLE_MAX_STA_CONN       CONFIG_MAX_STA_CONN

#define PIN_NUM_MISO 12
#define PIN_NUM_MOSI 26
#define PIN_NUM_CLK 25
#define PIN_NUM_RED 18
#define PIN_NUM_GREEN 17
#define PIN_NUM_BLUE 19

static EventGroupHandle_t wifi_event_group;

const int WIFI_CONNECTED_BIT = BIT0;

static const char *TAG = "TRHR_LEDS";

spi_device_handle_t red;
spi_device_handle_t green;
spi_device_handle_t blue;


static esp_err_t event_handler(void *ctx, system_event_t *event)
{
    switch(event->event_id) {
    case SYSTEM_EVENT_STA_START:
        esp_wifi_connect();
        break;
    case SYSTEM_EVENT_STA_GOT_IP:
        ESP_LOGI(TAG, "got ip:%s",
                 ip4addr_ntoa(&event->event_info.got_ip.ip_info.ip));
        xEventGroupSetBits(wifi_event_group, WIFI_CONNECTED_BIT);
        break;
    case SYSTEM_EVENT_AP_STACONNECTED:
        ESP_LOGI(TAG, "station:"MACSTR" join, AID=%d",
                 MAC2STR(event->event_info.sta_connected.mac),
                 event->event_info.sta_connected.aid);
        break;
    case SYSTEM_EVENT_AP_STADISCONNECTED:
        ESP_LOGI(TAG, "station:"MACSTR"leave, AID=%d",
                 MAC2STR(event->event_info.sta_disconnected.mac),
                 event->event_info.sta_disconnected.aid);
        break;
    case SYSTEM_EVENT_STA_DISCONNECTED:
        esp_wifi_connect();
        xEventGroupClearBits(wifi_event_group, WIFI_CONNECTED_BIT);
        break;
    default:
        break;
    }
    return ESP_OK;
}

void spi_cmd(spi_device_handle_t spi, const uint8_t cmd, const uint8_t data)
{
    esp_err_t ret;
    static spi_transaction_t t;
    memset(&t, 0, sizeof(t));
    t.flags=SPI_TRANS_USE_TXDATA;
    t.length=16;
    t.tx_data[0]=cmd;
    t.tx_data[1]=data;
    ret=spi_device_queue_trans(spi,&t,10);
    assert(ret==ESP_OK);
    spi_transaction_t *rtrans;
    ret=spi_device_get_trans_result(spi,&rtrans,10);
    assert(ret==ESP_OK);
}

static esp_err_t mqtt_event_handler(esp_mqtt_event_handle_t event)
{
    esp_mqtt_client_handle_t client = event->client;
    int msg_id;
    switch (event->event_id) {
        case MQTT_EVENT_CONNECTED:
            ESP_LOGI(TAG, "MQTT_EVENT_CONNECTED");
            msg_id = esp_mqtt_client_subscribe(client, "red1", 1);
            ESP_LOGI(TAG, "sent subscribe successful, msg_id=%d", msg_id);

            msg_id = esp_mqtt_client_subscribe(client, "green1", 1);
            ESP_LOGI(TAG, "sent subscribe successful, msg_id=%d", msg_id);

            msg_id = esp_mqtt_client_subscribe(client, "blue1", 1);
            ESP_LOGI(TAG, "sent subscribe successful, msg_id=%d", msg_id);


            break;
        case MQTT_EVENT_DISCONNECTED:
            ESP_LOGI(TAG, "MQTT_EVENT_DISCONNECTED");
            break;

        case MQTT_EVENT_SUBSCRIBED:
            ESP_LOGI(TAG, "MQTT_EVENT_SUBSCRIBED, msg_id=%d", event->msg_id);
            msg_id = esp_mqtt_client_publish(client, "red1", "data", 0, 0, 0);
            ESP_LOGI(TAG, "sent publish successful, msg_id=%d", msg_id);

            break;
        case MQTT_EVENT_UNSUBSCRIBED:
            ESP_LOGI(TAG, "MQTT_EVENT_UNSUBSCRIBED, msg_id=%d", event->msg_id);
            break;
        case MQTT_EVENT_PUBLISHED:
            ESP_LOGI(TAG, "MQTT_EVENT_PUBLISHED, msg_id=%d", event->msg_id);
            break;
        case MQTT_EVENT_DATA:
            ESP_LOGI(TAG, "MQTT_EVENT_DATA");
            printf("TOPIC=%.*s\r\n", event->topic_len, event->topic);
            printf("DATA=%.*s\r\n", event->data_len, event->data);

            char top [50];
            snprintf(top,(event->topic_len), "%.*s\r", event->topic_len, event->topic);

            char val [50];
            snprintf(val,(event->data_len)+1, "%.*s\r", event->data_len, event->data);

            char *endptr;
            int intval = strtol(val,&endptr,10);
            if (endptr != val)
            	{
        		if (strstr(top,"red")!=NULL)
        			{
        				spi_cmd(red,0x00,intval);
        			}
        		if (strstr(top,"green")!=NULL)
        			{
        				spi_cmd(green,0x00,intval);
        			}
        		if (strstr(top,"blue")!=NULL)
        			{
        				spi_cmd(blue,0x00,intval);
        			}

            	}
            break;
        case MQTT_EVENT_ERROR:
            ESP_LOGI(TAG, "MQTT_EVENT_ERROR");
            break;
    }
    return ESP_OK;
}



void wifi_init_softap()
{
    wifi_event_group = xEventGroupCreate();

    tcpip_adapter_init();
    ESP_ERROR_CHECK(esp_event_loop_init(event_handler, NULL));

    wifi_init_config_t cfg = WIFI_INIT_CONFIG_DEFAULT();
    ESP_ERROR_CHECK(esp_wifi_init(&cfg));
    wifi_config_t wifi_config = {
        .ap = {
            .ssid = EXAMPLE_ESP_WIFI_SSID,
            .ssid_len = strlen(EXAMPLE_ESP_WIFI_SSID),
            .password = EXAMPLE_ESP_WIFI_PASS,
            .max_connection = EXAMPLE_MAX_STA_CONN,
            .authmode = WIFI_AUTH_WPA_WPA2_PSK
        },
    };
    if (strlen(EXAMPLE_ESP_WIFI_PASS) == 0) {
        wifi_config.ap.authmode = WIFI_AUTH_OPEN;
    }

    ESP_ERROR_CHECK(esp_wifi_set_mode(WIFI_MODE_AP));
    ESP_ERROR_CHECK(esp_wifi_set_config(ESP_IF_WIFI_AP, &wifi_config));
    ESP_ERROR_CHECK(esp_wifi_start());

    ESP_LOGI(TAG, "wifi_init_softap finished.SSID:%s password:%s",
             EXAMPLE_ESP_WIFI_SSID, EXAMPLE_ESP_WIFI_PASS);
}

void wifi_init_sta()
{
    wifi_event_group = xEventGroupCreate();

    tcpip_adapter_init();
    ESP_ERROR_CHECK(esp_event_loop_init(event_handler, NULL) );

    wifi_init_config_t cfg = WIFI_INIT_CONFIG_DEFAULT();
    ESP_ERROR_CHECK(esp_wifi_init(&cfg));
    wifi_config_t wifi_config = {
        .sta = {
            .ssid = EXAMPLE_ESP_WIFI_SSID,
            .password = EXAMPLE_ESP_WIFI_PASS
        },
    };

    ESP_ERROR_CHECK(esp_wifi_set_mode(WIFI_MODE_STA) );
    ESP_ERROR_CHECK(esp_wifi_set_config(ESP_IF_WIFI_STA, &wifi_config) );
    ESP_ERROR_CHECK(esp_wifi_start() );

    ESP_LOGI(TAG, "wifi_init_sta finished.");
    ESP_LOGI(TAG, "connect to ap SSID:%s password:%s",
             EXAMPLE_ESP_WIFI_SSID, EXAMPLE_ESP_WIFI_PASS);
}

static void mqtt_app_start(void)
{
    const esp_mqtt_client_config_t mqtt_cfg = {
        .host = "192.168.1.200",
		.port = 1883,
		.client_id = "ESP32_POT_1",
		.username = "homeassistant",
		.password = "aoeu",
        .event_handle = mqtt_event_handler,
    };

    esp_mqtt_client_handle_t client = esp_mqtt_client_init(&mqtt_cfg);
    esp_mqtt_client_start(client);
}

void app_main()
{

    esp_err_t ret;

    ret = nvs_flash_init();
    if (ret == ESP_ERR_NVS_NO_FREE_PAGES) {
      ESP_ERROR_CHECK(nvs_flash_erase());
      ret = nvs_flash_init();
    }
    ESP_ERROR_CHECK(ret);
    
#if EXAMPLE_ESP_WIFI_MODE_AP
    ESP_LOGI(TAG, "ESP_WIFI_MODE_AP");
    wifi_init_softap();
#else
    ESP_LOGI(TAG, "ESP_WIFI_MODE_STA");
    wifi_init_sta();
#endif
    mqtt_app_start();

	spi_bus_config_t buscfg={
			.miso_io_num=PIN_NUM_MISO,
			.mosi_io_num=PIN_NUM_MOSI,
			.sclk_io_num=PIN_NUM_CLK,
			.quadwp_io_num=-1,
			.quadhd_io_num=-1
	};

    spi_device_interface_config_t redcfg={
        .clock_speed_hz=10*1000*1000,
        .mode=0,
        .spics_io_num=PIN_NUM_RED,
		.queue_size = 3,
    };

    spi_device_interface_config_t greencfg={
		.clock_speed_hz=10*1000*1000,
		.mode=0,
		.spics_io_num=PIN_NUM_GREEN,
		.queue_size = 3,
	};

    spi_device_interface_config_t bluecfg={
		.clock_speed_hz=10*1000*1000,
		.mode=0,
		.spics_io_num=PIN_NUM_BLUE,
		.queue_size = 3,
	};

    ret=spi_bus_initialize(HSPI_HOST, &buscfg, 0);
    assert(ret==ESP_OK);

    ret=spi_bus_add_device(HSPI_HOST, &redcfg, &red);
	assert(ret==ESP_OK);
	ret=spi_bus_add_device(HSPI_HOST, &greencfg, &green);
	assert(ret==ESP_OK);
	ret=spi_bus_add_device(HSPI_HOST, &bluecfg, &blue);
	assert(ret==ESP_OK);



}
