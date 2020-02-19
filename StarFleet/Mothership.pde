class Mothership
{

  int MAX_FLEET_NUM = 10000;
  Spaceship[] Fleet = new Spaceship[MAX_FLEET_NUM];

  PVector destination;
  int money = 10000000;
  float size = 25;


  PVector position;
  PVector velocity;

  float lastSpawned=-999;
  float spawnCooldown = 10000;


  float MAX_SPEED = 2.25;

  int lastFired = -999;
  int gunCooldown = 30;//3000;

  boolean isLockedOn = false;


  Mothership()
  {
    position = new PVector(400, 400);
    velocity = new PVector(0, 0);

    destination = position.copy();

    Fleet[0] = new Spaceship();
  }




  void Update()
  {
    fill(255);
    textSize(20);
    text(money, 50, 50);
    noStroke();


    rect(position.x, position.y, size, size);
    stroke(0);

    if (dist(destination.x, destination.y, position.x, position.y) > 1)
    {
      PVector mouse = destination.copy();
      PVector dir = mouse.sub(position).copy();

      dir.normalize();

      velocity.add(dir);
      velocity.limit(MAX_SPEED);
      position.add(velocity.mult(TIME));
    }

    UpdateFleet();

    if (millis() - lastSpawned > spawnCooldown)
    {
      lastSpawned = millis();
      AddShip();
    }

    Fire();
  }

  void ManualFire(PVector mouse)
  {
    if (millis() - lastFired > gunCooldown)
    {
      bulletManager.add(new Bullet(mouse.x, mouse.y, position.x, position.y));
      lastFired = millis();
    }
  }
  

  void Fire()
  {
    if (isLockedOn)
    {
      if (millis() - lastFired > gunCooldown)
      {
        bulletManager.add(new Bullet(targetIndi.position.x, targetIndi.position.y, position.x, position.y));
        lastFired = millis();
      }
    }
  }
  void UpdateFleet()
  {
    for (int i=0; i < Fleet.length; i++)
    {
      if (Fleet[i] != null)
      {
        for (Astroid a : astroidManager)
        {
          Fleet[i].CheckAstroid(a);
        }


        Fleet[i].Update();


        if (Fleet[i].kill)
        {
          Fleet[i] = null;
        }
      }
    }
  }




  void SetDestination(float dx, float dy)
  {
    destination = new PVector(dx, dy);
  }
  void AddShip()
  {
    if (money >=50) 
    {
      money -= 50;
      for (int i=0; i < Fleet.length; i++)
      {
        if (Fleet[i] == null)
        {
          Fleet[i] = new Spaceship(position);
          break;
        }
      }
    }
  }


  void ClearTarget()
  {
    isLockedOn=false;
    targetIndi.position = new PVector(-1000, 0);
  }

  PVector getPosition()
  {
    return position;
  }
}