class Spaceship
{
  PVector position;
  PVector velocity;
  PVector destination;

  boolean hit = false;

  PVector damageVector;
  float size = 3;
  float distFromMom;

  String name;
  float health;
  float armor;

  boolean kill = false;


  float rotDelta;
  float deg;
  float Xdir=1;

  float speed = 2;



  Spaceship(PVector spawnPos)
  {
    deg =random(0, 360);
    position = spawnPos.copy();
    distFromMom = random(40, 300);
    velocity = new PVector(random(-10, 10), random(-10, 10));
    destination = new PVector(0, 0);
    rotDelta = random(-PI/60, PI/60);
    damageVector = new PVector(0, 0);
  }

  Spaceship()
  {
    deg =0;
    position = new PVector(0, 0);
    distFromMom = 100;
    velocity = new PVector(random(-10, 10), random(-10, 10));
    destination = new PVector(0, 0);
    rotDelta = random(-PI/60, PI/60);
  }



  void CheckAstroid(Astroid a)
  {
    if (dist(position.x, position.y, a.position.x, a.position.y) < size/2 + a.size/2)
    {
      
        kill = true;
        particleManager.add(new ParticleSystem(10,position.x, position.y));
    }
  }
  
  void Explode()
  {
    particleManager.add(new ParticleSystem(10,position.x, position.y));
  }
  void Update()
  {



    PVector mother = new PVector(m.position.x, m.position.y);  
    PVector dest = new PVector(mother.x+cos(deg)*distFromMom, mother.y+sin(deg)*distFromMom);


   
    deg+= rotDelta;
          PVector dir = dest.sub(position);
      //position.x = mother.x+cos(deg)*distFromMom;
      //position.y = mother.y+sin(deg)*distFromMom;
      dir.normalize();
      dir.mult(speed);
    
      velocity.add(dir);

    velocity.limit(5);

    position.add(velocity.mult(TIME));
    //position.add(velocity);


    fill(255);
    rect(position.x, position.y, size, size);
  }
}