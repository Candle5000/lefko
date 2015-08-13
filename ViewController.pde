class ViewController {
  final float IRON_BLUE[] = {0x3a, 0x48, 0x61};
  final float IVY_GREEN[] = {0x4c, 0x67, 0x33};
  final float IVORY[] = {0xde, 0xd2, 0xbf};
  final float ASH_GREY[] = {0x8f, 0x8f, 0x8f};
  final float APPLE_GREEN[] = {0xa2, 0xd2, 0x9e};
  final float YELLOW[] = {0xf4, 0xd5, 0x00};
  final float ECRU_BEIGE[] = {0xf5, 0xcd, 0xa6};
  final float ORANGE[] = {0xef, 0x81, 0x0f};
  final float CARMINE[] = {0xbe, 0x00, 0x39};
  final float CREAM_YELLOW[] = {0xe4, 0xd3, 0xa2};
  final float CANARY_YELLOW[] = {0xed, 0xd6, 0x34};
  final float GRASS_GREEN[] = {0x73, 0x7c, 0x3e};
  final float GREEN[] = {0x00, 0x9a, 0x57};
  final float GREY[] = {0x76, 0x76, 0x76};
  final float COCOA_BROWN[] = {0x70, 0x4b, 0x38};
  final float COBALT_GREEN[] = {0x09, 0xc2, 0x89};
  final float COBALT_BLUE[] = {0x00, 0x62, 0xa0};
  final float GOLD[] = {0xff, 0xd7, 0x00};
  final float SALMON_PINK[] = {0xff, 0x9e, 0x8c};
  final float SEA_GREEN[] = {0x97, 0xb6, 0x4d};
  final float CYAN[] = {0x00, 0x9c, 0xd1};
  final float SIGNAL_RED[] = {0xce, 0x21, 0x43};
  final float SCARLET[] = {0xde, 0x38, 0x38};
  final float SNOW_WHITE[] = {0xf0, 0xf0, 0xf0};
  final float SLATE_GREY[] = {0x51, 0x53, 0x56};
  final float SEPIA[] = {0x48, 0x3c, 0x2c};
  final float TURQUOISE_BLUE[] = {0x00, 0x9d, 0xbf};
  final float NAVY_BLUE[] = {0x34, 0x3d, 0x55};
  final float VIOLET[] = {0x71, 0x4c, 0x99};
  final float PURPLE[] = {0xa7, 0x57, 0xa8};
  final float PEARL_GREY[] = {0xaa, 0xaa, 0xaa};
  final float PANSY[] = {0x43, 0x31, 0x71};
  final float VIRIDIAN[] = {0x00, 0x6d, 0x56};
  final float PEACH[] = {0xe8, 0xbd, 0xa5};
  final float PINK[] = {0xea, 0x91, 0x98};
  final float BROWN[] = {0x6d, 0x4c, 0x33};
  final float BLACK[] = {0x00, 0x00, 0x00};
  final float BLUE[] = {0x00, 0x6f, 0xab};
  final float WHITE[] = {0xff, 0xff, 0xff};
  final float BOTTLE_GREEN[] = {0x20, 0x45, 0x37};
  final float BORDEAUX[] = {0x53, 0x36, 0x38};
  final float POPPY_RED[] = {0xdf, 0x33, 0x4e};
  final float MAGENTA[] = {0xd1, 0x3a, 0x84};
  final float MARINE_BLUE[] = {0x00, 0x52, 0x6b};
  final float MIDNIGHT_BLUE[] = {0x25, 0x2a, 0x35};
  final float MINT_GREEN[] = {0x58, 0xce, 0x91};
  final float LILAC[] = {0xc2, 0x9d, 0xc8};
  final float LAMP_BLACK[] = {0x21, 0x21, 0x21};
  final float LEAF_GREEN[] = {0x89, 0x98, 0x3b};
  final float RED[] = {0xdf, 0x34, 0x47};
  final float LEMON_YELLOW[] = {0xd9, 0xca, 0x00};
  final float ROSE[] = {0xdb, 0x35, 0x61};
  final float WINE_RED[] = {0x80, 0x27, 0x3f};
  final float PLAYER_COLOR[] = {};
  ArrayList textButton;
  ArrayList enemy;
  ArrayList shot;
  Stage stage;
  
  ViewController() {
    textButton = new ArrayList();
    enemy = new ArrayList();
    shot = new ArrayList();
  }
  
  void update() {
    switch(statement.id) {
      case TITLEMENU:
        drawTitleMenu();
        break;
      case STAGE:
        drawStage();
        break;
    }
    drawFade();
  }
  
  void drawTitleMenu() {
    drawTitle(WHITE);
    for(int i = textButton.size() - 1; i >= 0; i--) {
      drawTextButton((TextButton)textButton.get(i), WHITE, GREY);
    }
    textButton.clear();
  }
  
  void drawStage() {
    
    // draw enemy
    for(int i = enemy.size() - 1; i >= 0; i--) {
      Entity e = (Entity)enemy.get(i);
      switch(e.image) {
        case 4001:
          draw400(e, VIRIDIAN);
          break;
        case 4002:
          draw400(e, VIOLET);
          break;
        case 4003:
          draw400(e, RED);
          break;
        case 4004:
          draw400(e, CYAN);
          break;
        case 4005:
          draw400(e, GOLD);
          break;
      }
    }
    
    // draw shot
    for(int i = shot.size() - 1; i >= 0; i--) {
      Entity s = (Entity)shot.get(i);
      switch(s.image) {
        case 6001:
          draw600(s, ORANGE);
          break;
        case 6002:
          draw600(s, YELLOW);
          break;
        case 6003:
          draw600(s, SALMON_PINK);
          break;
        case 6011:
          draw601(s, MINT_GREEN);
          break;
        case 6021:
          draw602(s, WINE_RED);
          break;
        case 6031:
          draw603(s, SALMON_PINK);
          break;
        case 6601:
          draw660(s, CREAM_YELLOW);
          break;
      }
    }
    
    drawPlayer(MINT_GREEN, LEMON_YELLOW, SNOW_WHITE);
    drawChargeEffect(CANARY_YELLOW);
    
    drawStageFade(BLACK);
    drawStageText(BLUE, YELLOW);
    drawScreen(COBALT_BLUE);
    drawPlayerInfo(BLACK, WHITE);
    
    enemy.clear();
    shot.clear();
  }
  
  void drawTitle(float[] fc) {
    rectMode(CENTER);
    textAlign(CENTER, CENTER);
    textSize(100);
    fill(fc[0], fc[1], fc[2]);
    text("Lefko", width * 0.5, height * 0.4);
  }
  
  void drawTextButton(TextButton tx, float[] fc, float[] sc) {
    // 枠描画
    rectMode(CENTER);
    strokeWeight(tx.mouseOverFlag ? 3 : 1);
    stroke(fc[0], fc[1], fc[2]);
    fill(sc[0], sc[1], sc[2]);
    rect(tx.xPosition, tx.yPosition, tx.xSize, tx.ySize);
    
    // 文字描画
    textAlign(CENTER, CENTER);
    textSize(tx.textSize);
    fill(fc[0], fc[1], fc[2]);
    text(tx.text, tx.xPosition, tx.yPosition, tx.xSize, tx.ySize);
  }
  
  void drawScreen(float[] sc) {
    rectMode(CORNERS);
    noStroke();
    fill(sc[0], sc[1], sc[2]);
    rect(0, 0, stage.scr.xStart, height);
    rect(stage.scr.xEnd, 0, width, height);
    rect(stage.scr.xStart, 0, stage.scr.xEnd, stage.scr.yStart);
    rect(stage.scr.xStart, stage.scr.yEnd, stage.scr.xEnd, height);
  }
  
  void drawPlayerInfo(float[] bc, float[] fc) {
    textAlign(CENTER, CENTER);
    rectMode(CENTER);
    noStroke();
    textSize(width * 0.02);
    fill(bc[0], bc[1], bc[2]);
    rect(width * 0.1, height * 0.18, width * 0.16, height * 0.03);
    rect(width * 0.9, height * 0.18, width * 0.17, height * 0.03);
    rect(width * 0.9, height * 0.24, width * 0.17, height * 0.03);
    fill(fc[0], fc[1], fc[2]);
    text("SCORE:" + nf(stage.score, 5), width * 0.1, height * 0.18);
    fill(fc[0], fc[1] * (stage.player.shield / stage.player.shieldMax), fc[2] * (stage.player.shield / stage.player.shieldMax));
    text("SH:" + (nf((stage.player.shield < 0) ? 0 : (int)stage.player.shield, 4)) + "/" + nf((int)stage.player.shieldMax, 4), width * 0.9, height * 0.18);
    fill(fc[0], fc[1] * (stage.player.energy / stage.player.energyMax), fc[2] * (stage.player.energy / stage.player.energyMax));
    text("EN:" + nf((int)stage.player.energy, 4) + "/" + nf((int)stage.player.energyMax, 4), width * 0.9, height * 0.24);
  }
  
  void drawStageFade(float[] c) {
    if(stage.startFlag && stage.scene == -1) {
      rectMode(CORNERS);
      noStroke();
      fill(c[0], c[1], c[2], (stage.count < fps * 3) ? ((stage.count < fps) ? 0 : 255 * (stage.count - fps) / (fps * 2)) : 255);
      rect(-5, -5, width + 5, height + 5);
    }
  }
  
  void drawStageText(float[] c1, float[] c2) {
    if(stage.scene == -1 && stage.count > fps * 4) {
      textAlign(CENTER);
      textSize(32);
      fill(c1[0], c1[1], c1[2]);
      text("GAME OVER", width * 0.5, height * 0.4);
    } else if(stage.scene == 0 && stage.count < fps * 2) {
      textAlign(CENTER);
      textSize(32 + ((abs(stage.count - fps) > fps * 0.75) ? 16 * abs(stage.count - fps) / (fps * 0.25) : 0));
      fill(c2[0], c2[1], c2[2], ((abs(stage.count - fps) > fps * 0.75) ? 255 - 255 * abs(stage.count - fps) / (fps * 0.25) : 255));
      text("MISSION START", width * 0.5, height * 0.4);
    }
  }
  
  void drawFade() {
    if(!statement.startFlag || statement.endFlag) {
      rectMode(CORNERS);
      noStroke();
      if(!statement.startFlag) {
        // fade in
        fill(0, 0, 0, (statement.fadeCount < fps) ? ((statement.fadeCount < fps * 0.2) ? 255 : 255 - 255 * (statement.fadeCount - fps * 0.2) / (fps - fps * 0.2)) : 0);
      } else if(statement.endFlag) {
        // fade out
        fill(0, 0, 0, (statement.fadeCount < fps * 0.8) ? 255 * statement.fadeCount / (fps * 0.8) : 255);
      }
      rect(-5, -5, width + 5, height + 5);
    }
  }
  
  void drawPlayer(float[] c1, float[] c2, float[] c3) {
    if(!stage.player.delFlag) {
      rectMode(CENTER);
      noStroke();
      fill(c1[0], c1[1], c1[2]);
      triangle(stage.player.xPosition - 10, stage.player.yPosition - 2, stage.player.xPosition - 12, stage.player.yPosition + 6, stage.player.xPosition - 8, stage.player.yPosition + 6);
      triangle(stage.player.xPosition + 10, stage.player.yPosition - 2, stage.player.xPosition + 8, stage.player.yPosition + 6, stage.player.xPosition + 12, stage.player.yPosition + 6);
      fill(c2[0], c2[1], c2[2]);
      triangle(stage.player.xPosition, stage.player.yPosition - 10, stage.player.xPosition - 8, stage.player.yPosition + 6, stage.player.xPosition + 8, stage.player.yPosition + 6);
      fill(c3[0], c3[1], c3[2]);
      triangle(stage.player.xPosition, stage.player.yPosition - 2, stage.player.xPosition - 14, stage.player.yPosition + 6, stage.player.xPosition + 14, stage.player.yPosition + 6);
    }
  }
  
  void drawChargeEffect(float[] c) {
    if(abs(stage.player.charge - stage.player.chargeMax) < fps * 0.2 && stage.player.charge < (stage.player.chargeMax * 1.5)) {
      ellipseMode(CENTER);
      stroke(c[0], c[1], c[2], (stage.player.charge < stage.player.chargeMax) ? 128 : 128 - 128 * abs(stage.player.charge - stage.player.chargeMax) / (fps * 0.2));
      strokeWeight(15 - 14 * abs(stage.player.charge - stage.player.chargeMax) / (fps * 0.2));
      noFill();
      ellipse(stage.player.xPosition, stage.player.yPosition, 7 - 6 * (stage.player.charge - stage.player.chargeMax + (fps * 0.2)), 7 - 6 * (stage.player.charge - stage.player.chargeMax + (fps * 0.2)));
    }
  }
  
  void draw400(Entity e, float[] c) {
    rectMode(CENTER);
    noStroke();
    fill(c[0], c[1], c[2]);
    triangle(e.xPosition, e.yPosition + 12, e.xPosition - 12 * cos(radians(30)), e.yPosition - 12 * sin(radians(30)), e.xPosition + 12 * cos(radians(30)), e.yPosition - 12 * sin(radians(30)));
    triangle(e.xPosition, e.yPosition - 12 * sin(radians(30)), e.xPosition - 11 * cos(radians(30)), e.yPosition + 2, e.xPosition + 11 * cos(radians(30)), e.yPosition + 2);
    triangle(e.xPosition, e.yPosition - 12 * sin(radians(30)) + 8, e.xPosition - 8 * cos(radians(30)), e.yPosition + 8, e.xPosition + 8 * cos(radians(30)), e.yPosition + 8);
  }
  
  void draw600(Entity e, float[] c) {
    rectMode(CENTER);
    noStroke();
    fill(c[0], c[1], c[2]);
    ellipse(e.xPosition, e.yPosition, 6, 6);
  }
  
  void draw601(Entity e, float[] c) {
    rectMode(CENTER);
    strokeWeight(1);
    stroke(c[0], c[1], c[2]);
    fill(c[0], c[1], c[2]);
    triangle(e.xPosition, e.yPosition - 5, e.xPosition - 2, e.yPosition, e.xPosition + 2, e.yPosition);
  }
  
  void draw602(Entity e, float[] c) {
    rectMode(CENTER);
    noStroke();
    fill(c[0], c[1], c[2]);
    ellipse(e.xPosition, e.yPosition, 12, 12);
    triangle(e.xPosition, e.yPosition + 9, e.xPosition - 9 * cos(radians(30)), e.yPosition - 9 * sin(radians(30)), e.xPosition + 9 * cos(radians(30)), e.yPosition - 9 * sin(radians(30)));
    triangle(e.xPosition, e.yPosition - 9, e.xPosition - 9 * cos(radians(30)), e.yPosition + 9 * sin(radians(30)), e.xPosition + 9 * cos(radians(30)), e.yPosition + 9 * sin(radians(30)));
  }
  
  void draw603(Entity e, float[] c) {
    rectMode(CENTER);
    noFill();
    strokeWeight(16);
    stroke(c[0], c[1], c[2], 85);
    ellipse(e.xPosition, e.yPosition, 60, 60);
    strokeWeight(12);
    stroke(c[0], c[1], c[2], 85);
    ellipse(e.xPosition, e.yPosition, 60, 60);
    strokeWeight(8);
    stroke(c[0], c[1], c[2], 85);
    ellipse(e.xPosition, e.yPosition, 60, 60);
  }
  
  void draw660(Entity e, float[] c) {
    rectMode(CENTER);
    strokeWeight((abs(e.count - fps * 0.75) < (fps * 0.45)) ? 4 : 4 - 3 * (abs(e.count - fps * 0.75) - fps * 0.45) / (fps * 0.3));
    stroke(c[0], c[1], c[2]);
    line(e.xPosition, e.yPosition, e.xPosition, 0);
  }
}
