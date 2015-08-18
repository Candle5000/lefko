public class PlayerShot03c extends Entity {
  float damage, maxSize;
  int openCount, countEnd;
  Player player;
  
  PlayerShot03c(ArrayList e, Screen s, Player p) {
    super(p.xPosition, p.yPosition, e, s);
    player = p;
    image = 6801;
    damage = 400 / fps;
    size = player.size;
    maxSize = 50 - player.size;
    openCount = (int)(0.4 * fps);
    countEnd = (int)(3.5 * fps);
    friend = true;
  }
  
  void update() {
    vc.shot.add(this);
    xPosition = player.xPosition;
    yPosition = player.yPosition;
    if(count <= countEnd) {
      size = (count < openCount) ? player.size + maxSize * count / openCount : player.size + maxSize - maxSize * pow((float)(count - openCount) / (float)(countEnd - openCount), 5);
      if(size > maxSize) size = maxSize;
      for(int i = entity.size() - 1; i >= 0; i--) {
        Entity e = (Entity)entity.get(i);
        if(!e.friend && !e.delFlag && e.shield != 0 && isToutched(e)) {
          e.hit(damage);
        } else if(!e.friend && !e.delFlag && e.canReflect && isToutched(e) && e.size < ((count < fps * 0.5) ? 50 : 25)) {
          EnemyShot01 s = (EnemyShot01)e;
          s.friend = true;
          s.direction = s.direction - radians(180);
          s.speed = (s.speed > 400) ? 600 : s.speed * 1.5;
        } else if(!e.friend && !e.delFlag && isToutched(e)) {
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
