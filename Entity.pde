abstract class Entity {
  int image, count, score, point, eventFlag;
  float shield, xPosition, yPosition, direction, size, speed;
  boolean friend, delFlag;
  ArrayList entity;
  Screen scr;
  
  Entity(float x, float y, ArrayList e, Screen s) {
    image = 0;
    count = 0;
    score = 0;
    point = 0;
    eventFlag = 0;
    shield = 0;
    xPosition = x;
    yPosition = y;
    direction = radians(90);
    size = 0;
    speed = 0;
    friend = false;
    delFlag = false;
    entity = e;
    scr = s;
  }
  
  abstract void update();
  
  void move() {
    xPosition += speed * cos(direction);
    yPosition += speed * sin(direction);
    if(xPosition < (scr.xStart - scr.getWidth() / 20) || xPosition > (scr.xEnd + scr.getWidth() / 20) || yPosition < (scr.yStart - scr.getHeight() / 20) || yPosition > (scr.yEnd + scr.getHeight() / 20)) {
      delFlag = true;
    }
  }

  void track(float x, float y) {
    direction = getDirection(x, y);
    if(getDistance(x, y) > speed) {
      move();
    } else {
      xPosition = x;
      yPosition = y;
    }
  }
  
  void track(Entity target) {
    direction = getDirection(target);
    if(getDistance(target) > speed) {
      move();
    } else {
      xPosition = target.xPosition;
      yPosition = target.yPosition;
    }
  }
  
  void hit(float damage) {
    if(shield > 0) {
      shield -= damage;
      if(shield <= 0) {
        score = point;
        delFlag = true;
      }
    }
  }
  
  float getDirection(float x, float y) {
    return atan2(y - yPosition, x - xPosition);
  }
  
  float getDirection(Entity e) {
    return atan2(e.yPosition - yPosition, e.xPosition - xPosition);
  }
  
  float getDistance(float x, float y) {
    return dist(x, y, xPosition, yPosition);
  }
  
  float getDistance(Entity e) {
    return dist(e.xPosition, e.yPosition, xPosition, yPosition);
  }
  
  boolean isToutched(float x, float y, float sz) {
    return(getDistance(x, y) < (size + sz));
  }
  
  boolean isToutched(Entity e) {
    return(getDistance(e.xPosition, e.yPosition) < (size + e.size));
  }
}
