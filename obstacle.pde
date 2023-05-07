class obstacle extends drawable {

  obstacle (int OBx, int OBy) {
    x = OBx;
    y = OBy;
  }

  void draw (int ofset) {
    fill(50, 100, 200);
    rect(x-ofset, y, 80, 100);
  }
}
