class player extends drawable {


  int floor = height -100;
  float gravity = 0.5;
  float speedY = 0;


  void draw (int offset) {
    fill(100, 200, 100);
    rect(x-offset, y, w, h);
  }

  void move() {
    // apply gravity to speed
    speedY = speedY + gravity;
    x = x+2;
    if (y + speedY >= floor-h) {
      // ramte gulvet
      y = floor - h;
      speedY = -speedY/2;
    } else if (y + speedY <= 0) {
      // ramte loftet
      y = 0;
      //speedY = -speedY;
    } else {
      //ramte ikke gulvet
      y = y + round(speedY);
    }
  }
  player(int px, int py) {
    x = px;
    y = py;
  }

  boolean collision(ArrayList<obstacle> obstacleList, ArrayList<enemy> enemyList) {
    for (obstacle obs : obstacleList) {
      if (collisionWithObject(obs)) {
        return true;
      }
    }
    for (enemy fjende : enemyList) {
      if (collisionWithObject(fjende)) {
        return true;
      }
    }
    return false;
  }
}
