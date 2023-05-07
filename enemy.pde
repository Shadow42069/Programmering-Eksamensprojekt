class enemy extends drawable {

  int floor = height -100;
  float gravity = 0.2;
  float speedY = 0;
  //0 betyder at den ikke har ramt gulvet indnu.
  float gulvHastighed = 0;


  void draw (int offset) {
    fill(200, 100, 100);
    rect(x-offset, y, w, h);
  }

  void move() {
    // apply gravity to speed
    speedY = speedY + gravity;
    if (y + speedY >= floor-h) {
      // ramte gulvet
      y = floor - h;
      speedY = -speedY;
      if (gulvHastighed == 0) {
        //første gang rammer gulvet
        gulvHastighed = speedY;
      } else {
        //Ikke første gang ramer gulvet.
        speedY = gulvHastighed;
      }
    } else if (y + speedY <= 0) {
      // ramte loftet
      y = 0;
      speedY = -speedY;
    } else {
      //ramte ikke gulvet
      y = y + round(speedY);
    }
  }
  enemy(int px, int py) {
    x = px;
    y = py;
  }

  boolean collision(ArrayList<obstacle> obstacleList) {
    for (obstacle obs : obstacleList) {
      if (collisionWithObject(obs)) {
        return true;
      }
    }
    return false;
  }
}
