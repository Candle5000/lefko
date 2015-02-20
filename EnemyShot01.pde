class EnemyShot01 extends Entity {
  final float shotData[][] = {
    // image, damage, size, speed
    {6001, 40, 3, 255},
    {6021, 120, 5, 180},
    {6002, 100, 3, 400}
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
  }
  
  void update() {
    vc.shot.add(this);
    move();
    if(getDistance(player.xPosition, player.yPosition) <= (size + player.size)) {
      player.hit(damage);
      delFlag = true;
    }
  }
}
