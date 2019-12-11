class Ball {
  private int x;
  private int y;
  private int size;
  private int dx = 0;
  private int dy = 0;
  private color ballColor = color(255, 0 , 0);
  
  Ball(int x, int y, int dx, int dy, int size) {
    this.x = x;
    this.y = y;
    this.dx = dx;
    this.dy = dy;
    this.size = size;
  }
  
  public void update() {
    this.move();
    this.checkCollisionWithWalls();
  }
  
  public void move() {
     this.x += this.dx;
     this.y += this.dy;
  }
 
  public void checkCollisionWithWalls() {
      if (isOutsideHorizontalWalls()) {
          this.dx *= -1;
      }
      
      if (isOutsideVerticalWalls()) {
         this.dy *= -1;
      }
  }
  
  public boolean isOutsideHorizontalWalls() {
    return this.x > width - size / 2 || this.x < size / 2;
  }
  
    public boolean isOutsideVerticalWalls() {
    return this.y > height - size / 2 || this.y < size / 2;
  }
  
  public void setX(int x) {
    this.x = x;
  }
  
  public int getDx() {
    return this.dx;
  }
  
  public void setDx(int dx) {
    this.dx = dx;
  }
  
  public int getDy() {
    return this.dy;
  }
  
  public void setDy(int dy) {
    this.dy = dy;
  }
  
  public int getX() {
    return this.x;
  }
  
  public void setY(int y) {
    this.y = y;
  }
  
  public int getY() {
    return this.y;
  }
 
  public void setSize(int size) {
    this.size = size;
  }
  
  public int getSize() {
    return size;
  }
  
  public boolean isMouseClickedInsideBall(int mX, int mY) {
    double sqrOfX = Math.pow(mX - x, 2);
    double sqrOfY = Math.pow(mY - y, 2);
    double distance = Math.sqrt(sqrOfX + sqrOfY); 
    return distance < size / 2.0;
  }
  
  public void changeColor() {
    if (red(this.ballColor) == 255 ) {
      this.ballColor = color(0, 255, 0);
      return;
     }      
      this.ballColor = color(255, 0 , 0);
  }
  
  public void display() {
    fill(this.ballColor);
    ellipse(x, y, size, size);
  }
}
