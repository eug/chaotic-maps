// Resources
// https://en.wikipedia.org/wiki/Hénon_map

// Constants
float a = 1.4, b = 0.3;

// Initial values
float x = 1, y = 1;

void setup() {
  frameRate(60);
  size(800, 600);
  colorMode(HSB);
  background(0);
  stroke(200, 255, 255);
  strokeWeight(1);
}

void draw() {
  float _x = 1 - a*x*x + y;
  float _y = b*x;
  
  x = _x;
  y = _y;
  
  translate(width/2, height/2);
  scale(2);
  
  point(x*100, y*100);
}
