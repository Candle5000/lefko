class EnemyShot01 extends Entity {
  final float shotData[][] = {
    // image, damage, size, speed
    {6001, 40, 3, 300},
    {6021, 120, 10, 200},
    {6002, 100, 3, 500},
    {6003, 60, 3, 150},
    {6003, 60, 3, 250},
    {6031, 150, 30, 200}
  };
  float damage;
  Player player;
  
  EnemyShot01(int type, float x, float y, float dir, ArrayList e, Screen s, Player p) {
    super(x, y, e, s);
    player = p;
    image = (int)shotData[type][0];
    damage = shotData[type][1];
    direction = dir;
    size = shotData[type][2];
    speed = shotData[type][3] / fps;
    canReflect = true;
  }
  
  void update() {
    vc.shot.add(this);
    move();
    if(!friend && getDistance(player.xPosition, player.yPosition) <= (size + player.size)) {
      player.hit(damage);
      delFlag = true;
    } else if(friend) {
      for(int i = entity.size() - 1; i >= 0; i--) {
        Entity e = (Entity)entity.get(i);
        if(!e.friend && e.shield != 0 && getDistance(e) <= (size + e.size)) {
          e.hit(damage);
          delFlag = true;
        }
      }
    }
  }
}
