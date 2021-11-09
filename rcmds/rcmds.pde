
String wifiIP="172.18.128.196";

boolean enabled=false; //space=enable, enter=disable

float x;
float y;
boolean go;

float torque1;
float torque2;

float theta1;
float theta2;

void setup() {
  size(800, 800);
  background(0);
  udp = new UDP(this);
  udp.listen(true);
}
void draw() {
  if (keyPressed) {
    if (key==CODED&&keyCode==UP) {
      y+=.1;
    }
    if (key==CODED&&keyCode==DOWN) {
      y-=.1;
    }
    if (key==CODED&&keyCode==LEFT) {
      x-=.1;
    }
    if (key==CODED&&keyCode==RIGHT) {
      x+=.1;
    }
  }
  go=keyPressed&&key=='g';
  if (mousePressed) {
    x=mouseX*50.0/width-25;
    y=-(mouseY*50.0/height-25);
  }
  if (keyPressed) {
    if (key==' ') {
      enabled=false;
    } else if (key==ENTER) {
      enabled=true;
    }
  }
  if (!focused) {
    enabled=false;
  }
  if (enabled) {
    background(0, 0, 0);
  } else {
    background(50, 20, 0);
  }
  fill(255);
  textSize(60);
  text("connected: "+str(millis()-wifiReceivedMillis<3000), 100, 100);
  text("x: "+str(x), 100, 200);
  text("y: "+str(y), 100, 300);
  text("theta1: "+str(theta1), 100, 400);
  text("theta2: "+str(theta2), 100, 500);
  text("torque1: "+str(torque1), 100, 600);
  text("torque2: "+str(torque2), 100, 700);
  sendWifiData(true);
}

void WifiDataToRecv() {
  theta1=recvFl();
  theta2=recvFl();
  torque1=recvFl();
  torque2=recvFl();
}
void WifiDataToSend() {
  sendBl(enabled);
  sendFl(x);
  sendFl(y);
  sendBl(go);
}
