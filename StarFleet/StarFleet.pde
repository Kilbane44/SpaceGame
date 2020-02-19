Mothership m = new Mothership();

float scale = 1;
float xPan = 1;
float yPan = 1;

float SCREEN_WIDTH =0;
float SCREEN_HEIGHT =0;

float TIME = 1;
boolean CAMERA_ZOOM = true;


Indicator movementIndi = new Indicator(0);
Indicator targetIndi = new Indicator(1);
ArrayList<Enemy> enemyManager = new ArrayList<Enemy>();
ArrayList<Bullet> bulletManager = new ArrayList<Bullet>();
ArrayList<Astroid> astroidManager = new ArrayList<Astroid>();
ArrayList<ParticleSystem> particleManager = new ArrayList<ParticleSystem>();
Level lvl;


Planet Earth;

void setup()
{
  //size(800, 800);
  fullScreen(P3D);
  rectMode(CENTER);
  imageMode(CENTER);

  SCREEN_WIDTH = width/scale;
  SCREEN_HEIGHT = height/scale;
  Earth = new Planet(800, 500);
  for (int i=0; i < 5; i++)
  {
    enemyManager.add(new Drone());
  }
  lvl = new Level();
}



void draw()
{

  background(0);
  SCREEN_WIDTH = width/scale;
  SCREEN_HEIGHT = height/scale;
  
  if (!CAMERA_ZOOM)
  {
   // translate(-xPan, -yPan);
    translate(m.position.x,m.position.y);
    scale(scale);
    
  }
  //fill(0,10);
  //rect(width/2,height/2,width,height);
  lvl.Run(); 
  m.Update(); 
  Earth.Update();
  movementIndi.Render();
  targetIndi.Render();
  UpdateEnemies();
  UpdateBullets();
  UpdateAstroids();
  UpdateParticles();
}


void UpdateParticles()
{
  for (int i= particleManager.size()-1; i >=0; i--)
  {
    ParticleSystem currPS = particleManager.get(i);
    currPS.update();
    currPS.display();

    if (currPS.kill)
    {

      particleManager.remove(i);
    }
  }
}


void UpdateAstroids()
{
  for (int i= astroidManager.size()-1; i >=0; i--)
  {
    Astroid a = astroidManager.get(i);
    a.Update();

    if (a.kill)
    {
      astroidManager.remove(i);
    }
  }
}


void UpdateBullets()
{
  for (int i= bulletManager.size()-1; i >=0; i--)
  {
    Bullet b = bulletManager.get(i);
    b.Update();

    if (b.kill)
    {
      bulletManager.remove(i);
    }
  }
}




void UpdateEnemies()
{
  for (int i= enemyManager.size()-1; i >=0; i--)
  {
    Enemy e = enemyManager.get(i);
    e.Update();

    for (int ship = 0; ship < m.Fleet.length; ship++)
    {
      if (m.Fleet[ship] != null)
      {
        Spaceship s = m.Fleet[ship];
        if (e.CheckCollision(s.position, s.size))
        {
          s.Explode();
          s.kill= true;

          e.TakeDamage(5);
        }
      }
    }

    for (int bullet =0; bullet < bulletManager.size(); bullet++)
    {
      if (bulletManager.get(bullet) != null)
      {
        Bullet b = bulletManager.get(bullet) ;
        if (e.CheckCollision(b.position, b.size))
        {
          b.kill= true;
          e.TakeDamage(110);
        }
      }
    }
    if (e.kill)
    {
      enemyManager.remove(i);
    }
  }
}


void mouseClicked()
{
  PVector mouse = new PVector(mouseX/scale, mouseY/scale);
  //clicked
  boolean enemyClicked = false;
  int enemyIndex = -1;

  if (mouseButton == RIGHT)
  {
    m.SetDestination(mouse.x, mouse.y);
    movementIndi.UpdatePosition(mouse.x, mouse.y);
  } else
  {
    for (int i=0; i < enemyManager.size(); i++)
    {
      Enemy e = enemyManager.get(i);

      if (e.CheckCollision(mouse, 30))
      {
        enemyClicked = true;
        targetIndi.position = e.position;
        enemyIndex = i;
        e.isTarget = true;
        m.isLockedOn = true;
        break;
      }
    }

    if (enemyClicked)
    {
    } else
    {
      if (dist(mouse.x, mouse.y, m.position.x, m.position.y) < m.size/2)
      {
        println("Mom clicked");
      } else
      {
        m.ManualFire(mouse);
      }
    }
  }
}


void keyPressed()
{
  if (key ==' ')
  {
  }
  if (key =='1')
  {
    for (int i=0; i< 100; i++)
    {
      m.AddShip();
    }
  }
  if (key =='e')
  {
    for (int i=0; i< 10; i++)
    {
      enemyManager.add(new Drone());
    }
  }
  if (key == 'a')
  {
    astroidManager.add(new Astroid());
  }

  if (key == 'm')
  {
  }
  if (key == 't')
  {
    TIME+=.2;
    if (TIME > 1)
    {
      TIME =0;
    }
  }


  if (key == 's')
  {
    scale -=.1;

    if (scale < .2)
    {
      scale = 1;
    }
  }
  
  if (key == '0')
  {
    scale = .05;
  }

  if (key == 'c')
  {
    CAMERA_ZOOM = !CAMERA_ZOOM;
  }
}