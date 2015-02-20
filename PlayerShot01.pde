public class PlayerShot01 extends Entity {
  float damage;
  
  PlayerShot01(float x, float y, ArrayList e, Screen s) {
    super(x, y, e, s);
    image = 6011;
    damage = 80;
    direction = radians(270);
    size = 3;
    friend = true;
  }
  
  void update() {
    vc.shot.add(this);
    speed = 255 / fps;
    move();
    for(int i = entity.size() - 1; i >= 0; i--) {
      Entity e = (Entity)entity.get(i);
      if(!e.friend && e.shield != 0 && getDistance(e) <= (size + e.size)) {
        e.hit(damage);
        delFlag = true;
      }
    }
  }
}
