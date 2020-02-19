class Drone extends Enemy
{
  
  Drone()
  {
    super();
    position = new PVector(random(SCREEN_WIDTH), random(SCREEN_HEIGHT));
    health = 100;
    speed = 1;
    size = 8;
  }
  
  
  void Update()
  {
    PVector playerPos = m.getPosition().copy();
    direction = playerPos.sub(position);
    direction.normalize();
    direction.mult(speed);
    
    position.add(direction.mult(TIME));
    
    
    fill(0,255,255);
    ellipse(position.x, position.y, size,size);
    
    super.Update();
  }
}