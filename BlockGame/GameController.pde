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
