final int CAPACITY = 10;
Board board;
Ball ball;
Colors colors = new Colors();
ArrayList<Block> blocks = new ArrayList<Block>(CAPACITY);
int blockFiredCount = 0;

void setup() {
  size(1000, 500);
  board = new Board(width / 2, height - 50);
  ball = new Ball(width / 2 - 200, height - 50 - 200, 20);
  ball.setXDisplacement(2);
  ball.setYDisplacement(2);
  initBlocks();
}

void draw() {
  background(155);
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
  ball.checkCollisionWithObject(board);
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
