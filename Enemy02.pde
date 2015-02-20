public class Enemy02 extends Entity {
  float turnSpeed, dircor;
  Player player;
  
  Enemy02(float x, float y, ArrayList e, Screen s, Player p) {
    super(x, y, e, s);
    player = p;
    image = 4002;
    point = 3;
    shield = 400;
    size = 9;
    speed = 95 / fps;
    turnSpeed = radians(90 / fps);
    dircor = radians((random(0,2) < 1) ? -30 : 30);
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
    if((count > fps * 0.5) && ((count % fps == 0) || (count % fps == fps * 0.1) || (count % fps == fps * 0.2) || (count % fps == fps * 0.3)) && (yPosition < (scr.yStart + scr.getHeight() * 0.75))) {
      entity.add(new EnemyShot01(0, xPosition, yPosition, getDirection(player), entity, scr, player));
    }
  }
}
