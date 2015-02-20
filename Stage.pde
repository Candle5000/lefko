class Stage extends Statement {
  int score, scene;
  ArrayList entity;
  Screen scr;
  Player player;
  
  Stage() {
    super();
    id = STAGE;
    scene = 0;
    scr = new Screen();
    entity = new ArrayList();
    player = new Player(entity, scr);
    vc.stage = this;
  }
  
  void update() {
    if(!startFlag) {
      fadeIn();
    } else {
      if(!player.delFlag) {
        player.update();
      }
      
      // Entity update
      for(int i = entity.size() - 1; i >= 0; i--) {
        Entity e = (Entity)entity.get(i);
        e.update();
        if(e.delFlag) {
          score += e.score;
          entity.remove(i);
        }
      }
      
      // Enemy pop
      if(scene == 1) {
        if(frameCount % (int)(fps * 2) == 0) {
          entity.add(new Enemy01(random(scr.xStart + scr.getWidth() * 0.1, scr.xEnd - scr.getWidth() * 0.1), scr.yStart, entity, scr, player));
        }
        if((int)(frameCount + fps) % (int)(fps * 2) == 0 && (int)random(0,99) < 50) {
          entity.add(new Enemy01(random(scr.xStart + scr.getWidth() * 0.1, scr.xEnd - scr.getWidth() * 0.1), scr.yStart, entity, scr, player));
        }
      }
      
      // Scene control
      if(scene == 0 && count > fps * 2) {
        scene++;
        count = -1;
      }
      
      // GameOver
      if(scene != -1 && player.delFlag) {
        scene = -1;
        count = -1;
      }
      
      // タイトルに戻る
      if(scene == -1 && count > fps * 5) {
        if(mousePressed && mouseButton == LEFT) {
          endFlag = true;
        }
        fadeOut();
        if(fadeCount > fps * 1) {
          nextState = TITLEMENU;
        }
        count--;
      }
      
      count++;
    }
  }
}
