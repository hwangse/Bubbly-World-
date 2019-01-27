
float sec=0;
int home_flag=0;

/* letter info */
PFont f;
String message = "BUBBLY WORLD";
Letter[] letters;

bubbleSystem bs = new bubbleSystem();

int x=0;
int speed=30;

float deg=0;

void setup() {
  fullScreen();
  smooth();


  //title : bubbly world
  f = createFont("Sniglet", 135, true);
  textFont(f);
  letters = new Letter[message.length()];
  int x = (width - (int) textWidth(message)) / 2;  
  int y = (height / 2);
  //gradation color
  color from=color(0, 102, 153);
  color to=color(255, 102, 153);
  float split=0.09;
  
  for (int i=0; i < message.length(); i++) {
    color interm=lerpColor(from,to,split*i);
    letters[i] = new Letter(new PVector(x, y, 0), new PVector(random(50, width-50), random(50, height-50), 0), message.charAt(i),interm,255.0);
    x += textWidth(message.charAt(i));
  }
  // frameRate(20);
}
int end_time=470;
//color from=color(109,199,220);
color from=color(117,215,234);
//color from=color(140,230,255);
color to=color(255);
float split=0.02;

void draw() {
  noStroke();
  
  //Background color
   if(sec<end_time+50)
     background(from);
    else{
      color med=lerpColor(from,to,split*(sec-(end_time+50)));
      background(med);
    }
  
 //Drawing bubbles 
  if (sec<500) {
    bs.add(new Bubble(x, height+50));
    bs.blow();
  } else {
    bs.blow();
  }
  if (x>width || x<0)
    speed*=-1;

  x=x+speed;

  //Gathering letters  
  if (sec>200 && home_flag==0) {
    for (int i=0; i<letters.length; i++)
      letters[i].goHome();
    home_flag=1;
  }
  //Drawing letters
  for (int i=0; i < letters.length; i++) {
    letters[i].display();
  }
  //Disappear letters
  if(sec>end_time){
     for (int i=0; i < letters.length; i++) {
    letters[i].updateOp();
  }
  
  }

  sec += 0.5;
 //println(sec);
}

ArrayList  bubbles = new ArrayList();
class bubbleSystem {

  void add(Bubble b) {
    bubbles.add(b);
  }

  void blow() {
    for (int i = 0; i < bubbles.size(); i++) {
      Bubble b = (Bubble)bubbles.get(i);
      b.run();
    }
  }
}
