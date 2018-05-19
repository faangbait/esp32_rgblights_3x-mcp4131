import time

for i in range(0,255):
	f=open("/home/bb/rgblights/blue2","w")
	f.write('0')
	f.close()
	f=open("/home/bb/rgblights/red2","w")
	f.write(str(i))
	f.close()
	f=open("/home/bb/rgblights/green2","w")
	f.write(str(i/2))
	f.close()
	time.sleep(5)

for i in range(0,255):
	f=open("/home/bb/rgblights/red2","w")
	f.write(str(255))
	f.close()
	f=open("/home/bb/rgblights/green2","w")
	f.write(str(max(127,i)))
	f.close()
	f=open("/home/bb/rgblights/blue2","w")
	f.write(str(i))
	f.close()
	time.sleep(1)
