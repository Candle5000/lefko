public class Enemy01 extends Entity {
  float turnSpeed, dircor;
  Player player;
  
  Enemy01(float x, float y, ArrayList e, Screen s, Player p) {
    super(x, y, e, s);
    player = p;
    image = 4001;
    point = 1;
    shield = 100;
    size = 9;
    speed = 165 / fps;
    turnSpeed = radians(180 / fps);
    dircor = radians((random(0,2) < 1) ? -15 : 15);
  }
  
  void update() {
    vc.enemy.add(this);
    
    // Direction set
    if(count++ < fps * 1.5) {
      if(abs(direction - (getDirection(player) + dircor)) > turnSpeed) {
        direction += (direction > (getDirection(player) + dircor)) ? -turnSpeed : turnSpeed;
      } else {
        direction = getDirection(player) + dircor;
      }
    }
    
    move();
    
    // Shot
    if((count > fps * 0.5) && (count % fps == 0) && (yPosition < (scr.yStart + scr.getHeight() * 0.75))) {
      if(random(0,99) < 20) {
        entity.add(new EnemyShot01(0, xPosition, yPosition, getDirection(player), entity, scr, player));
        entity.add(new EnemyShot01(0, xPosition, yPosition, getDirection(player) + radians(15), entity, scr, player));
        entity.add(new EnemyShot01(0, xPosition, yPosition, getDirection(player) - radians(15), entity, scr, player));
      } else {
        entity.add(new EnemyShot01(0, xPosition, yPosition, getDirection(player), entity, scr, player));
      }
    }
  }
}
