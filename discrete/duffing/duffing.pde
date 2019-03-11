// Resources
// https://en.wikipedia.org/wiki/Duffing_map

// Constants
float a = 2.75, b = 0.2;

// Initial values
float x = 0.1, y = 0.1;

ArrayList<PVector> points;

void setup() {
  frameRate(60);
  size(800, 600);
  colorMode(HSB);
  background(0);
  stroke(255, 255, 255);
  strokeWeight(1);
  points = new ArrayList<PVector>();
}

void draw() {
  float _x = y;
  float _y = -b*x + a*y - y*y*y;
  
  x = _x;
  y = _y;

  translate(width/2, height/2);
  scale(2);

  point(x*80, y*80);
}
