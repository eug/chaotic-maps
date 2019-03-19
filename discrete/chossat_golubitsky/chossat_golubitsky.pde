// References
// https://ayumu-nagamatsu.com/archives/431/
// https://pdfs.semanticscholar.org/eff8/ced80f119541c31af5ddc2f7e65019f9b501.pdf

// Constants
//float a = -1.0, b = 0.05, c = 2.275,  d = -0.5;
//float a =  1.0, b = 0.0,  c = - 2.25, d = 0.2;
//float a =  1.0, b = 0.0,  c = - 1.9,  d = 0.4;
float a = -1.0, b = 0.1,  c = 1.52,   d = -0.8;
//float a = -1.0, b = 0.1,  c = 1.6,    d = -0.8;
//float a =  2.,  b = -0.2, c = - 1.75, d = 1.;
//float a = -2.0, b = 0.0, c = 2.6, d = -0.5;

// Initial values
float x = 0.1, y = 0.1;

void setup() {
  frameRate(60);
  size(800, 600);
  background(0);
  stroke(50, 255, 50);
}
 
void draw() {
  for (int i = 0; i < 100; i++) {
 
    float A = a * (x * x + y * y) + b * x * (x * x - 3 * y * y) + c;
    float _x = A * x + d * (x * x - y * y);
    float _y = A * y - 2 * d * x * y;
    
    x = _x;
    y = _y;
    
    point(x * 200 + width/2, y * 200 + height/2);
  } 
}
