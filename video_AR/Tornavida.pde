class Tornavida {
  int size;
  float bz, rotZ;
  color col;

  Tornavida(int s, color c, float rz) {
    bz=0;
    size=s;
    rotZ=rz;
    col = c;
  }

  void ciz() {
    
    bz+=rotZ;
    rotateZ(bz);
    fill(col, 80); 
    translate(0, 0, -54*size);
    drawCylinder(8, 5*size, 5*size, 2*size);
    if(rotZ>0){
     translate(7*size,0,0);
    box(size,10*size,size);
     translate(0,5*size,0);
    rotateX(-PI/2);
    drawCylinder(4,2*size,1,4*size);
    rotateX(PI/2);
    translate(-7*size, -5*size, 0);
    }
    if(rotZ<0){
     translate(7*size,0,0);
    box(size,10*size,size);
     translate(0,-9*size,0);
    rotateX(-PI/2);
    drawCylinder(4,1,2*size,4*size);
    rotateX(PI/2);
    translate(-7*size, 9*size, 0);
    }
    translate(0,0, 2*size);
    drawCylinder(8, 5*size, 4*size, 2*size);
    translate(0, 0, 1*size);
    drawCylinder(8, 4*size, 4*size, 20*size);
    translate(0, 0, 20*size);
    drawCylinder(8, 4*size, 5*size, 2*size);
    translate(0, 0, 2*size);
    drawCylinder(8, 5*size, 5*size, 2*size);
    translate(0, 0, 2*size);
    fill(100, 100, 100, 80);
    drawCylinder(4, 1*size, 1*size, 20*size);
    translate(0, 0, 20*size);
    drawCylinder(4, 1*size, 2*size, 2*size);
    translate(0, 0, 2*size);
    drawCylinder(4, 2*size, 1, 4*size);
  }

  
}

void drawCylinder( int sides, float r1, float r2, float h)
  {
    float angle = 360 / sides;
    //    float halfHeight = h / 2;
    // top
    beginShape();
    for (int i = 0; i < sides; i++) {
      float x = cos( radians( i * angle ) ) * r1;
      float y = sin( radians( i * angle ) ) * r1;
      vertex( x, y, 0);
    }
    endShape(CLOSE);
    // bottom
    beginShape();
    for (int i = 0; i < sides; i++) {
      float x = cos( radians( i * angle ) ) * r2;
      float y = sin( radians( i * angle ) ) * r2;
      vertex( x, y, h);
    }
    endShape(CLOSE);
    // draw body
    beginShape(QUAD_STRIP);
    for (int i = 0; i < sides +1; i++) {
      float x1 = cos( radians( i * angle ) ) * r1;
      float y1 = sin( radians( i * angle ) ) * r1;
      float x2 = cos( radians( i * angle ) ) * r2;
      float y2 = sin( radians( i * angle ) ) * r2;
      vertex( x1, y1, 0);
      vertex( x2, y2, h);
    }
    endShape(CLOSE);
  }