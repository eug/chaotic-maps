// Resources
// https://en.wikipedia.org/wiki/Tinkerbell_map

// Constants
float a = 0.9, b = -0.6013, c = 2.0, d = 0.5;

// Initial values
float x = -0.72, y = -0.64;

void setup() {
  frameRate(60);
  size(800, 600);
  colorMode(HSB);
  background(0);
  stroke(20, 255, 255);
  strokeWeight(1);
}

void draw() {

  float _x = x*x - y*y + a*x + b*y;
  float _y = 2*x*y + c*x + d*y;
  
  x = _x;
  y = _y;
  
  translate(width/2+50, height/2+50);
  scale(1.5);
  
  point(x*100, y*100);
}
