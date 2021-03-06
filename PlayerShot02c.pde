public class PlayerShot02c extends Entity {
  float damage;
  
  PlayerShot02c(float x, float y, ArrayList e, Screen s) {
    super(x, y, e, s);
    image = 6013;
    damage = 1000;
    direction = radians(270);
    size = 10;
    speed = 255 / fps;
    friend = true;
  }
  
  PlayerShot02c(float x, float y, ArrayList e, Screen s, float dmg, float dir, float sz) {
    super(x, y, e, s);
    image = 6013;
    damage = dmg;
    direction = dir;
    size = sz;
    speed = 383 / fps;
    friend = true;
  }
  
  void update() {
    vc.shot.add(this);
    move();
    for(int i = entity.size() - 1; i >= 0; i--) {
      Entity e = (Entity)entity.get(i);
      if(!e.friend && e.shield != 0 && getDistance(e) <= (size + e.size)) {
        e.hit(damage);
        delFlag = true;
      }
    }
    
    if(!delFlag && count > fps * 0.15 && damage > 150) {
      entity.add(new PlayerShot02c(xPosition, yPosition, entity, scr, damage * 0.7, direction - radians(15), size * 0.9));
      entity.add(new PlayerShot02c(xPosition, yPosition, entity, scr, damage * 0.7, direction + radians(15), size * 0.9));
      delFlag = true;
    }
    
    count++;
  }
}
