void setup() {
  size(640, 480);
}

void draw() {
  stroke(random(256), random(256), random(256));
  line(width / 2, height / 2, random(width - 10), random(height - 10));
}
