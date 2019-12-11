int x = 100;
int y = 100;
int change_value = 1;
int edge_end = 30/2;

void setup() {
  size(200, 200);
}

void draw() {
  background(300);
  ellipse(x, y , 30, 30);
  y += change_value;
  
  if (y > height - edge_end || y == 0 + edge_end) change_value *= -1;
}
