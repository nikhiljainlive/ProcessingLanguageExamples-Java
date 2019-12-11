int fromX = 0;
int toX = 50;
int difference = toX - fromX;

void setup() {
  size(640, 480);
  frameRate(3);
}

void draw() {
  background(0);
  makeLine(100);
  makeLine(150);
  makeLine(200);
  makeLine(250);
  makeLine(300);
  makeLine(350);

  fromX += difference;
  toX += difference;

  System.out.println("to X : " + toX + "width : " + width);
  if (toX > width) {
    fromX = 0;
    toX = 50;
  }
}

void makeLine(int y) {
  stroke(255);
  line(fromX, y, toX, y);
}
