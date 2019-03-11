// Resource
// https://en.wikipedia.org/wiki/Van_der_Pol_oscillator

// Constant
float mu = 2;

// Initial value
float x = 0.1, y = 0.1;

// Time
float dt = 0.1;

// Animation control
int max_trail_size = 50;

ArrayList<PVector> points;

void setup() {
  frameRate(30);
  size(800, 600);
  colorMode(HSB);
  points = new ArrayList<PVector>();
}

void draw() {
  float dx = mu * (x - (float) Math.pow(x, 3)/3 - y);
  float dy = x / mu;
  
  x += dx * dt;
  y += dy * dt;
  
  points.add(new PVector(x, y));
  
  if (points.size() > max_trail_size) {
    points.remove(0);
  }
  
  background(0);
  translate(width/2, height/2);
  scale(10);
  stroke(255);
  strokeWeight(1);
  noFill();
  
  float hu = 0;
  float hu_inc = 0.1;
  
  float alpha = 0;
  float alpha_inc = 255 / (float) points.size();
  
  for (int i = 0; i < points.size(); i++) {
    PVector p = points.get(i);
    stroke(255, 255, 255, alpha);
    point(p.x * 10, p.y * 10);
    
    alpha += alpha_inc;
    hu += hu_inc;

    if (hu > 255) hu = 0;
  }
}
