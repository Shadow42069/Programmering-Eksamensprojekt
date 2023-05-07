class drawable {
  int x;
  float y;

  int w = 80;
  int h = 100;
  void draw () {
  }

  boolean collisionWithObject(drawable item) {
    return (abs(item.x - x) < w && abs(item.y - y) < h);
  }
}
