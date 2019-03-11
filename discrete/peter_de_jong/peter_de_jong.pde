// Resources 
// http://paulbourke.net/fractals/peterdejong/
// https://www.algosome.com/articles/strange-attractors-de-jong.html


// Constants
float a = -2.24, b = 0.43, c = -0.65, d = -2.43;
//float a =  2.01, b = -2.53, c = 1.61, d = -0.33;
//float a =  -2, b = -2, c = -1.2, d = 2;
//float a = 1.641, b = 1.902, c = 0.316, d= 1.525;
//float a = 0.970, b = -1.899, c = 1.381,d = -1.506;
//float a = 1.4, b = -2.3, c = 2.4, d = -2.1;
//float a = 2.01, b = -2.53, c = 1.61, d = -0.33;
//float a = -2.7, b = -0.09, c = -0.86, d = -2.2;
//float a = -0.827, b = -1.637, c = 1.659, d = -0.943;
//float a = -2.24, b = 0.43, c = -0.65, d = -2.43;
//float a = -2, b = -2, c = -1.2, d = 2;
//float a = -0.709, b = 1.638, c = 0.452, d = 1.740;

// Initial values 
float x = 0.1,  y = 0.1;

ArrayList<PVector> points;

void setup() {
  size(800, 600);
  background(0);
  stroke(255, 255, 0);
  frameRate(60);
}

void draw() {
  float _x = (float) (Math.sin(a * y) - Math.cos(b * x));
  float _y = (float) (Math.sin(c * x) - Math.cos(d * y));
  
  x = _x;
  y = _y;

  translate(width/2+100, height/2-50);
  scale(1.5);
  
  point(x*100, y*100);
}
