
String wifiIP="172.18.154.86";

boolean enabled=false; //space=enable, enter=disable

float x;
float y;

float theta1;
float theta2;

void setup() {
  size(800, 800);
  background(0);
  udp = new UDP(this);
  udp.listen(true);
}
void draw() {
  x=mouseX*180.0/width-90;
  y=mouseY*180.0/height-75;
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
  text("x: "+str(x), 100, 100);
  text("y: "+str(y), 100, 200);
  text("theta1: "+str(theta1), 100, 300);
  text("theta2: "+str(theta2), 100, 400);
  sendWifiData(true);
}

void WifiDataToRecv() {
  theta1=recvFl();
  theta2=recvFl();
}
void WifiDataToSend() {
  sendBl(enabled);
  sendFl(x);
  sendFl(y);
}
