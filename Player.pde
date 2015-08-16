class Player extends Entity {
  int chargeEffectCount, weapon;
  float charge, chargeMax, shieldMax, energy, energyMax, enReg;
  boolean shotFlag, changeFlag, shotOn, changeOn;
  ArrayList entity;
  static final float SPEED_N = 165;
  
  Player(ArrayList e, Screen s) {
    super((s.xStart + s.xEnd) * 0.5, s.yStart + s.getHeight() * 0.95, e, s);
    entity = e;
    scr = s;
    weapon = 1;
    charge = 0;
    chargeMax = (int)fps * 1.5;
    shield = 1000;
    shieldMax = 1000;
    energy = 500;
    energyMax = 1000;
    size = 6;
    speed = SPEED_N / fps;
    enReg = 60 / fps;
    friend = true;
    shotFlag = false;
    changeFlag = false;
  }
  
  void update() {
    
    // Energy回復
    if(energy < energyMax) {
      energy += enReg;
    } else {
      energy = energyMax;
    }
    
    // 移動
    if(mouseEnabled) {
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
    } else {
      if(kc.up.isPressed || kc.down.isPressed || kc.left.isPressed || kc.right.isPressed) {
        if(kc.up.isPressed && kc.right.isPressed) {
          direction = radians(315);
        } else if(kc.up.isPressed && kc.left.isPressed) {
          direction = radians(225);
        } else if(kc.down.isPressed && kc.right.isPressed) {
          direction = radians(45);
        } else if(kc.down.isPressed && kc.left.isPressed) {
          direction = radians(135);
        } else if(kc.up.isPressed) {
          direction = radians(270);
        } else if(kc.down.isPressed) {
          direction = radians(90);
        } else if(kc.right.isPressed) {
          direction = radians(0);
        } else if(kc.left.isPressed) {
          direction = radians(180);
        }
        move();
      }
    }
    
    // Shot
    if(mouseEnabled) {
      shotOn = (mousePressed && mouseButton == LEFT);
      changeOn = (mousePressed && mouseButton == RIGHT);
    } else {
      shotOn = kc.enter.isPressed;
      changeOn = kc.cancel.isPressed;
    }
    if (shotOn) {
      if(shotFlag && charge < (chargeMax * 1.5)) {
        charge++;
      } else {
        shotFlag = true;
      }
    } else if(shotFlag) {
      if(weapon == 1) {
        if(energy >= 400 && charge >= chargeMax) {
          // Charge Shot
          energy -= 400;
          entity.add(new PlayerShot01c(xPosition - 10, yPosition - 2, entity, scr, this));
          entity.add(new PlayerShot01c(xPosition + 10, yPosition - 2, entity, scr, this));
        } else if(energy >= 30) {
          // Normal Shot
          energy -= 30;
          entity.add(new PlayerShot01(xPosition - 10, yPosition - 2, entity, scr));
          entity.add(new PlayerShot01(xPosition + 10, yPosition - 2, entity, scr));
        }
      } else if(weapon == 2) {
        if(energy >= 400 && charge >= chargeMax) {
          // Charge Shot
          energy -= 400;
          entity.add(new PlayerShot02c(xPosition - 10, yPosition - 2, entity, scr));
        } else if(energy >= 50) {
          // Normal Shot
          energy -= 50;
          entity.add(new PlayerShot02(xPosition, yPosition - 2, entity, scr));
        }
      } else if(weapon == 3) {
        if(energy >= 600 && charge >= chargeMax) {
          // Charge Shot
          energy -= 600;
          entity.add(new PlayerShot03c(entity, scr, this));
        } else if(energy >= 80) {
          // Normal Shot
          energy -= 80;
          entity.add(new PlayerShot03(xPosition, yPosition - 2, entity, scr, radians(254)));
          entity.add(new PlayerShot03(xPosition, yPosition - 2, entity, scr, radians(258)));
          entity.add(new PlayerShot03(xPosition, yPosition - 2, entity, scr, radians(262)));
          entity.add(new PlayerShot03(xPosition, yPosition - 2, entity, scr, radians(266)));
          entity.add(new PlayerShot03(xPosition, yPosition - 2, entity, scr, radians(270)));
          entity.add(new PlayerShot03(xPosition, yPosition - 2, entity, scr, radians(274)));
          entity.add(new PlayerShot03(xPosition, yPosition - 2, entity, scr, radians(278)));
          entity.add(new PlayerShot03(xPosition, yPosition - 2, entity, scr, radians(282)));
          entity.add(new PlayerShot03(xPosition, yPosition - 2, entity, scr, radians(284)));
        }
      }
      shotFlag = false;
      changeFlag = false;
      charge = 0;
    } else if(changeOn) {
      changeFlag = true;
    } else if(changeFlag) {
      weapon = (weapon == 3) ? 1 : weapon + 1;
      changeFlag = false;
    }
  }
}
