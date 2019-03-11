// Resources
// https://en.wikipedia.org/wiki/Ikeda_map

// Constant
float u = 0.918;

// Animation control
int max_iter = 1000;
int num_particles = 100;


int iter;
ArrayList<Particle> particles;

class Particle {
  float x, y, t;
  
  Particle(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void update() {
    float _x = 1 + u * (x * cos(t) - y * sin(t));
    float _y = u * (x * sin(t) + y * cos(t));
    float _t = 0.4 - 6 / (1 + _x*_x + _y*_y);
    this.x = _x;
    this.y = _y;
    this.t = _t;
    point(_x * 10, _y * 10);
  }
}

void setup() {
  smooth();
  frameRate(60);
  size(800, 600);
  colorMode(HSB);
  background(0);
  stroke(255);
  strokeWeight(1);
  
  iter = 0;
  particles = new ArrayList<Particle>();
  for (int i = 0; i < num_particles; i++) {
    particles.add(new Particle(random(100), random(100)));
  }
}

void draw() {
  if (iter >= max_iter) return;
  iter += 1;
  
  translate(width/2, height/2);
  scale(1.5);

  for (int i = 0; i < num_particles; i++) {
    Particle particle = particles.get(i);
    particle.update();
  }
}
