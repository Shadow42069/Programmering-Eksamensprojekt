player spiller;
level kort;
enum GameState {
  MENU,
    PLAYING,
    PAUSED,
    DEATH,
    WIN
}
GameState gameState = GameState.PLAYING;
int startTime;
float points = 0;
void setup () {
  size (800, 800);
  spiller = new player(50, 300);
  kort = new level();
  frameRate(50);
}
void draw () {

  if (gameState == GameState.PLAYING) {
    //flyt tingene
    kort.move();
    spiller.move();
    points=points+0.02;
    if (spiller.collision(kort.obstacleList, kort.enemyList) == true) {
      gameState = GameState.DEATH;
    } else if (spiller.x >= 15000) {
      gameState = GameState.WIN;
      startTime = millis();
    }
  }
  //Tegn skærm
  if (gameState == GameState.PLAYING||gameState == GameState.PAUSED||gameState == GameState.DEATH||gameState == GameState.WIN ) {
    background(255);
    fill(200);
    rect(0, height-100, width, 100);
    kort.draw();
    spiller.draw(kort.offset);
    fill(255, 0, 0);
    textAlign(LEFT);
    textSize(32);
    text("Score: " + round(points), 10, 30);
    if (gameState == GameState.PAUSED) {

      drawPauseScreen();
    }
    if (gameState == GameState.DEATH) {
      drawDeathScreen();
    }
    if (gameState == GameState.WIN) {
      drawWinScreen();
      if (millis() - startTime >= 3000) {
        exit();
      }
    }
  }
}


void keyPressed() {
  if (key == ' ') {
    spiller.speedY = -10;
  } else if (key == 'p' && gameState == GameState.PLAYING) {
    gameState = GameState.PAUSED;
  } else if (key == 'p' && gameState == GameState.PAUSED) {
    gameState = GameState.PLAYING;
  } else if (key == 'r' && gameState == GameState.DEATH) {
    gameState = GameState.PLAYING;
    setup();
    points = 0;
  }
  if ( keyCode == RIGHT && gameState == GameState.PLAYING) {
    spiller.x = spiller.x +25;
    if (spiller.x >=width+kort.offset) {
      gameState = GameState.DEATH;
    }
  }
  if (keyCode == LEFT  && gameState == GameState.PLAYING) {
    spiller.x = spiller.x -25;
    if (spiller.x < 0+kort.offset) {
      gameState = GameState.DEATH;
    }
  }
}


void drawPauseScreen() {
  fill(100);
  rect(200, 200, 400, 400);
  fill(255);
  textSize(48);
  textAlign(CENTER);
  text("PAUSE", width/2, height/2);
  textSize(24);
  text("Tryk 'p' for at starte spillet igen!", width/2, height/2 + 50);
}


void drawDeathScreen() {
  fill(100);
  rect(200, 200, 400, 400);
  fill(255);
  textSize(48);
  textAlign(CENTER);
  text("DEATH", width/2, height/2);
  textSize(24);
  text("Du har tabt spiller!", width/2, height/2 + 50);
  text("Tryk 'r' for at starte spillet igen!", width/2, height/2 + 100);
}

void drawWinScreen() {
  fill(100);
  rect(200, 200, 400, 400);
  fill(255);
  textSize(48);
  textAlign(CENTER);
  text("Tilykke!", width/2, height/2);
  textSize(24);
  text("Du har vundet spillet, godt klaret!", width/2, height/2 + 50);
}
