Ball ballOne = new Ball(40, 100, 3, 10, 50);
Ball ballTwo = new Ball(500, 200, 3, 5, 60);
int ballOneRadius = ballOne.getSize() / 2;

void setup() {
  size(600, 700);
}

void draw() {
  background(150);
  initBallOne();
  initBallTwo();
}

void initBallOne() {
  ballOne.display();
  ballOne.update();
}

void initBallTwo() {
  ballTwo.display();
  ballTwo.update();
}
