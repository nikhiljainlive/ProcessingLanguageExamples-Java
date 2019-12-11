class BallObject {
  private int x;
  private int y;
  private int size = 30;
  private int ballRadius;

  BallObject(int x, int y) {
    this.x = x;
    this.y = y;
  }

  public int getX() {
    return x;
  }

  public int getY() {
    return y;
  }

  public int getSize() {
    return size;
  }

  public void display() {
    ellipse(x, y, size, size);
  }

  public void move(int changeValue) {
    x += changeValue;
    y += changeValue;
  }

 
}
