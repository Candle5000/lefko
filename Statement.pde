abstract class Statement {
  int id, count, fadeCount;
  boolean startFlag, endFlag;
  
  Statement() {
    count = 0;
    fadeCount = 0;
    startFlag = false;
    endFlag = false;
  }
  
  abstract void update();
  
  void fadeIn() {
    if(!startFlag) {
      if(fadeCount < fps) {
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
