class Planet
{
  PVector position;
  color c;
  float size;
  
  Planet(float x, float y)
  {
    c = color(0,55,220);
    position = new PVector(x,y);
    size= 150;
  }
  
  
  void Update()
  {
    fill(c);
    ellipse(position.x, position.y, size, size);
  }
}