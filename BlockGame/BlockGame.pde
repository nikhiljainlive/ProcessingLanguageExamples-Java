private GameController gameController;

void setup() {
  size(1000, 500);
  gameController = new GameController();
  gameController.pauseGame();
}

void draw() {
  background(155);
  gameController.initGame();
}

void mousePressed() {
  gameController.playGame();
}
