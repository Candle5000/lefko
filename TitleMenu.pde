class TitleMenu extends Statement {
  TextButton start, config, quit;
  ArrayList<TextButton> buttons;
  
  TitleMenu() {
    super();
    id = TITLEMENU;
    buttons = new ArrayList<TextButton>();
    buttons.add(start = new TextButton("START", 20, width * 0.5, height * 0.5 + 100, 160, 40, true));
    buttons.add(config = new TextButton("KEY CONFIG", 20, width * 0.5, height * 0.5 + 160, 160, 40, true));
    buttons.add(quit = new TextButton("QUIT", 20, width * 0.5, height * 0.5 + 220, 160, 40, true));
  }
  
  void update() {
    if(!startFlag) {
      for(int i = 0; i < buttons.size(); i++) {
        buttons.get(i).drawOnlyUpdate();
      }
      fadeIn();
    } else {
      if(!endFlag) {
        for(int i = 0; i < buttons.size(); i++) {
          buttons.get(i).update();
        }
        endFlag = (start.workFlag || config.workFlag || quit.workFlag);
      } else {
        for(int i = 0; i < buttons.size(); i++) {
          buttons.get(i).drawOnlyUpdate();
        }
        fadeOut();
        if(fadeCount > fadeTime) {
          if(start.workFlag) {
            nextState = STAGE;
          } else if(config.workFlag) {
            nextState = CONFIG;
          } else if(quit.workFlag) {
            exit();
          }
        }
      }
    }
  }
}
