public class Enemy04 extends Entity {
  float destinationY;
  Player player;
  
  Enemy04(float x, float y, ArrayList e, Screen s, Player p) {
    super(x, y, e, s);
    player = p;
    image = 4004;
    point = 3;
    shield = 200;
    size = 9;
    speed = 120 / fps;
    maxSpeed = speed;
    destinationY = random(scr.yStart + scr.getHeight() * 0.05, scr.yStart + scr.getHeight() * 0.3);
  }
  
  void update() {
    vc.enemy.add(this);
    
    if(count == 0 && yPosition != destinationY) {
      smoothTrack(xPosition, destinationY);
    } else if(count < fps * 6) {
      if(count % (fps * 2) == fps) {
        entity.add(new EnemyShot01(2, xPosition, yPosition, getDirection(player), entity, scr, player));
      }
      count++;
    } else {
      smoothTrack(xPosition, 0);
    }
  }
}
