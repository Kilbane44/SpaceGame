class Bullet
{
  
  PVector position;
  PVector direction;
  float speed = 10;
  float size=5;
  float damage = 2;
  color c;
  boolean kill = false;


  Bullet()
  {
    position = new PVector(width/2, height/2);
    direction = new PVector(1, 0);
  }

  //     Target X   Y           Origin X    Y
  Bullet(float _tX, float _tY, float _oX, float _oY)
  {

    position = new PVector(_oX, _oY);   
    direction = new PVector(_tX - position.x, _tY - position.y);
    direction.normalize();
    direction.mult(speed);
    c = color(random(82, 150), 200, 255);
  }
  
  Bullet(float _tX, float _tY, float _oX, float _oY, float _damage)
  {

    position = new PVector(_oX, _oY);   
    direction = new PVector(_tX - position.x, _tY - position.y);
    direction.normalize();
    direction.mult(speed);
    c = color(random(82, 150), 200, 255);
    damage = _damage;
  }

  void Update()
  {

    fill(c);
    ellipse(position.x, position.y, size, size);
    position.add(direction.copy().mult(TIME));

  
    if (position.x < 0 || position.x > SCREEN_WIDTH||
        position.y < 0 || position.y > SCREEN_HEIGHT)
    {
      kill = true;
    }
  }
}