class Ball {
  private float xCoordinate;
  private float yCoordinate;
  private int ballSize = 30;
  private float displacementX = 0.0;
  private float displacementY = 0.0;
  private float ballRadius = ballSize / 2.0;
  private Colors colors = new Colors();
  private color ballColor = colors.redColor;

  Ball(float xCoordinate, float yCoordinate) {
    this.xCoordinate = xCoordinate;
    this.yCoordinate = yCoordinate;
  }

  Ball(float xCoordinate, float yCoordinate, int ballSize) {
    this.xCoordinate = xCoordinate;
    this.yCoordinate = yCoordinate;
    this.ballSize = ballSize;
  }

  public void setXCoordinate(float xCoordinate) {
    this.xCoordinate = xCoordinate;
  }

  public float getXCoordinate() {
    return xCoordinate;
  }

  public void setYCoordinate(float yCoordinate) {
    this.yCoordinate = yCoordinate;
  }

  public float getYCoordinate() {
    return yCoordinate;
  }

  public void setXDisplacement(float displacementX) {
    this.displacementX = displacementX;
  }

  public float getXDisplacement() {
    return this.displacementX;
  }

  public void setYDisplacement(float displacementY) {
    this.displacementY = displacementY;
  }

  public float getYDisplacement() {
    return this.displacementY;
  }

  public int getBallSize() {
    return ballSize;
  }

  public void display() {
    //fill(this.ballColor);
    ellipse(xCoordinate, yCoordinate, ballSize, ballSize);
  }

  public void update() {
    this.move();
    this.checkCollisionWithWalls();
  }

  public void move() {
    xCoordinate += displacementX;
    yCoordinate += displacementY;
  }

  public void checkCollisionWithWalls() {
    if (isOutsideHorizontalWalls()) displacementX *= -1;
    if (isOutsideUpperVerticalWall()) displacementY *= -1;
  }

  public boolean isOutsideUpperVerticalWall() {
    return (this.yCoordinate < ballRadius);
  }

  public boolean isOutsideHorizontalWalls() {
    return (this.xCoordinate > width - ballRadius || this.xCoordinate < ballRadius);
  }

  public boolean isOutsideLowerVerticalWall() {
    return yCoordinate > height + ballRadius;
  }

  public void checkCollisionWithObject(Reflectable obj) {
    if (isCollidingWithObject(obj)) displacementY *= -1;
    //changeColor();
  }

  public void checkCollisionWithBoard(Board board) {
    if (isCollidingWithObject(board)) {
      if (this.xCoordinate < board.startX + 25) {
        displacementX *= -1;
        System.out.println("xDisplacement  = " + displacementX + "yDisplacement  = " + displacementY + "\n");
      }

      if (this.xCoordinate > board.startX + board.getWidth() - 25) {
        System.out.println("xDisplacement  = " + displacementX + "yDisplacement  = " + displacementY + "\n");
        displacementX *= -1;
      }

      displacementY *= -1;
    }
  }

  public boolean isCollidingWithObject(Reflectable obj) {
    return !isObjectOutsideBoardHorizontally(obj.getStartX(), obj.getWidth())
      && isTouchingObjectVertically(obj.getStartY(), obj.getHeight());
  }


  public boolean isObjectOutsideBoardHorizontally(float startX, int objWidth) {
    return this.xCoordinate < startX || this.xCoordinate > startX + objWidth;
  }

  public boolean isTouchingObjectVertically(float startY, int objHeight) {
    return this.yCoordinate == startY - objHeight
      || this.yCoordinate == startY + objHeight;
  }

  private void changeColor() {
    if (this.ballColor == colors.redColor) {
      this.ballColor = colors.greenColor;
      return;
    }

    this.ballColor = colors.redColor;
  }
}
