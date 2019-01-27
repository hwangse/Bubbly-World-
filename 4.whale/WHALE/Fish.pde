class Fish {

  float Vx, Vy;//tail
  float Cx, Cy; //center
  float s; // size
  float d; //tail wiggle factor
  float l; //size of the locus
  float h1, h2; //wiggle range
  float tx, ty; //location of fish
  int g; //direction of travel
  float a;
  float angle;
  float Xoff;
  float Yoff;
  float speed;
  float split=0.01;
  color c, from, to;
  int flag;
  float op=0, op2=0;


  Fish(float Size, float Xofftemp, float Yofftemp, float Length, float Speed, color _c, int _flag) {

    s = Size;
    l = Length;
    Xoff = Xofftemp;
    Yoff = Yofftemp;
    g = 1;
    Cx = 0;
    Cy = 0;
    Vy = Cy;
    d = 1;
    speed = Speed;
    c=_c;
    flag=_flag;
  }
  void increaseOP() {
    if (op<250)
      op=op+speed*0.3;
    if (op2<90)
      op2=op2+speed*0.3;
  }

  void display() {
    noStroke();
    fill(c, op);

    angle = radians(frameCount/speed);
    h1 = Cy + 4*s;
    h2 = Cy - 4*s;

    Vx = Cx-20*s;

    pushMatrix ();

    translate(tx, ty);
    tx = Xoff + l * cos(g*angle);
    ty = Yoff + l * sin(g*angle);
    // rotate(g*(angle + PI/2));
    if (flag==0)
      Xoff-=speed*0.5;
    rotate(PI);

    //fish body
    beginShape();
    vertex(Cx+18*s, Cy);
    bezierVertex(Cx+17*s, Cy+5*s, Cx+10*s, Cy+9*s, Cx, Cy+5*s);//head position
    bezierVertex(Cx-10*s, Cy+s, Vx, Vy, Vx, Vy);//tail position
    bezierVertex(Vx, Vy, Cx-10*s, Cy-s, Cx, Cy-5*s);
    bezierVertex(Cx+10*s, Cy-9*s, Cx+17*s, Cy-5*s, Cx+18*s, Cy);
    endShape();
    //tail

    beginShape();
    vertex(Vx+5, Vy);
    bezierVertex(Vx-2*s, Vy+6*s, Vx-5*s, Vy+5*s, Vx-s*2, Vy);
    bezierVertex(Vx-5*s, Vy-5*s, Vx-s*2, Vy-6*s, Vx+5, Vy);
    endShape();

    // quad(Vx+5, Vy, Vx-5*s, Vy+5*s, Vx-s*2, Vy, Vx-5*s, Vy-5*s);    
    //fish eyes
    fill(0, op2);
    ellipse(Cx+12*s, Cy+2*s, s*2, s*2);          

    popMatrix();

    if (Xoff<-width*0.35)
      Xoff=width*1.4;


    Vy += d*0.8;
    if (Vy > h1) {
      d = -1;
    } else if (Vy < h2) {
      d = 1;
    }
  }
}
