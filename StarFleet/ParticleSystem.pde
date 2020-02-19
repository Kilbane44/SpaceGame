class ParticleSystem {
  ArrayList<Particle> particles;

  PShape particleShape;
  
  int lifeTime;
  int spawnTime;
  boolean kill = false;

  ParticleSystem(int n, float x, float y) {
    particles = new ArrayList<Particle>();
    particleShape = createShape(PShape.GROUP);

    for (int i = 0; i < n; i++) {
      Particle p = new Particle(x,y);
      particles.add(p);
      
    }
    spawnTime = millis();
    lifeTime = (int)random(250);
  }

  void update() {
    for (Particle p : particles) {
      p.update();
    }
    
    if(millis() - spawnTime > lifeTime)
    {
      kill = true;
    }
  }

  void setEmitter(float x, float y) {
    for (Particle p : particles) {
      if (p.isDead()) {
        p.rebirth(x, y);
      }
    }
  }

  void display() {
    for (Particle p : particles) {
      p.display();
    }
    //shape(particleShape);
  }
}