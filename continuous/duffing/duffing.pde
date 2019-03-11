// Resources
// http://www.lee-mac.com/attractors.html

import peasy.*;

// Constants
float alpha = 1, beta = -1, delta = 0.2, gamma = 0.3, omega = 1;

// Initial values
float x = 0, y = 0, t = 0;

// Time variation
float dt = 0.04;


PeasyCam cam;
ArrayList<PVector> points;

void setup() {
  frameRate(60);
  size(800, 600, P3D);
  colorMode(HSB);
  background(0);
  stroke(200, 255, 255);
  strokeWeight(1);
  cam = new PeasyCam(this, 500);
  points = new ArrayList<PVector>();
}

void draw() {  
  float dx = y;
  float dy = -delta*y -beta*x - alpha*x*x*x + gamma * (float) Math.cos(omega*t);
  
  x += dx * dt;
  y += dy * dt;
  
  t += dt;
  
  points.add(new PVector(x, y));
  
  noFill();
  background(0);
  translate(0, 0, 0);
  scale(2);
  
  beginShape();
  for (PVector p : points) {
    vertex(p.x*10, p.y*10);
  }
  endShape();
}
