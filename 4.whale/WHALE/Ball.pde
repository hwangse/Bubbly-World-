class Ball {
  float x,y;
  float diameter;
  float volX, volY;
  float acc;
  boolean alive = true;
  color c;
  float op;
  
  Ball(float initialX, float initialY, float initialDiameter, float initialVolX, float initialVolY, float initialAcc, color initialC, float initialOp){
    x=initialX;
    y=initialY;
    diameter=initialDiameter;
    volX=initialVolX;
    volY=initialVolY;
    acc=initialAcc;
    c=initialC;
    op=initialOp;
  }
  void move(){
    volY+=acc;
    x+=volX;
    y+=volY;

    if(y>height+diameter){ //checking if off screen to delete
      alive = false;
    }
    
  }
  void display(){
    if(alive){
      noStroke();
      fill(c,op);
      ellipse(x,y,diameter,diameter);
    }
  }
}
