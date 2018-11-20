Particle[] particles;

void setup()
{
  size(600,600);
  background(0);
  rectMode(CENTER);
  particles = new Particle[1000];
  particles[0] = new OddballParticle();
  for (int i = 0; i < particles.length;i++) {
    particles[i] = new NormalParticle(width/2,height/2);
  }
}

void draw()
{
  for (int i = 0; i < particles.length; i++) {
    particles[i].move();
  }
}

class NormalParticle implements Particle {
  int x, y, angle, speed;
  NormalParticle(int x, int y) {
    x = 2;
    y = 3;
    angle = 60;
    speed = 40;
  }
  
  public void move() {
    x += cos(angle)*(speed);
    y += sin(angle)*(speed);
  }
  
  public void show() {
    fill(25);
    ellipse((float)x, (float)y, 5, 5);
  }
}

interface Particle
{
  public void move();
  public void show();
}

class OddballParticle implements Particle {
  int x, y;
  color c;
  OddballParticle() {
    x = width/2;
    y = height/2;
    c = color(
      (int)(Math.random()*256),
      (int)(Math.random()*256),
      (int)(Math.random()*256)
    );
  }
  public void move() {
    x += (int)(Math.random()*51) - 25;
    y += (int)(Math.random()*51) - 25;
    show();
  }
  
  public void show() {
    ellipseMode(CENTER);
    fill(c, 200);
    ellipse(x,y,50,20);
  }
}

class JumboParticle //uses inheritance
{
  JumboParticle() {
    
  }
}
