int ball_num=700;
Ball[] fountain = new Ball[ball_num];
int k=0;
int i=0;
int j=0;

//whale information//
Fish whale, whale2;
Fish []fish=new Fish[120];
float sec=0;

//ending letter
PFont f1, f2;
String message1 = "The End";
String message2="made by sehyun";
Letter[] letters1, letters2;

void setup() {
  fullScreen();
  whale=new Fish(28, width*1.2, height*0.4, random(300), 5, color(150, 220, 255), 0);
  whale2=new Fish(10, width*1.35, height*0.55, random(300), 5, color(130, 215, 195), 0);
  for (int i=0; i<fish.length; i++) {
    fish[i]=new Fish(random(1, 3), random(width), random(height), random(300), random(2, 4), color(random(150, 250), random(200, 240), random(220, 255)), 1);
  }

  //letter information
  f1 = createFont("Sniglet", 130, true);
  textFont(f1);
  letters1 = new Letter[message1.length()];
  int x = (width - (int) textWidth(message1)) / 2;  
  int y = (height / 2)-100;
  //gradation color
  color from=color(0, 102, 153);
  color to=color(255, 102, 153);
  float split=0.09;

  for (int i=0; i < message1.length(); i++) {
    color interm=lerpColor(from, to, split*i);
    letters1[i] = new Letter(new PVector(x, y, 0), new PVector(x, y, 0), message1.charAt(i), interm, 0.0);
    x += textWidth(message1.charAt(i));
  }

  //text2
  f2 = createFont("Sniglet", 80, true);
  textFont(f2);
  letters2 = new Letter[message2.length()];
  x = (width - (int) textWidth(message2)) / 2;  
  y = (height / 2)+50;
  //gradation color
  from=color(0, 102, 153);
  to=color(255, 102, 153);
  split=0.09;

  for (int i=0; i < message2.length(); i++) {
    color interm=lerpColor(from, to, split*i);
    letters2[i] = new Letter(new PVector(x, y, 0), new PVector(x, y, 0), message2.charAt(i), interm, 0.0);
    x += textWidth(message2.charAt(i));
  }
}
int start_time=680;  //Showing letter starts
int end_time;
float rot_angle=-PI/19.0;
float rot_plus=0.01;

color from, to, med;
color c1=color(255, 210, 215);
color c2=color(255, 210, 245);
float split=0.01;

void draw() {
  //Background color

  if (sec<100) {
    from=color(255);
    to=c1;
    end_time=0;
  } 
  if (sec<100)
    med=lerpColor(from, to, split*(sec-end_time));
  else
    med=color(c1);
  background(med);
  noStroke();

  //fish
  for (i=0; i<fish.length; i++) {
    fish[i].increaseOP();
    fish[i].display();
  }
  whale.increaseOP();
  whale.display();

  pushMatrix();
  translate(whale.tx, whale.ty);

  //whale back
  fill(0, 30);
  ellipse(-whale.s*6, -whale.s*5.5, width/35, width/90);

  //whale belly
  fill(255, 90);
  ellipse(-whale.s*7, +whale.s*4, width/5, width/15);
  popMatrix();

 // if (sec>=start_time+50) {
    whale2.increaseOP();
    whale2.display();
 // }

  //whale2 belly
  pushMatrix();
  translate(whale2.tx, whale2.ty);
  fill(255, 90);
  ellipse(-whale2.s*7, +whale2.s*4, width/15, width/40);
  popMatrix();

  //whale crown1
  fill(255, 221, 88);
  pushMatrix();
  float size=whale.s;
  translate(whale.tx-size*10.3, whale.ty-size*6);
  rotate(rot_angle);
  if (rot_angle<-PI/10.0)
    rot_plus=0.005;
  else if (rot_angle>-PI/30.0)
    rot_plus=-0.005;
  rot_angle+=rot_plus;
  beginShape();
  vertex(-size*4, 0);
  vertex(size*4, 0);
  vertex(size*5, -size*4);
  vertex(size*2.5, -size*2.5);
  vertex(0, -size*4);
  vertex(-size*2.5, -size*2.5);
  vertex(-size*5, -size*4);
  endShape(CLOSE);
  popMatrix();
  //whale crown2


  pushMatrix();
  size=whale2.s;
  translate(whale2.tx-size*10.3, whale2.ty-size*6);
  rotate(rot_angle);
  if (rot_angle<-PI/10.0)
    rot_plus=0.005;
  else if (rot_angle>-PI/30.0)
    rot_plus=-0.005;
  rot_angle+=rot_plus;
  beginShape();
  vertex(-size*4, 0);
  vertex(size*4, 0);
  vertex(size*5, -size*4);
  vertex(size*2.5, -size*2.5);
  vertex(0, -size*4);
  vertex(-size*2.5, -size*2.5);
  vertex(-size*5, -size*4);
  endShape(CLOSE);
  popMatrix();

  if (k<ball_num) {
    fountain[k] = new Ball(whale.tx-whale.s*6, whale.ty-whale.s*5.5, random(7, 35), random(3)-1.5, -random(7)-2, random(10)/100+.03, color(random(200, 255), random(170, 255), random(200, 255)), random(120)+130);
    k++;
  } else {  //inf fountain
    k=0;
    j=ball_num;
  }
  for (i=0; i<j || i<k; i++) {
    fountain[i].move();
    fountain[i].display();
  }

  //Showing letters
  if (sec>start_time) {
    for (int i=0; i < letters1.length; i++) {
      letters1[i].updateOp();
    }
  } 
  if (sec>start_time+100) {
    for (int i=0; i<letters2.length; i++)
      letters2[i].updateOp();
  }



  //Drawing letters
  for (int i=0; i < letters1.length; i++) {
    textFont(f1);
    letters1[i].display();
  }
  for (int i=0; i < letters2.length; i++) {
    textFont(f2);
    letters2[i].display();
  }

  sec+=0.5;
}
