class Astroid
{
  PVector position;
  PVector velocity;
  float size;
  float speed;
  boolean kill = false;

  Astroid()
  {
    int ranRoll = (int)random(0, 4);
    
    //TOP RIGHT GOING DOWN
    if (ranRoll == 0)
    {
      position = new PVector(random(SCREEN_WIDTH), 0);
      size = random(25,75);
      velocity = new PVector(random(-5,5),random(1,5));
    }
    else if (ranRoll == 1) // BOTTOM GOING UP
    {
      position = new PVector(random(SCREEN_WIDTH), SCREEN_HEIGHT);
      size = random(25,75);
      velocity = new PVector(random(-5,5),random(-5,-1));
    }
     else if (ranRoll == 2) // LEFT GOING RIGHT
    {
      position = new PVector(0, random(SCREEN_HEIGHT));
      size = random(25,75);
      velocity = new PVector(random(1,5),random(-5,5));
    }
    else if (ranRoll == 3) // RIGHT GOING LEFT
    {
      position = new PVector(SCREEN_WIDTH, random(SCREEN_HEIGHT));
      size = random(25,75);
      velocity = new PVector(random(-5,-1),random(-5,5));
    }
    
  }


  void Update()
  {
    fill(255);
    ellipse(position.x, position.y, size, size);
    position.add(velocity.copy().mult(TIME));


    if (position.x < 0 || position.x > SCREEN_WIDTH||
        position.y < 0 || position.y > SCREEN_HEIGHT)
    {
      kill = true;
    }
  }
}