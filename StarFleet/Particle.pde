class Particle {

  PVector velocity;
  PVector pos;
  float lifespan = 100;

  float partSize;

  PVector gravity = new PVector(0, 0);


  Particle(float x, float y) {

    pos = new PVector(x, y);
    partSize = random(2, 5);
    //part = createShape();
    //part.beginShape(QUAD);
    //part.noStroke();
    //part.texture(sprite);
    //part.normal(0, 0, 1);
    //part.vertex(-partSize/2, -partSize/2, 0, 0);
    //part.vertex(+partSize/2, -partSize/2, sprite.width, 0);
    //part.vertex(+partSize/2, +partSize/2, sprite.width, sprite.height);
    //part.vertex(-partSize/2, +partSize/2, 0, sprite.height);
    //part.endShape();

    float a = random(TWO_PI);
    float speed = random(0.5, 4);
    velocity = new PVector(cos(a), sin(a));
    velocity.mult(speed);
       



    lifespan = random(100);
  }

  //PShape getShape() {
  //  return part;
  //}

  void rebirth(float x, float y) {
    float a = random(TWO_PI);
    float speed = random(0.5, 4);
    velocity = new PVector(cos(a), sin(a));
    velocity.mult(speed);
    lifespan = 255;   

  }

  boolean isDead() {
    if (lifespan < 0) {
      return true;
    } else {
      return false;
    }
  }


  public void display()
  {
    noStroke();
    fill(255,0,0);
    ellipse(pos.x, pos.y, partSize, partSize);
    pos.add(velocity);
    stroke(0);
  }
  public void update() {
    lifespan = lifespan - 1;
    //velocity.add(gravity);
    // pos.add(velocity);

  }
}