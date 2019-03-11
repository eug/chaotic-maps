// Resource
// https://en.wikipedia.org/wiki/Zaslavskii_map

// Constants
float v = 0.2, e = 5, r = 2;
float mu = (1 - (float) Math.exp(-r)) / r;

// Initial value
float x = 1, y = 0.1;

// Animation control
int num_particles = 1000;

ArrayList<Particle> particles;

class Particle {
  float x, y;
  
  Particle(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void update() {
    float cos_2pi_x = (float) Math.cos(2*PI*x);
    float _x = (x + v * (1 + mu*y) + e * v * mu * cos_2pi_x) % 0.999995;
    float _y = (float) Math.exp(-r) * (y + e * cos_2pi_x);
    this.x = _x;
    this.y = _y;
    point(_x * 500, _y * 500);
  }
}


void setup() {
  size(800, 800);
  background(0);
  stroke(124, 155, 255);
  
  particles = new ArrayList<Particle>();
  for (int i = 0; i < num_particles; i++) {
    particles.add(new Particle(random(50), random(50)));
  }
}

void draw() {

  translate(width/2-250, height/2);

  for (int i = 0; i < num_particles; i++) {
    Particle particle = particles.get(i);
    particle.update();
  }
}
