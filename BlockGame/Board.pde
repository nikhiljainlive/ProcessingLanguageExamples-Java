public class Board implements Reflectable {
  private float startX = 0.0;
  private float startY = 0.0;
  private int boardWidth = 100;
  private int boardHeight = 10;
  private float boardMidX = boardWidth / 2.0;
  private final int cornerRadius = 7;

  Board(float startX, float startY) {
    this.startX = startX;
    this.startY = startY;
  }

  Board(float startX, float startY, int boardWidth) {
    this.startX = startX;
    this.startY = startY;
    this.boardWidth = boardWidth;
  }

  public void setStartX(float startX) {
    this.startX = startX;
  }

  public float getStartX() {
    return this.startX;
  }

  public void setStartY(float startY) {
    this.startY = startY;
  }

  public float getStartY() {
    return this.startY;
  }

  public void setWidth(int boardWidth) {
    this.boardWidth = boardWidth;
  }

  public int getWidth() {
    return this.boardWidth;
  }

  public int getHeight() {
    return this.boardHeight;
  }

  public void display() {
    rect(startX, startY, boardWidth, boardHeight, cornerRadius);
  }

  public void displaceHorizontally(float atX) {
    this.startX = atX - boardMidX;
  }
}
