// Resources
// https://en.wikipedia.org/wiki/Hindmarsh-Rose_model
// https://www.sciencedirect.com/science/article/pii/S0898122111002975

import peasy.*;

// Constants
float a = 1, b = 3, c = 1, d = 5, s = 4, xr = -1.6, r = 0.006, I = 3.2;

// Initial values
float x = 0.1, y = 0.1, z = 0.1;

// Time
float dt = 0.02;


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
  float dx = y + (-a*x*x*x + b*x*x) - z + I;
  float dy = c - d*x*x - y;
  float dz = r * (s * (x - xr) - z);

  x += dx * dt;
  y += dy * dt;
  z += dz * dt;

  points.add(new PVector(x, y, z));

  noFill();
  background(0);
  stroke(52, 152, 219);
  translate(0, 0, 0);

  beginShape();
  for (PVector p : points) {
    vertex(p.x*10, p.y*10, p.z*10);
  }
  endShape();
}
