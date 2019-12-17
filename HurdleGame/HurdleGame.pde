float yCoordinate;
int displacementY = 1;
int changeValue = 1;
boolean isJumping = false;
Ball[] balls;
Ball ball;

void setup() {
  size(720, 640);
  yCoordinate =  height - 100;
  balls = new Ball[10];
  ball = new Ball(width - 50, height - 85, 20);
  ball.setDisplacementX(-2);
}


void draw() {
  background(155);

  line(0, height - 75, width, height - 75);
  rectMode(CENTER);
  rect(50, yCoordinate, 15, 50);

  ball.display();
  ball.move();
  if (isJumping) {
    jump();
  }
}

void mousePressed() {
  isJumping = true;
  //jump();
}

void keyPressed() {
  //jump();
}

private void jump() {
  do {
    yCoordinate -= displacementY;
    displacementY += changeValue;

    System.out.println("Displacement : " + displacementY);
    if (displacementY == 10 || displacementY == -10) {
      changeValue *= -1;
    }

    if (yCoordinate ==  height - 100) {
      isJumping = false;
    }
  } while (displacementY == 0);
}
