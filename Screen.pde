class Screen {
  int frameR, frameG, frameB;
  float xStart, yStart, xEnd, yEnd;
  
  Screen() {
    xStart = width * 0.5 - 240;
    yStart = height * 0.5 - 320;
    xEnd = width * 0.5 + 240;
    yEnd = height * 0.5 + 320;
    frameR = 80;
    frameG = 96;
    frameB = 128;
  }
  
  float getWidth() {
    return(xEnd - xStart);
  }
  
  float getHeight() {
    return(yEnd - yStart);
  }
}
