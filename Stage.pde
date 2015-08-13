class Stage extends Statement {
  int score, scoreBorder, scene, eventFlag, boss;
  ArrayList entity;
  Screen scr;
  Player player;
  
  Stage() {
    super();
    id = STAGE;
    score = 0;
    scoreBorder = 100;
    scene = 0;
    eventFlag = 0;
    boss = 0;
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
          if(e.eventFlag != 0) {
            eventFlag = e.eventFlag;
          }
          score += e.score;
          entity.remove(i);
        }
      }
      
      // Enemy pop
      if(scene == 1 && count > fps * 2) {
        if(frameCount % (fps * 2) == 0) {
          if(score >= 60 && (int)random(1, 100) < 20) {
            entity.add(new Enemy04(random(scr.xStart + scr.getWidth() * 0.1, scr.xEnd - scr.getWidth() * 0.1), scr.yStart, entity, scr, player));
          } else if(score >= 20 && (int)random(1, 100) < 25) {
            entity.add(new Enemy02(random(scr.xStart + scr.getWidth() * 0.1, scr.xEnd - scr.getWidth() * 0.1), scr.yStart, entity, scr, player));
          } else {
            entity.add(new Enemy01(random(scr.xStart + scr.getWidth() * 0.1, scr.xEnd - scr.getWidth() * 0.1), scr.yStart, entity, scr, player));
          }
        }
        if((int)(frameCount + fps) % (fps * 2) == 0 && (int)random(0,99) < 40) {
          entity.add(new Enemy01(random(scr.xStart + scr.getWidth() * 0.1, scr.xEnd - scr.getWidth() * 0.1), scr.yStart, entity, scr, player));
        }
      } else if(scene == 2) {
        if(count == fps * 8) {
          switch(boss) {
            case 0:
              entity.add(new Enemy03(scr.xStart + scr.getWidth() * 0.5, scr.yStart + scr.getHeight() * 0.2, entity, scr, player));
              boss++;
              break;
            case 1:
              entity.add(new Enemy05(scr.xStart + scr.getWidth() * 0.5, scr.yStart + scr.getHeight() * 0.2, entity, scr, player));
              boss--;
              break;
          }
        }
      }
      
      // Scene control
      if(scene == 0 && count > fps * 2) {
        scene++;
        count = -1;
      } else if(scene == 1 && score >= scoreBorder) {
        scene++;
        scoreBorder += 100;
        count = -1;
      } else if(scene == 2 && eventFlag == 1) {
        scene--;
        count = -1;
        eventFlag = 0;
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
