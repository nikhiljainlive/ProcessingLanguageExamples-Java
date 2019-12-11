int x_pos = 100;
int y_pos = 100;
int ball_width = 30;
int ball_height = 30;
int edge_end = ball_width / 2;
int change_value1 = 1;
int change_value2 = 2;

BallObject ballObj1 = new BallObject(x_pos, y_pos);
BallObject ballObj2 = new BallObject(x_pos, y_pos);

void setup() {
  size(200, 200);
}

void draw() {
  background(450);
  //ellipse(x_pos, y_pos, ball_width, ball_height);
  //x_pos += change_value;
  //if (x_pos == width - edge_end || x_pos < edge_end) {
  //   change_value *= -1;
  //}
  
  ballObj1.display();
  ballObj1.move(change_value1);
  
  if (ballObj1.getY() > width - edge_end || ballObj1.getY() < edge_end) {
      change_value1 *= -1;
  }
  
  ballObj2.display();
  ballObj2.move(change_value2);
  
  if (ballObj2.getY() > width - edge_end || 
  ballObj2.getY() < edge_end) {
      change_value2 *= -1;
  }
  
  if (ballObj1.getY() == ballObj2.getY() - edge_end ||
  ballObj2.getX() == ballObj1.getX() + edge_end) {
    change_value2 *= -1;
  }
}
