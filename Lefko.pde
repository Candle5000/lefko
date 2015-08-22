// Project LEFKO
// 2015-02-08 開発開始

int nextState;
final int TITLEMENU = 0;
final int CONFIG = 1;
final int STAGE = 2;
float fps;
SaveData sd;
ViewController vc;
KeyController kc;
Statement statement;
PFont defaultFont;

void setup() {
  fps = 60;
  size(800, 800);
  smooth();
  frameRate(fps);
  defaultFont = loadFont("TakaoPGothic-128.vlw");
  textFont(defaultFont, 32);
  sd = new SaveData();
  vc = new ViewController();
  kc = new KeyController();
  statement = new TitleMenu();
}

void draw() {
  background(8, 8, 32);
  if(statement.id != nextState) {
    switch(nextState) {
      case TITLEMENU:
        sd.loadConfig();
        statement = new TitleMenu();
        break;
      case CONFIG:
        statement = new Config();
        break;
      case STAGE:
        statement = new Stage();
        break;
    }
  }
  statement.update();
  
  // draw graphic
  vc.update();
}

void keyPressed() {
  kc.pressed(key, keyCode);
}

void keyReleased() {
  kc.released(key, keyCode);
}
