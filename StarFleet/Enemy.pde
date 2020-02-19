class Enemy
{
  PVector position;
  PVector acceleration;
  PVector direction;
  float speed= 3;
  float health;
  float size;
  float maxHealth;
  boolean kill = false;
  boolean isTarget = false;
  
  Enemy()
  {
     position = new PVector(0,0);
   acceleration= new PVector(0,0);
   direction= new PVector(0,0);
   health = 10;
   maxHealth=10;
   size = 40;
  }
  
  
  void Update()
  {
    /*fill(255,0,0);
    rect(position.x-10, position.y-20,20,10);
    fill(0,255,0);
    float healthBarLength = map(health,0,maxHealth,0,20);
    rect(position.x-10, position.y-20,healthBarLength,10);*/
  }
  
  boolean CheckCollision(PVector _o, float _oSize) // object position
  {
    float d = dist(position.x, position.y, _o.x, _o.y);
    
    if(d < size/2 + _oSize/2)
    {
      return true;
    }
    return false;
  }
  
  
  void TakeDamage(float _d)
  {
    health -= _d;
    
    if(health <=0)
    {
      kill = true;
      if(isTarget)
      {
        m.ClearTarget();
      }
    }
  }
  
}