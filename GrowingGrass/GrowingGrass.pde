Grass[] grassBundle = new Grass[5];

void setup() {
  size(640, 480);
  background(255);
  frameRate(10);
}

void draw() {
  initGrassBundle();
  displayGrassBundle();
}

void initGrassBundle() {
  for (int i = 0; i < grassBundle.length; i++) {
    int randomX = int(random(0, width));
    int randomY = int(random(height - 150, height));
    grassBundle[i] = new Grass(randomX, randomY, randomX, height);
  }
}

void displayGrassBundle() {
  for (Grass grass : grassBundle) {
    grass.display();
  }
}
