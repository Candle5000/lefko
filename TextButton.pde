class TextButton {
  float textSize, xPosition, yPosition, xSize, ySize;
  boolean mouseOverFlag, pushFlag, workFlag;
  String text;
  
  TextButton(String txt, float ts, float x, float y, float xs, float ys) {
    text = txt;
    textSize = ts;
    xPosition = x;
    yPosition = y;
    xSize = xs;
    ySize = ys;
    mouseOverFlag = false;
    pushFlag = false;
    workFlag = false;
  }
  
  void update() {
    vc.textButton.add(this);
    mouseOverFlag = (mouseX > (xPosition - xSize / 2) && mouseX < (xPosition + xSize / 2) && mouseY > (yPosition - ySize / 2) && mouseY < (yPosition + ySize / 2));
    if(pushFlag && !(mouseOverFlag && mousePressed && mouseButton == LEFT)) {
      workFlag = true;
    }
    pushFlag = (mouseOverFlag && mousePressed && mouseButton == LEFT);
  }
}
