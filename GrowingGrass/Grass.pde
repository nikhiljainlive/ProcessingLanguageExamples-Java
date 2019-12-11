public class Grass {
  int fromX;
  int fromY;
  int toX;
  int toY;

  Grass(int fromX, int fromY, int toX, int toY) {
    this.fromX = fromX;
    this.fromY = fromY; 
    this.toX = toX; 
    this.toY = toY;
  }

  public void setFromX(int fromX) {
    this.fromX = fromX;
  }

  public int getFromX() {
    return this.fromX;
  }

  public void setFromY(int fromY) {
    this.fromY = fromY;
  }

  public int getFromY() {
    return this.fromY;
  }


  public void setToX(int toX) {
    this.toX = toX;
  }

  public int getToX() {
    return this.toX;
  }

  public void setToY(int toY) {
    this.toY = toY;
  }

  public int getToY() {
    return this.toY;
  }
  
  public void display() {
    stroke(0, random(150, 256), 0);
    line(int(fromX), int(fromY), int(toX), int(toY));
  }
}
