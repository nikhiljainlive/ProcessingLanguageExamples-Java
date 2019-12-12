import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class BlockGame extends PApplet {

private GameController gameController;

public void setup() {
  
  gameController = new GameController();
}

public void draw() {
  background(155);
  gameController.initGame();
}
class Ball {
  private float xCoordinate;
  private float yCoordinate;
  private int ballSize = 30;
  private float displacementX = 0.0f;
  private float displacementY = 0.0f;
  private float ballRadius = ballSize / 2.0f;
  private Colors colors = new Colors();
  private int ballColor = colors.redColor;

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
public class Board implements Reflectable {
  private float startX = 0.0f;
  private float startY = 0.0f;
  private int boardWidth = 100;
  private int boardHeight = 10;
  private float boardMidX = boardWidth / 2.0f;
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
class Colors {
  public final int redColor = color(255, 0, 0);
  public final int greenColor = color(0, 255, 0);
  public final int blueColor = color(0, 0, 255);
}
class GameController {
  private static final int CAPACITY = 10;
  private Board board;
  private Ball ball;
  private Colors colors = new Colors();
  private ArrayList<Block> blocks = new ArrayList<Block>(CAPACITY);
  private int blockFiredCount = 0;

  GameController() {
    board = new Board(width / 2, height - 50);
    ball = new Ball(width / 2 - 200, height - 50 - 200, 20);
    ball.setXDisplacement(3);
    ball.setYDisplacement(-5);
    initBlocks();
  }

  public void initGame() {
    initBoard();
    initBall();
    displayBlocks();
    checkCollisionWithBlocks();
    checkWinOrLoss();
    showBlockFiredCount();
  }

  private void initBlocks() {
    for (int i = 0; i < CAPACITY; i++) {
      blocks.add(new Block(i * 100, 100, 60));
    }
  }

  private void initBoard() {
    board.display();
    board.displaceHorizontally(mouseX);
  }

  private void initBall() {
    ball.display();
    ball.update();
    ball.checkCollisionWithBoard(board);
  }

  private void displayBlocks() {
    for (Block block : blocks) {
      block.display();
    }
  }

  private void checkCollisionWithBlocks() {
    for (int i = 0; i < blocks.size(); i++) {
      Block block = blocks.get(i);
      ball.checkCollisionWithObject(block);
      if (ball.isCollidingWithObject(block)) {
        blocks.remove(block);
        blockFiredCount += 1;
      }
    }
  }

  private void checkWinOrLoss() {
    checkIfLose();
    checkIfWon();
  }

  private void checkIfWon() {
    if (blockFiredCount == CAPACITY) {
      fill(colors.greenColor);
      textSize(30);
      text("You won!", (width / 2) - (30 * 2), height / 2);
      noLoop();
    }
  }

  private void checkIfLose() {
    if (ball.isOutsideLowerVerticalWall()) {
      fill(colors.redColor);
      textSize(30);
      text("Game Over!", (width / 2) - (30 * 2), height / 2);
      noLoop();
    }
  }

  private void showBlockFiredCount() {
    textSize(15);
    text("Blocks Fired : " + blockFiredCount, width - 200, 50);
  }
}
interface Reflectable {
  public float getStartX(); 
  public float getStartY();
  public int getWidth(); 
  public int getHeight();
}
  public void settings() {  size(1000, 500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "BlockGame" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
