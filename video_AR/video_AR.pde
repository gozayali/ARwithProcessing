import processing.video.*;
import jp.nyatla.nyar4psg.*;

Capture cam;
MultiMarker nya;
Tornavida t, t2, t3;
Anahtar a, a2;
float x=0;

void setup() {
  size(640, 480, P3D);
  cam=new Capture(this, 640, 480, 30);
  nya=new MultiMarker(this, width, height, "../ar_data/camera_para.dat", NyAR4PsgConfig.CONFIG_PSG);
  //  nya.addARMarker("../ar_data/patt.hiro",80);//id=0
  //  nya.addARMarker("../ar_data/patt.kanji",80);//id=1
  nya.addNyIdMarker(0, 80);//id=1
  nya.addNyIdMarker(1, 80);//id=2
  nya.addNyIdMarker(2, 80);//id=3
  nya.addNyIdMarker(3, 80);//id=4
  nya.addNyIdMarker(4, 80);//id=4
  nya.addNyIdMarker(5, 80);//id=4
  nya.addNyIdMarker(6, 80);//id=4
  nya.addNyIdMarker(7, 80);//id=4
  nya.addNyIdMarker(8, 80);//id=4
  nya.addNyIdMarker(9, 80);//id=4

  cam.start();

  t= new Tornavida(3, color(255, 0, 0), 0);
  t2= new Tornavida(3, color(0, 255, 0), 0.1);
  t3= new Tornavida(3, color(0, 0, 255), -0.1);

  a= new Anahtar(3, color(0, 255, 255), -0.1);
  a2= new Anahtar(3, color(255, 0, 255), 0.1);
  
}

void draw()
{
  if (cam.available() !=true) {
    return;
  }

  x+=0.1;
  cam.read();
  nya.detect(cam);
  background(0);
  nya.drawBackground(cam);//frustumを考慮した背景描画
  lights();
  for (int i=0; i<10; i++) {
    if (nya.isExist(i)) {
      stroke(0,80);
      nya.beginTransform(i);
      rotateX(PI);
      pushMatrix();
      if (i==0) {
        rotateZ(x);
        rotateX(PI/2);
        fill(255, 0, 0, 80);
        sphere(60);
      }
      if (i==1) {
        a.ciz();
      }
      if (i==2) {
        t2.ciz();
      }
      if (i==3) {
        rotateZ(x);
        fill(255, 255, 0, 80);
        box(50);
      }
      if (i==4) {
        t3.ciz();
      }

      if (i==5) {
        a2.ciz();
      }

      if (i==6) {
        rotateZ(x);
        translate(0, 0, -100);
        fill(255, 100, 0, 80);
        drawCylinder(4, 1, 50, 100);
      }
      if (i==7) {
        rotateZ(x);
        translate(0, 0, -100);
        fill(50, 80);
        drawCylinder(30, 1, 50, 100);
      }
      if (i==8) {
        rotateZ(x);
        translate(0, 0, -100);
        fill(255, 100, 100, 80);
        drawCylinder(30, 50, 50, 100);
      }
      if (i==9) {
         rotateX(PI/2);
      // translate(0, 0, -100);
       fill(255,200,0);
       rotateY(-x);
       textSize(20);
       text("BORÇELİK",-50,0);
      }
      
      popMatrix();
      nya.endTransform();
    }
  }
}