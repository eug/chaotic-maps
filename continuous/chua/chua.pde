// Resources
// https://en.wikipedia.org/wiki/Chua%27s_circuit

import peasy.*;

// Constants
float alpha = 15.6, beta = 28.58, gamma = 0, m0 = -1.143, m1 = -0.714;

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
  float fx = m1 * x + 0.5 * (m0 - m1) * (Math.abs(x + 1) - Math.abs(x - 1));
  float dx = alpha * (y - x - fx);
  float dy = x - y + z;
  float dz = -beta * y - gamma * z;
  
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
