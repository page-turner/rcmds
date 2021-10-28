boolean enabled=false; //HOLD SPACE BAR DOWN TO ENABLE

float x;
float y;

float theta1;
float theta2;

void setup() {
  size(1500, 800);
  background(0);
  udp = new UDP(this);
  udp.listen(true);
}
void draw() {
  x=mouseX*180.0/width-90;
  y=mouseY*180.0/height-90;
  enabled=(keyPressed&&key==' ');
  background(0);
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
