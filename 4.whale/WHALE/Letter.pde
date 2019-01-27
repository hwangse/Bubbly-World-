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
    int l = -5;
    int h = 5;
    delta = new PVector(random(l, h), random(l, h), random(-0.1, 0.1));
  }
  
  void setNewDeltas(PVector diff){
    delta=new PVector(diff.x/170,diff.y/170,random(-0.2, 0.2));
  }
  void updateOp(){
    if(op<251){
    op=op+3;
    }
  }
  
  void display() {
    fill(c,op);
    textAlign(LEFT, CENTER);
    pushMatrix();
    translate(pos.x, pos.y);
    text(letter,0, 0);
    popMatrix();
 
  }

}
