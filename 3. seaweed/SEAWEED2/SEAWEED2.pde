int num = 60;  //num of seaweed
SeaWeed[] weeds;
PVector rootNoise = new PVector(random(100), random(100));
//int mode = 0;
Fish [] fish = new Fish[100];

void setup()
{
  fullScreen();
  weeds = new SeaWeed[num];
  for (int i = 0; i < num; i++)
    weeds[i] = new SeaWeed(random(0, width), height, 0);

  for (int i = 0; i < fish.length; i++) 
    fish[i] = new Fish(int(random(1, 4)), random(width), random(height), random(300), random(2, 10), color(random(100, 255), random(200, 245), random(200, 255)), 0);
}
float sec=0;
int index=-1;
int end_time=500;
int end_time2=0;

color from, to, med;
color c1=color(205, 255, 205);
float split=0.01;

void draw()
{
  randomSeed(1);

  if (sec<100) {
    from=color(255);
    to=c1;
    end_time2=0;
  } else if (sec>=end_time) {
    from=c1;
    to=color(255);
    end_time2=500;
  }
  if (sec<100 || sec>=end_time)
    med=lerpColor(from, to, split*(sec-end_time2));
  else
    med=color(c1);
  background(med);

  // background(255);
  //FISH FRONT
  if (sec<end_time+50) {

    for (int i=0; i<fish.length/2; i++) {
      fish[i].increaseOP();
      fish[i].direction();
      fish[i].display();
    }
  } else {
    for (int i=0; i<fish.length/2; i++) {
      fish[i].decreaseOP();
      fish[i].direction();
      fish[i].display();
    }
  }

  if (sec%100==0)
    index++;

  if (sec<150) {
    for (int i = 0; i < num/3; i++) {
      weeds[i].increase_dist();
      weeds[i].update();
    }
  } else if (sec<250) {
    for (int i = 0; i < num/3*2; i++) {
      weeds[i].increase_dist();
      weeds[i].update();
    }
  } else if (sec<end_time) {
    for (int i = 0; i < num; i++) {
      weeds[i].increase_dist();
      weeds[i].update();
    }
  } else {
    for (int i = 0; i < num; i++) {
      weeds[i].decrease_dist();
      weeds[i].update();
    }
  }


  //FISH BACK
  if (sec<end_time+50) {
    for (int i=fish.length/2; i<fish.length; i++) {
      fish[i].increaseOP();
      fish[i].direction();
      fish[i].display();
    }
  } else {
    for (int i=fish.length/2; i<fish.length; i++) {
      fish[i].decreaseOP();
      fish[i].direction();
      fish[i].display();
    }
  }

  sec+=0.5;
}
