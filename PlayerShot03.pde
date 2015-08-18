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
    speed = 680 / fps;
    friend = true;
  }
  
  void update() {
    vc.shot.add(this);
    move();
    if(count > fps * 0.05) {
      size -= subcount * 25 / fps;
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
        EnemyShot01 s = (EnemyShot01)e;
        s.friend = true;
        s.direction = s.direction - ((s.direction - direction) * 2 - radians(180));
        size -= s.damage * 0.05;
        if(size < 1) delFlag = true;
        count = 0;
      }
    }
    count++;
  }
}
