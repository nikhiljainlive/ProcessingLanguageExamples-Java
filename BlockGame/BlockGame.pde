private GameController gameController;

void setup() {
  size(1000, 500);
  gameController = new GameController();
}

void draw() {
  background(155);
  gameController.initGame();
}
