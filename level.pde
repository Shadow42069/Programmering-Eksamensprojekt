class level {
  ArrayList<obstacle> obstacleList;
  ArrayList<enemy> enemyList;
  int offset = 0;


  level() {
    obstacleList = new ArrayList<obstacle>();
    for (int i = 0; i < 30; i++) {
      obstacleList.add(new obstacle(i*300 + round(random(0, 300)+300), round(random(0, 600))));
    }
    enemyList = new ArrayList<enemy>();
    for (int i = 0; i < 10; i++) {
      enemyList.add(new enemy(i*3000+450 + round(random(0, 300)+300), round(random(0, 300))));
    }
  }

  void draw() {
    for (obstacle obs : obstacleList) {
      obs.draw(offset);
    }
    for (enemy fjende : enemyList) {
      fjende.draw(offset);
    }
  }

  void move() {
    offset += 2;
    for (enemy fjende : enemyList) {
      fjende.move();
    }
  }
}
