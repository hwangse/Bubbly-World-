class Letter {
  char letter;
  PVector home, pos, delta;
  PVector diff,dist;
  int flag=0;
  color c;
  float op=100;
  
  Letter(PVector home,PVector pos, char letter,color _c,float _op) {
    this.home = home.get();
    this.pos = pos.get();
    this.letter = letter;
    setDeltas();
    c=_c;
    op=_op;
  }
  
  void setDeltas() {
    int l = -1;
    int h = 2;
    delta = new PVector(random(l, h), random(l, h), random(-0.1, 0.1));
  }
  
  void setNewDeltas(PVector diff){
    delta=new PVector(diff.x/200,diff.y/200,random(-0.1, 0.1));
  }
  void updateOp(){
    if(op>=10){
    op=op-5;
    }
  }
  
  void display() {
    fill(c,op);
    textAlign(LEFT, CENTER);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(pos.z);
    text(letter,0, 0);
    popMatrix();
    if(abs(home.x-pos.x)<0.02 && abs(home.y-pos.y)<0.02 && flag==0){
      float r=pos.z;
      delta=new PVector(0.0,0.0,-1*r/100);
      flag=1;
    }
    else
     shift();
  }
  void goHome() {
    diff = new PVector(home.x-pos.x,home.y-pos.y,0.0);
    setNewDeltas(diff);
  }
  
  void shift() {
    if(flag==1){
      if(abs(home.z-pos.z)<0.001){
      }
      else
        pos.add(delta);
      
    }
    else{
    if ((pos.x > width)||(pos.x < 0)) {
      delta.x *= -1;
    }
    if ((pos.y > height)||(pos.y < 0)) {
      delta.y *= -1;
    }
    pos.add(delta);
    }
  }
}
