public class PlayerShot03 extends Entity {
  float damage;
  int subcount;
  
  PlayerShot03(float x, float y, ArrayList e, Screen s, float dir) {
    super(x, y, e, s);
    image = 6014;
    damage = 40;
    direction = dir;
    subcount = 0;
    size = 5.5;
    speed = 700 / fps;
    friend = true;
  }
  
  void update() {
    vc.shot.add(this);
    move();
    if(count > fps * 0.05) {
      size -= subcount * 0.25;
      if(size < 1) delFlag = true;
      count = 0;
      subcount++;
    }
    for(int i = entity.size() - 1; i >= 0; i--) {
      Entity e = (Entity)entity.get(i);
      if(!e.friend && !e.delFlag && e.shield != 0 && getDistance(e) <= (size + e.size)) {
        e.hit(damage);
        delFlag = true;
      } else if(!e.friend && !e.delFlag && e.canReflect && getDistance(e) <= (size * 1.5 + e.size) && e.size < 10) {
        e.friend = true;
        e.direction = e.direction - ((e.direction - direction) * 2 - radians(180));
        size -= 0.1;
        if(size < 1) delFlag = true;
        count = 0;
        subcount++;
      }
    }
    count++;
  }
}
