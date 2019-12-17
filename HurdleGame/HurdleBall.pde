class Ball {
  private float xCoordinate;
  private float yCoordinate;
  private int size = 20;
  private float displacementX = 0;
  private float displacementY = 0;

  Ball(float xCoordinate, float yCoordinate) {
    this.xCoordinate = xCoordinate;
    this.yCoordinate = yCoordinate;
  }

  Ball(float xCoordinate, float yCoordinate, int size) {
    this.xCoordinate = xCoordinate;
    this.yCoordinate = yCoordinate;
    this.size = size;
  }

  public float getXCoordinate() {
    return this.xCoordinate;
  }

  public void setXCoordinate(float xCoordinate) {
    this.xCoordinate = xCoordinate;
  }

  public float getYCoordinate() {
    return this.yCoordinate;
  }  

  public void setYCoordinate(float yCoordinate) {
    this.yCoordinate = yCoordinate;
  }

  public int  getSize() {
    return this.size;
  }

  public float getDisplacementX() {
    return this.displacementX;
  }

  public void setDisplacementX(float displacementX) {
    this.displacementX = displacementX;
  }

  public float getDisplacementY() {
    return this.displacementY;
  }  

  public void setDisplacementY(float displacementY) {
    this.displacementY = displacementY;
  }

  public void display() {
    ellipse(xCoordinate, yCoordinate, size, size);
  }

  public void move() {
    this.xCoordinate += this.displacementX;
    this.yCoordinate += this.displacementY;
  }
}
