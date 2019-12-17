int x = 0;
int y = 0;
int changeValue = 1;

void setup() {
  size(720, 640, P3D);  // Specify P3D renderer
  x = width / 2;
  y = height / 2;
}

void draw() {
  background(153);

  // With P3D, we can use z (depth) values...
  line(0, 0, 0, width, height, -100);
  line(width, 0, 0, width, height, -100);
  line(0, height, 0, width, height, -100);

  //...and 3D-specific functions, like box()
  translate(x, y);
  rotateX(PI/6);
  rotateY(PI/6);
  box(35);
  
  x += changeValue;
  y += changeValue;
  
  if(x <= 100 || x >= width - 100) changeValue *= -1; 
}
