class Indicator
{
  
  
  PVector position;
  color c;
  Indicator(int type)
  {
    if(type == 0)
    {
      c = color(255,0,255);
    }
    else
    {
      c = color(255,0,0);
    }
    position = new PVector(-100,0);
  }
  
  void Render()
  {
    fill(c);
    rect(position.x, position.y, 15,15);
  }
  
  void UpdatePosition(float x, float y)
  {
    position = new PVector(x,y);
  }
}