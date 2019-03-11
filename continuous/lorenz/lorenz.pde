// Resources
// https://en.wikipedia.org/wiki/Lorenz_system

import peasy.*;

// Constants
float sigma = 10, rho = 28, beta = 8.0 / 3.0;

// Initial values
float x = 0.1;
float y = 0.1;
float z = 0.1;

// Time
float dt = 0.01;


ArrayList<PVector> points;
PeasyCam cam;

void setup() {
  frameRate(60);
  size(800, 600, P3D);
  colorMode(HSB);
  cam = new PeasyCam(this, 500);
  points = new ArrayList<PVector>();
}

void draw() {
  float dx = sigma * (y - x);
  float dy = x * (rho - z) - y;
  float dz = x * y - beta * z;
  
  x += dx * dt;
  y += dy * dt;
  z += dz * dt;
  
  points.add(new PVector(x, y, z));

  noFill();
  background(0);
  stroke(25, 255, 255);
  translate(0, 0, -80);
  scale(5);

  beginShape();
  for (PVector p : points) {
    vertex(p.x, p.y, p.z);
  }
  endShape();
}
