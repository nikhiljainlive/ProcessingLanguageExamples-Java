Ball[] balls = new Ball[10];

void setup() {
  size(640, 480);
  initBalls();
}

void draw() {
  background(155);
  displayBalls();
}

void mousePressed() {
  changeBallColors(mouseX, mouseY);
  System.out.println("mouseX : " + mouseX + " mouse Y :" + mouseY);
}

private void changeBallColors(int mX, int mY) {
  for (Ball ball : balls) {
    if (ball.isMouseClickedInsideBall(mX, mY)) {
      ball.changeColor();
    }
  }
}

private void displayBalls() {
  for (int i = 0; i < balls.length; i++) {
    balls[i].display();
    balls[i].update();
  }
}

private void initBalls() {
  for (int i = 0; i < balls.length; i ++) {
     balls[i] = new Ball(i * 10, i * 10, i, 2, i * 10); 
  }
}
