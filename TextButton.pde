class TextButton {
  int drawMode;
  float textSize, x1, y1, x2, y2;
  boolean mouseOverFlag, pushFlag, workFlag, enabled;
  String text;
  
  TextButton(String txt, float ts, float x1tmp, float y1tmp, float x2tmp, float y2tmp, boolean en) {
    this(txt, ts, x1tmp, y1tmp, x2tmp, y2tmp, en, CENTER);
  }
  
  TextButton(String txt, float ts, float x1tmp, float y1tmp, float x2tmp, float y2tmp, boolean en, int mode) {
    drawMode = mode;
    text = txt;
    textSize = ts;
    x1 = x1tmp;
    y1 = y1tmp;
    x2 = x2tmp;
    y2 = y2tmp;
    enabled = en;
    mouseOverFlag = false;
    pushFlag = false;
    workFlag = false;
  }
  
  void update() {
    vc.textButton.add(this);
    if(enabled) {
      if(drawMode == CENTER) {
        mouseOverFlag = (mouseX > (x1 - x2 / 2) && mouseX < (x1 + x2 / 2) && mouseY > (y1 - y2 / 2) && mouseY < (y1 + y2 / 2));
      } else if(drawMode == CORNERS) {
        mouseOverFlag = (mouseX > x1 && mouseX < x2 && mouseY > y1 && mouseY < y2);
      }
      if(pushFlag && !(mouseOverFlag && mousePressed && mouseButton == LEFT)) {
        workFlag = true;
      }
      pushFlag = (mouseOverFlag && mousePressed && mouseButton == LEFT);
    }
  }
  
  void drawOnlyUpdate() {
    mouseOverFlag = false;
    vc.textButton.add(this);
  }
}
