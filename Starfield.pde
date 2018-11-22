/* Particles by Gabby S.
For CS 12
November 2018 */

Particle[] particles;

void setup() {
  size(600,600);
  background(0);
  rectMode(CENTER);
  particles = new Particle[1000];
  particles[0] = new OddballParticle();
  //particles[1] = new JumboParticle();
  for (int i = 1; i < particles.length;i++) {
    particles[i] = new NormalParticle(width/2,height/2);
    particles[i] = new JumboParticle(width/2,height/2);
  }
}

void draw() {
  background(0);
  for (int i = 0; i < particles.length; i++) {
    particles[i].move();
  }
}

class NormalParticle implements Particle {
  int x, y, angle, speed;
  color c;
  NormalParticle(int x, int y) {
    this.x=x;
    this.y=y;
    this.angle=(int)(Math.random()*2*Math.PI);
    this.speed=(int)(Math.random()*25);
    this.c = color(
      (int)(Math.random()*256),
      (int)(Math.random()*256),
      (int)(Math.random()*256)
    );
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

class JumboParticle extends NormalParticle {
  JumboParticle(int x, int y) {
    super(x,y);
  }
    public void show() {
      fill(c);
      ellipse((float)x, (float)y, 25,25);
    }
    
    public void move() {
      x += cos(angle)*(speed);
      y += sin(angle)*(speed)*22;
      show();
  }
  
}
