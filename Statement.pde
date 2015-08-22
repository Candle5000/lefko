abstract class Statement {
  int id, count, fadeCount, fadeTime;
  boolean startFlag, endFlag;
  
  Statement() {
    count = 0;
    fadeCount = 0;
    fadeTime = (int)(fps * 0.6);
    startFlag = false;
    endFlag = false;
  }
  
  abstract void update();
  
  void fadeIn() {
    if(!startFlag) {
      if(fadeCount < fadeTime) {
        fadeCount++;
      } else {
        startFlag = true;
        fadeCount = 0;
      }
    }
  }
  
  void fadeOut() {
    if(endFlag) {
      fadeCount++;
    }
  }
}
