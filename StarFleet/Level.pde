class Level
{
  int ID =0;
  int startTime;
  
  boolean isActive = false;
  
  int astroidSpawnDelay=500;
  int lastAstroidSpawnedTime=0;
  
  ArrayList<Planet> Galaxy = new ArrayList<Planet>();
  
  Level()
  {
    for(int i=0; i<200; i++)
    {
      Galaxy.add(new Planet(random(-width*10,width*10),random(-(height*10),height*10)));
    }
  }
  
  void Update()
  {
    if(ID == 0)
    {
      textAlign(CENTER);
      fill(255,0,0);
      textSize(30);
      text("SURVIVE",width/2, height/2);
      
      if((millis() - startTime) - lastAstroidSpawnedTime >astroidSpawnDelay)
      {
        lastAstroidSpawnedTime = millis() - startTime;
        astroidSpawnDelay-=5;
        astroidManager.add(new Astroid());
        astroidManager.add(new Astroid());
      }
    }
    
    
    for(Planet planet: Galaxy)
    {
      planet.Update();
    }
  }
  
  
  void Begin()
  {
    if(!isActive)
    {
      isActive = true;
      startTime = millis();
    }
  }
  
  void Run()
  {
    
    text(astroidSpawnDelay,500,100);
    Begin();
    Update();
  }
  
}