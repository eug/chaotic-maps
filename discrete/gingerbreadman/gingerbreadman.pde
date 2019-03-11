// Resources
// https://en.wikipedia.org/wiki/Gingerbreadman_map

// Atractors
float a = 1, b = 1;

// Initial values
float x = 0.1, y = -0.1;

void setup() {
  frameRate(120);
  size(800, 600);
  colorMode(HSB);
  background(0);
  stroke(255, 255, 255);
  strokeWeight(1);
}

void draw() {
  float dx = 1 - a * y + b * abs(x);
  float dy = x;

  x = dx;
  y = dy;
  
  translate(width/2, height/2);
  point(x * 10, y * 10);
}
