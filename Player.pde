class Player extends Entity {
  int chargeEffectCount;
  float charge, chargeMax, shieldMax, energy, energyMax, enReg;
  boolean shotFlag;
  ArrayList entity;
  
  Player(ArrayList e, Screen s) {
    super((s.xStart + s.xEnd) * 0.5, s.yStart + s.getHeight() * 0.95, e, s);
    entity = e;
    scr = s;
    charge = 0;
    chargeMax = (int)fps * 2;
    shield = 1000;
    shieldMax = 1000;
    energy = 500;
    energyMax = 1000;
    size = 8;
    speed = 165 / fps;
    enReg = 60 / fps;
    friend = true;
    shotFlag = false;
  }
  
  void update() {
    
    // Energy回復
    if(energy < energyMax) {
      energy += enReg;
    } else {
      energy = energyMax;
    }
    
    // 移動
    track(mouseX, mouseY);
    if(xPosition < scr.xStart) {
      xPosition = scr.xStart;
    } else if (xPosition > scr.xEnd) {
      xPosition = scr.xEnd;
    }
    if(yPosition < scr.yStart) {
      yPosition = scr.yStart;
    } else if (yPosition > scr.yEnd) {
      yPosition = scr.yEnd;
    }
    
    // Shot
    if (mousePressed && mouseButton == LEFT) {
      if(shotFlag && charge < (chargeMax * 1.5)) {
        charge++;
      } else {
        shotFlag = true;
      }
    } else if(shotFlag) {
      if(energy >= 300 && charge >= chargeMax) {
        // Charge Shot
        energy -= 300;
        entity.add(new PlayerShot01c(xPosition - 10, yPosition - 2, entity, scr, this));
        entity.add(new PlayerShot01c(xPosition + 10, yPosition - 2, entity, scr, this));
      } else if(energy >= 30) {
        // Normal Shot
        energy -= 30;
        entity.add(new PlayerShot01(xPosition - 10, yPosition - 2, entity, scr));
        entity.add(new PlayerShot01(xPosition + 10, yPosition - 2, entity, scr));
      }
      shotFlag = false;
      charge = 0;
    }
  }
}
