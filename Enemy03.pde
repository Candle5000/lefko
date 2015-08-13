public class Enemy03 extends Entity {
  int moveCount;
  float destinationX, destinationY;
  boolean startFlag;
  Player player;
  
  Enemy03(float x, float y, ArrayList e, Screen s, Player p) {
    super(x, y, e, s);
    player = p;
    image = 4003;
    point = 20;
    eventFlag = 1;
    shield = 4000;
    size = 9;
    speed = 800 / fps;
    moveCount = 0;
    destinationX = random(scr.xStart + scr.getWidth() * 0.1, scr.xEnd - scr.getWidth() * 0.1);
    destinationY = random(scr.yStart + scr.getHeight() * 0.05, scr.yStart + scr.getHeight() * 0.3);
  }
  
  void update() {
    vc.enemy.add(this);
    
    if(!startFlag) {
      if(count > fps * 2) {
        startFlag = true;
        shield = 5000;
        count = 0;
      } else {
        count++;
      }
    } else {
      if(moveCount < 8) {
        track(destinationX, destinationY);
      } else if(count < fps * 4) {
        count++;
      } else {
        moveCount = 0;
        count = 0;
      }
      
      if(xPosition == destinationX && yPosition == destinationY && moveCount < 8) {
        while(true) {
          float nextX = random(scr.xStart + scr.getWidth() * 0.1, scr.xEnd - scr.getWidth() * 0.1);
          float nextY = random(scr.yStart + scr.getHeight() * 0.05, scr.yStart + scr.getHeight() * 0.3);
          if(dist(destinationX, destinationY, nextX, nextY) > scr.getWidth() * 0.3) {
            destinationX = nextX;
            destinationY = nextY;
            break;
          }
        }
        entity.add(new EnemyShot01(0, xPosition, yPosition, getDirection(player) - radians(30), entity, scr, player));
        entity.add(new EnemyShot01(0, xPosition, yPosition, getDirection(player) - radians(25), entity, scr, player));
        entity.add(new EnemyShot01(1, xPosition, yPosition, getDirection(player) - radians(20), entity, scr, player));
        entity.add(new EnemyShot01(0, xPosition, yPosition, getDirection(player) - radians(15), entity, scr, player));
        entity.add(new EnemyShot01(0, xPosition, yPosition, getDirection(player) - radians(10), entity, scr, player));
        entity.add(new EnemyShot01(1, xPosition, yPosition, getDirection(player), entity, scr, player));
        entity.add(new EnemyShot01(0, xPosition, yPosition, getDirection(player) + radians(10), entity, scr, player));
        entity.add(new EnemyShot01(0, xPosition, yPosition, getDirection(player) + radians(15), entity, scr, player));
        entity.add(new EnemyShot01(1, xPosition, yPosition, getDirection(player) + radians(20), entity, scr, player));
        entity.add(new EnemyShot01(0, xPosition, yPosition, getDirection(player) + radians(25), entity, scr, player));
        entity.add(new EnemyShot01(0, xPosition, yPosition, getDirection(player) + radians(30), entity, scr, player));
        moveCount++;
      }
    }
  }
}
