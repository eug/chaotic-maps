// Resources
// https://en.wikipedia.org/wiki/Kaplan%E2%80%93Yorke_map

// Constant
float alpha = 0.2;

// Initial values
float x = 0.367812, y = 0.667751;

void setup() {
  frameRate(60);
  size(800, 600, P3D);
  colorMode(HSB);
  background(0);
  stroke(20, 255, 255);
  strokeWeight(1);
}

void draw() {
  float _x = 2*x % 0.99995;
  float _y = alpha*y + cos(4*PI*x);
  
  x = _x;
  y = _y;
  
  translate(width/2- 100, height/2);
  scale(2);

  point(x*100, y*100);
}
