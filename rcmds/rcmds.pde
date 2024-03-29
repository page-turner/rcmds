
String wifiIP="10.0.0.14";

boolean enabled=false; //space=enable, enter=disable

float x=0;
float y=27;
boolean go;
float fx;
float fy;
float lx;
float ly;

float torque1;
float torque2;

float theta1;
float theta2;

int state;

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
    x=mouseX*100.0/width-50;
    y=-(mouseY*100.0/height-50);
  }
  if (keyPressed) {
    if (key==' ') {
      enabled=false;
    } else if (key==ENTER) {
      enabled=true;
    }
    if (key=='z') {
      x=0;
      y=27;
    }
  }
  if (enabled) {
    background(0, 0, 0);
  } else {
    background(50, 20, 0);
  }
  fill(255);
  textSize(30);
  text("connected: "+str(millis()-wifiReceivedMillis<3000), 100, 100);
  text("x: "+str(x), 100, 150);
  text("y: "+str(y), 100, 200);
  text("theta1: "+str(theta1), 100, 250);
  text("theta2: "+str(theta2), 100, 300);
  text("torque1: "+str(torque1), 100, 350);
  text("torque2: "+str(torque2), 100, 400);
  text("Fx: "+str(fx), 100, 450);
  text("Fy: "+str(fy), 100, 500);
  text("lx: "+str(lx), 100, 550);
  text("ly: "+str(ly), 100, 600);
  text("state: "+str(state), 100, 650);
  sendWifiData(true);
}

void WifiDataToRecv() {
  theta1=recvFl();
  theta2=recvFl();
  torque1=recvFl();
  torque2=recvFl();
  fx=recvFl();
  fy=recvFl();
  lx=recvFl();
  ly=recvFl();
  state=recvIn();
}
void WifiDataToSend() {
  sendBl(enabled);
  sendFl(x);
  sendFl(y);
  sendBl(go);
  sendFl(12.5);//hoverX
  sendFl(20.0);//hoverY
  sendFl(-0.90);//targetForceY
  sendFl(2.0);//peelDist
  sendFl(1.0);//peelTime
  sendFl(11.0);//liftHeight
  //sendFl(11.0);//liftX
  sendFl(3.0);//downSpeed
  //sendIn(10850);//enc1Zero
  //sendIn(8900);//enc2Zero
}
