public class PlayerShot03c extends Entity {
  float damage;
  Player player;
  
  PlayerShot03c(ArrayList e, Screen s, Player p) {
    super(p.xPosition, p.yPosition, e, s);
    player = p;
    image = 6801;
    damage = 400 / fps;
    size = 0;
    friend = true;
  }
  
  void update() {
    vc.shot.add(this);
    xPosition = player.xPosition;
    yPosition = player.yPosition;
    if(count <= (int)(fps * 3)) {
      size = count * 100 / fps;
      if(size > 40) size = 40;
      for(int i = entity.size() - 1; i >= 0; i--) {
        Entity e = (Entity)entity.get(i);
        if(!e.friend && !e.delFlag && e.shield != 0 && getDistance(e) <= (size + e.size)) {
          e.hit(damage);
        } else if(!e.friend && !e.delFlag && e.canReflect && getDistance(e) <= (size + e.size) && e.size < ((count < fps * 0.4) ? 50 : 25)) {
          EnemyShot01 s = (EnemyShot01)e;
          s.friend = true;
          s.direction = s.direction - radians(180);
          s.speed = (s.speed > 400) ? 600 : s.speed * 1.5;
        } else if(!e.friend && !e.delFlag && getDistance(e) <= (size + e.size)) {
          EnemyShot01 s = (EnemyShot01)e;
          s.damage = s.damage - 250 / fps;
          s.speed = s.speed - 200 / fps / fps;
          if(s.damage < 30) s.damage = 30;
          if(s.speed < 100 / fps) s.speed = 100 / fps;
        }
      }
      count++;
    } else {
      delFlag = true;
    }
  }
}
