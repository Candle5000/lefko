// Project LEFKO
// 2015-02-08 開発開始

int nextState;
final int TITLEMENU = 0;
final int STAGE = 1;
float fps;
ViewController vc;
Statement statement;

void setup() {
  fps = 60;
  size(800, 800);
  smooth();
  frameRate(fps);
  vc = new ViewController();
  statement = new TitleMenu();
}

void draw() {
  background(8, 8, 32);
  if(statement.id != nextState) {
    switch(nextState) {
      case TITLEMENU:
        statement = new TitleMenu();
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
