public class PlayerShot02 extends Entity {
  float damage;
  int subcount;
  
  PlayerShot02(float x, float y, ArrayList e, Screen s) {
    super(x, y, e, s);
    image = 6012;
    damage = 140;
    subcount = 0;
    direction = radians(270);
    size = 5;
    speed = 560 / fps;
    friend = true;
  }
  
  void update() {
    vc.shot.add(this);
    move();
    if(count > fps * 0.1) {
      speed = speed - (subcount * 16 / fps);
      if(speed < 280 / fps) speed = 280 / fps;
      count = 0;
      subcount++;
    }
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
