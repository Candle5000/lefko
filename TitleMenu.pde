class TitleMenu extends Statement {
  TextButton start, quit;
  
  TitleMenu() {
    super();
    id = TITLEMENU;
    start = new TextButton("START", width * 0.025, width * 0.5, height * 0.65, width * 0.15, height * 0.05);
    quit = new TextButton("QUIT", width * 0.025, width * 0.5, height * 0.75, width * 0.15, height * 0.05);
  }
  
  void update() {
    if(!startFlag) {
      fadeIn();
    } else {
      if(!endFlag) {
        start.update();
        quit.update();
        endFlag = (start.workFlag || quit.workFlag);
      } else {
        fadeOut();
        if(fadeCount > fps) {
          if(start.workFlag) {
            nextState = STAGE;
          } else if(quit.workFlag) {
            exit();
          }
        }
      }
    }
  }
}
