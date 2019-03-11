// Resources
// https://en.wikipedia.org/wiki/Rössler_attractor
// http://www.lee-mac.com/attractors.html
// http://www.glensstuff.com/hyperrossler/hyperrossler.htm

import peasy.*;

// Constants
float a = 0.2, b = 0.2, c = 5.7;

// Initial values
float x = 0.1, y = 0, z = 0;

// Time
float dt = 0.05;

PeasyCam cam;
ArrayList<PVector> points;

void setup() {
  frameRate(60);
  size(800, 600, P3D);
  colorMode(HSB);
  background(0);
  cam = new PeasyCam(this, 500);
  points = new ArrayList<PVector>();
}

void draw() {  
  float dx = - y - z;
  float dy = x + a * y;
  float dz = b + z*(x - c);
  
  x += dx * dt;
  y += dy * dt;
  z += dz * dt;
  
  points.add(new PVector(x, y, z));
  
  noFill();
  background(0);
  translate(0, 0, 0);
  scale(5);
  stroke(25, 255, 255);
  
  beginShape();
  for (PVector p : points) {
    vertex(p.x, p.y, p.z);
  }  
  endShape();
}
