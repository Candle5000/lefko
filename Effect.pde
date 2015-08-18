class Effect extends Entity {
  int countEnd;
  Player player;
  
  Effect(ArrayList e, Screen s, Player p) {
    super(p.xPosition, p.yPosition, e, s);
    image = 8001;
    player = p;
    friend = true;
    countEnd = (int)(0.4 * fps);
  }
  
  void update() {
    vc.effect.add(this);
    xPosition = player.xPosition;
    yPosition = player.yPosition;
    if(count > countEnd) delFlag = true;
    count++;
  }
}
