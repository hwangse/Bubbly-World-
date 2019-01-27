class SeaWeed
{
  float DIST_MAX;//length of each segment 
  float maxNbSeg = 55;//max number of segments
  float minNbSeg = 15;//min number of segments
  float maxWidth = 30;//max width of the base line
  float minWidth = 11;//min width of the base line
  float FLOTATION = 5;//flotation constant
  float grow_speed;

  int nbSegments = (int)random(minNbSeg, maxNbSeg);//number of segments
  PVector[] pos;//position of each segment
  color[] cols;//colors array, one per segment
  color main_col;
  PVector rootNoise = new PVector(random(100), random(100));//noise water effect
  float x;//x origin of the weed

  SeaWeed(float p_x, float p_y, float dist_max)
  {
    pos = new PVector[nbSegments];
    DIST_MAX=dist_max;
    grow_speed=random(0.04, 0.07);
    main_col=color(random(0, 120), random(120, 255), random(0, 120));
    x = p_x;
    for (int i = 0; i < nbSegments; i++)
    {
      pos[i] = new PVector(p_x, p_y - i * DIST_MAX);
      // pos[i] = new PVector(p_x, p_y);
    }
  }
  void increase_dist() {
    if (DIST_MAX<12)
      DIST_MAX+=grow_speed*0.5;
  }
  void decrease_dist() {
    if (DIST_MAX+0.04>0)
      DIST_MAX-=grow_speed*0.8;
  }

  void update()
  {
    rootNoise.add(new PVector(.02, .02));

    pos[0] = new PVector(x, height);
    for (int i = 1; i < nbSegments; i++)
    {
      float n = noise(rootNoise.x + .003 * pos[i].x, rootNoise.y + .003 * pos[i].y);
      float noiseForce = (.3 - n) * 4;
      pos[i].x += noiseForce;
      pos[i].y -= FLOTATION;

      //difference
      PVector tmp = PVector.sub(pos[i-1], pos[i]);
      tmp.normalize();
      tmp.mult(DIST_MAX);
      pos[i] = PVector.sub(pos[i-1], tmp);
    }

    //drawing circles
    for (int i = 0; i < nbSegments; i++)
    {
      fill(main_col);
      float r = (30 * cos(map(i, 0, nbSegments - 1, 0, HALF_PI)));
      noStroke();
      ellipse(pos[i].x, pos[i].y + 10, r, r);
    }
  }
}
