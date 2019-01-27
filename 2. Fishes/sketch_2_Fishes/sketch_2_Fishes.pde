 //<>//

Fish [] fish = new Fish[150];
Fish first_fish;

int b;
float e;

float sec=0;
int flag=0;

void setup() {
  fullScreen();


  first_fish=new Fish(5, width, height/2, random(300), 6, color(random(100, 150), random(210, 240), random(240, 255)), 255);


  for (int i = 0; i < fish.length/5; i++) 
    fish[i] = new Fish(int(random(1, 4)), random(width*1.1), random(height), random(300), random(2, 4), color(random(100, 150), random(200, 250), random(230, 255)), 0);
  for (int i=fish.length/5; i<fish.length/5*2; i++) 
    fish[i] = new Fish(int(random(1, 4)), random(width*1.1), random(height), random(300), random(2, 4), color(random(130, 150), random(220, 250), random(230, 255)), 0);
  for (int i=fish.length/5*2; i<fish.length/5*3; i++)
    fish[i] = new Fish(int(random(1, 4)), random(width*1.1), random(height), random(300), random(2, 4), color(random(140, 160), 255, random(200, 215)), 0);
  for (int i=fish.length/5*3; i<fish.length/5*4; i++)
    fish[i] = new Fish(int(random(1, 4)), random(width*1.1), random(height), random(300), random(2, 4), color(random(230, 250), random(220, 250), random(100, 155)), 0);
  for (int i=fish.length/5*4; i<fish.length; i++)
    fish[i] = new Fish(int(random(1, 4)), random(width*1.1), random(height), random(300), random(2, 4), color(random(210, 250), 255, random(100, 155)), 0);
}
int index=-1;
void draw() {
  color from, to;
  color blue=color(204, 255, 255);
  color yellow=color(255, 255, 220);
  color green=color(214, 255, 204);
  int boundary;
  float end;
  randomSeed(1);

  if (sec<150) {
    background(255);
    first_fish.direction();
    first_fish.display();
  } else {
    if (sec<300) {
      from=color(255);
      to=blue;
      boundary=200;
      end=fish.length/5;
    } else if (sec<400) {
      from=blue;
      to=blue;
      boundary=300;  
      end=fish.length/5*2;
    } else if (sec<500) {
      from=blue;
      to=green;
      boundary=400;
      end=fish.length/5*3;
    } else if (sec<600) {
      from=green;
      to=yellow;
      boundary=500;
      end=fish.length/5*4;
    } else if (sec<900) {
      if (sec%100 == 0 )
        index++;

      if (index%3==0) {
        from=yellow;
        to=blue;
      } else if (index%3==1) {
        to=green;
        from=blue;
      } else {
        from=green;
        to=yellow;
      }
      boundary=(index+6)*100;
      end=fish.length;
    } else {
      from=yellow;
      to=color(255);
      boundary=900;
      end=fish.length;
    }

    if (sec<1000) {
      color med=lerpColor(from, to, 0.01*(sec-boundary));
      background(med);
    } else
      background(255);  
    first_fish.direction();
    first_fish.display();

    if (sec<1100) {
      for (int i=0; i<end; i++) {
        fish[i].updateOP();
        fish[i].direction();
        fish[i].display();
      }
    } else {
      first_fish.decreaseOP();
      for (int i=0; i<end; i++) {
        fish[i].decreaseOP();
        fish[i].direction();
        fish[i].display();
      }
    }
  }

  sec+=0.5;
}
