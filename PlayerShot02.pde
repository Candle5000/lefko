public class PlayerShot02 extends Entity {
  float damage;
  
  PlayerShot02(float x, float y, ArrayList e, Screen s) {
    super(x, y, e, s);
    image = 6011;
    damage = 125;
    direction = radians(270);
    size = 5;
    speed = 511 / fps;
    friend = true;
  }
  
  void update() {
    vc.shot.add(this);
    move();
    speed = (speed < 255 / fps) ? 255 / fps : speed - (count / fps);
    for(int i = entity.size() - 1; i >= 0; i--) {
      Entity e = (Entity)entity.get(i);
      if(!e.friend && e.shield != 0 && getDistance(e) <= (size + e.size)) {
        e.hit(damage);
        delFlag = true;
      }
    }
    count++;
  }
}
