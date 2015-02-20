class EnemyShot01 extends Entity {
  float damage;
  Player player;
  
  EnemyShot01(float x, float y, float dir, ArrayList e, Screen s, Player p) {
    super(x, y, e, s);
    player = p;
    image = 6001;
    damage = 30;
    direction = dir;
    size = 3;
    speed = 255 / fps;
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
