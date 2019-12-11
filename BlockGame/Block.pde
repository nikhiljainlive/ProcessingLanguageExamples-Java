class Block implements Reflectable {
  private float startX;
  private float startY;
  private int blockWidth = 50;
  private int blockHeight = 10;

  Block(float startX, float startY) {
    this.startX = startX;
    this.startY = startY;
  }

  Block(float startX, float startY, int blockWidth) {
    this.startX = startX;
    this.startY = startY;
    this.blockWidth = blockWidth;
  }

public void setStartX(float startX) {
    this.startX = startX;
  }

  public float getStartX() {
    return startX;
  }

  public void setStartY(float startY) {
    this.startY = startY;
  }

  public float getStartY() {
    return startY;
  }
  
  public int getWidth() {
    return this.blockWidth;
  }
  
  public int getHeight() {
    return this.blockHeight;
  }
  
  public void display() {
    rect(startX, startY, blockWidth, blockHeight);
  }
}
