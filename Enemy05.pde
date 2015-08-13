public class Enemy05 extends Entity {
  float destinationX, destinationY;
  boolean startFlag;
  Player player;
  
  Enemy05(float x, float y, ArrayList e, Screen s, Player p) {
    super(x, y, e, s);
    player = p;
    image = 4005;
    point = 20;
    eventFlag = 1;
    shield = 6000;
    size = 9;
    speed = 35 / fps;
    destinationX = random(scr.xStart + scr.getWidth() * 0.1, scr.xEnd - scr.getWidth() * 0.1);
    destinationY = random(scr.yStart + scr.getHeight() * 0.05, scr.yStart + scr.getHeight() * 0.3);
  }
  
  void update() {
    vc.enemy.add(this);
    
    if(!startFlag) {
      if(count > fps * 2) {
        startFlag = true;
        shield = 6000;
        count = 0;
      } else {
        count++;
      }
    } else {
      track(destinationX, destinationY);
      
      while(xPosition == destinationX && yPosition == destinationY) {
        float nextX = random(scr.xStart + scr.getWidth() * 0.1, scr.xEnd - scr.getWidth() * 0.1);
        float nextY = random(scr.yStart + scr.getHeight() * 0.05, scr.yStart + scr.getHeight() * 0.3);
        if(dist(destinationX, destinationY, nextX, nextY) > scr.getWidth() * 0.3) {
          destinationX = nextX;
          destinationY = nextY;
          break;
        }
      }
      
      if(count % (fps * 0.2) == 0) {
        for(int i = 0; i < 9; i++) {
          if(random(0,99) < 70) {
            entity.add(new EnemyShot01(3, xPosition, yPosition, getDirection(player) + radians(random(-60,60)), entity, scr, player));
          } else {
            entity.add(new EnemyShot01(4, xPosition, yPosition, getDirection(player) + radians(random(-60,60)), entity, scr, player));
          }
          if(count % (fps * 3) == 0) {
            entity.add(new EnemyShot01(5, xPosition, yPosition, getDirection(player) + radians(24 * (i - 5)), entity, scr, player));
          }
        }
      }
      
      count++;
    }
  }
}
