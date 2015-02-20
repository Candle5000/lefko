class Screen {
  int frameR, frameG, frameB;
  float xStart, yStart, xEnd, yEnd;
  
  Screen() {
    xStart = width * 0.2;
    yStart = height * 0.1;
    xEnd = width * 0.8;
    yEnd = height * 0.9;
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
