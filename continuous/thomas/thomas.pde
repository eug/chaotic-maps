// Resources
// https://en.wikipedia.org/wiki/Thomas%27_cyclically_symmetric_attractor

import peasy.*;

// Constants
float b = 0.18;

// Time
float dt = 0.1;

// Animation Control
int num_particles = 10;

PeasyCam cam;
ArrayList<Particle> particles;

class Particle {
  float x, y, z;
  int red, green, blue;
  ArrayList<PVector> points;
  
  Particle(float x, float y, float z) {
    this.x = x;
    this.y = y;
    this.z = z;
    points = new ArrayList<PVector>();
  }
  
  void setRGB(int r, int g, int b) {
    this.red = r;
    this.green = g;
    this.blue = b;
  }
  
  void update() {
    float dx = (float) Math.sin(this.y) - b * this.x;
    float dy = (float) Math.sin(this.z) - b * this.y;
    float dz = (float) Math.sin(this.x) - b * this.z;
    
    this.x += dx * dt;
    this.y += dy * dt;
    this.z += dz * dt;

    points.add(new PVector(this.x, this.y, this.z));
    
    noFill();
    stroke(this.red, this.green, this.blue);

    beginShape();
    for (PVector p : points) {
      vertex(p.x*10, p.y*10, p.z*10);
    }
    endShape();
  }
}

void setup() {
  frameRate(60);
  size(800, 600, P3D);
  colorMode(RGB);
  background(0);
  cam = new PeasyCam(this, 500);
  particles = new ArrayList<Particle>();
  
  for (int i = 1; i <= num_particles; i++) {
    Particle particle = new Particle(0.1 * i, 0.0, 0.0);
    int v = (int) random(100, 255);
    particle.setRGB(v, v, v);
    particles.add(particle);
  }
}

void draw() {
  background(0);
  strokeWeight(2);
  for (Particle particle : particles) {
    particle.update();
  }
}
