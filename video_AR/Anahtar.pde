class Anahtar {
  int size;
  float bz, rotZ;
  color col;

  Anahtar(int s, color c, float rz) {
    bz=0;
    size=s;
    rotZ=rz;
    col = c;
  }

  void ciz() {

    bz+=rotZ;
    rotateZ(bz);
    fill(col, 80); 
    
    drawKanca(8,10*size,6*size,6*size);
    translate(-16*size, 16*size, 3*size);
    rotateZ(PI/4);
    box(6*size,32*size,6*size);
    
    if(rotZ>0){
    translate(0,0,-7*size);
    rotateZ(PI/2);
    box(size,10*size,size);
    translate(0,5*size,0);
    rotateX(-PI/2);
    drawCylinder(4,2*size,1,4*size);
    }
    if(rotZ<0){
    translate(0,0,-7*size);
    rotateZ(PI/2);
    box(size,10*size,size);
    translate(0,-9*size,0);
    rotateX(-PI/2);
    drawCylinder(4,1,2*size,4*size);
    }
  }
}

void drawKanca( int sides, float r1, float r2,float h)
{
  float angle = 360 / sides;

  beginShape();
  for (int i = 0; i < sides-1; i++) {
    float x = cos( radians( i * angle ) ) * r1;
    float y = sin( radians( i * angle ) ) * r1;
    vertex( x, y, 0);
  }
  for (int j = sides-2; j >= 0; j--) {

    float x2 = cos( radians( j * angle ) ) * r2;
    float y2 = sin( radians( j * angle ) ) * r2;
     vertex( x2, y2, 0);
  }
  endShape(CLOSE);
  
    beginShape();
  for (int i = 0; i < sides-1; i++) {
    float x = cos( radians( i * angle ) ) * r1;
    float y = sin( radians( i * angle ) ) * r1;
    vertex( x, y, h);
  }
  for (int j = sides-2; j >= 0; j--) {

    float x2 = cos( radians( j * angle ) ) * r2;
    float y2 = sin( radians( j * angle ) ) * r2;
     vertex( x2, y2, h);
  }
  endShape(CLOSE);

  // draw body
  beginShape(QUAD_STRIP);
  for (int i = 0; i < sides-1; i++) {
    float x1 = cos( radians( i * angle ) ) * r1;
    float y1 = sin( radians( i * angle ) ) * r1;
    vertex( x1, y1, 0);
    vertex( x1, y1, h );
  }
   for (int j = sides-2; j >= 0; j--) {
    float x2 = cos( radians( j * angle ) ) * r2;
    float y2 = sin( radians( j * angle ) ) * r2;
     vertex( x2, y2, 0);
     vertex( x2, y2, h);
  }
  vertex( r1, 0, 0);
  vertex( r1, 0, h);

  endShape(CLOSE); 
}