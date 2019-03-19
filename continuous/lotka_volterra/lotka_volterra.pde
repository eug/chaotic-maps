// Resources
// https://en.wikipedia.org/wiki/Lotka%E2%80%93Volterra_equations

import peasy.*;

// Constants
float alpha = 0.67, beta = 1.33, delta = 1, gamma = 1;

// Initial values
float x = 0.9, y = 1.8;

// Time
float dt = 0.03;


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
  float dx = alpha*x - beta*x*y;
  float dy = delta*x*y - gamma*y;

  x += dx * dt;
  y += dy * dt;

  points.add(new PVector(x, y));

  noFill();
  background(0);
  stroke(250, 100, 255);
  strokeWeight(2);
  translate(0, 0, 0);

  beginShape();
  for (PVector p : points) {
    vertex(p.x*10, p.y*10);
  }
  endShape();
}
