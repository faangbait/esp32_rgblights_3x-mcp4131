#include <WiFi.h>
#include <HTTPClient.h>
#include <SPI.h>

const char* ssid = "208C";
const char* password =  "";

HTTPClient http;

int red;
int green;
int blue;

byte address=0x00;

void setup() {
  Serial.begin(115200);
  pinMode(12,OUTPUT);
  pinMode(13,OUTPUT);
  pinMode(14,OUTPUT);
  digitalWrite(12,HIGH);
  digitalWrite(13,HIGH);
  digitalWrite(14,HIGH);
}
 
void loop() {
  checkWifi();
  queryServer();
  writePots();
}

void checkWifi(){
  if ((WiFi.status() != WL_CONNECTED)) {
    WiFi.disconnect();
    Serial.println("Connecting to WiFi...");
    WiFi.begin(ssid,password);
    delay(6000);
  }
}

void queryServer(){
  Serial.println("Fetching data...");
  http.begin("http://192.168.1.200/rgblights/control.php?color=blue&unit=1");
  int httpCode = http.GET();
  if (httpCode>0) {
    blue = http.getString().toInt();
  }
  http.begin("http://192.168.1.200/rgblights/control.php?color=green&unit=1");
  httpCode = http.GET();
  if (httpCode>0) {
    green = http.getString().toInt();
  }
  http.begin("http://192.168.1.200/rgblights/control.php?color=red&unit=1");
  httpCode = http.GET();
  if (httpCode>0) {
    red = http.getString().toInt();
  }
}

void writePots(){
  Serial.print("Writing values to the pot: R");
  Serial.print(red);
  Serial.print(" G");
  Serial.print(green);
  Serial.print(" B");
  Serial.println(blue);

  digitalWrite(17,LOW);
  SPI.begin();
  SPI.transfer(address);
  SPI.transfer(red);
  digitalWrite(17,HIGH);

  digitalWrite(18,LOW);
  SPI.begin();
  SPI.transfer(address);
  SPI.transfer(green);
  digitalWrite(18,HIGH);

  digitalWrite(19,LOW);
  SPI.begin();
  SPI.transfer(address);
  SPI.transfer(blue);
  digitalWrite(19,HIGH);
}

