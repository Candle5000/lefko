public class PlayerShot01c extends Entity {
  float damage, weight, position;
  Player player;
  
  PlayerShot01c(float x, float y, ArrayList e, Screen s, Player p) {
    super(x, y, e, s);
    player = p;
    image = 6601;
    damage = 800 / fps;
    size = 5;
    position = xPosition - player.xPosition;
    friend = true;
  }
  
  void update() {
    vc.shot.add(this);
    xPosition = player.xPosition + position;
    yPosition = player.yPosition;
    if(count <= (int)(fps * 1.5)) {
      for(int i = entity.size() - 1; i >= 0; i--) {
        Entity e = (Entity)entity.get(i);
        if(e.shield != 0 && !e.friend && abs(xPosition - e.xPosition) <= (size + e.size)) {
          e.hit(damage);
        }
      }
      count++;
    } else {
      delFlag = true;
    }
  }
}
