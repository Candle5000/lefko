class SaveData {
  XML xml;
  int bestScore;
  char upKey, downKey, leftKey, rightKey, enterKey, cancelKey, shiftKey, spcKey, escKey;
  int upCode, downCode, leftCode, rightCode, enterCode, cancelCode, shiftCode, spcCode, escCode;
  boolean mouseEnabled;
  
  SaveData() {
    try {
      xml = loadXML("savedata.xml");
      loadConfig();
      loadBestScore();
    } catch(NullPointerException e) {
      print("p1\n");
      xml = new XML("savedata");
      createSaveData();
      loadConfig();
      loadBestScore();
    }
  }
  
  void loadConfig() {
    XML config = xml.getChild("config");
    mouseEnabled = config.getChild("mouse").getContent().equals("true");
    upKey = (config.getChild("up").getString("key") == "CODED") ? (char)CODED : config.getChild("up").getString("key").charAt(0);
    upCode = config.getChild("up").getInt("code");
    downKey = (config.getChild("down").getString("key") == "CODED") ? (char)CODED : config.getChild("down").getString("key").charAt(0);
    downCode = config.getChild("down").getInt("code");
    leftKey = (config.getChild("left").getString("key") == "CODED") ? (char)CODED : config.getChild("left").getString("key").charAt(0);
    leftCode = config.getChild("left").getInt("code");
    rightKey = (config.getChild("right").getString("key") == "CODED") ? (char)CODED : config.getChild("right").getString("key").charAt(0);
    rightCode = config.getChild("right").getInt("code");
    enterKey = (config.getChild("enter").getString("key") == "CODED") ? (char)CODED : config.getChild("enter").getString("key").charAt(0);
    enterCode = config.getChild("enter").getInt("code");
    cancelKey = (config.getChild("cancel").getString("key") == "CODED") ? (char)CODED : config.getChild("cancel").getString("key").charAt(0);
    cancelCode = config.getChild("cancel").getInt("code");
    shiftKey = (config.getChild("shift").getString("key") == "CODED") ? (char)CODED : config.getChild("shift").getString("key").charAt(0);
    shiftCode = config.getChild("shift").getInt("code");
    spcKey = (config.getChild("spc").getString("key") == "CODED") ? (char)CODED : config.getChild("spc").getString("key").charAt(0);
    spcCode = config.getChild("spc").getInt("code");
    escKey = (config.getChild("esc").getString("key") == "CODED") ? (char)CODED : config.getChild("esc").getString("key").charAt(0);
    escCode = config.getChild("esc").getInt("code");
  }
  
  void loadBestScore() {
    try {
      bestScore = Integer.parseInt(xml.getChild("score").getContent());
    } catch(NumberFormatException e) {
      bestScore = 0;
    }
  }
  
  void saveConfig() {
    XML config = xml.getChild("config");
    config.getChild("up").setString("key", String.valueOf(upKey));
    config.getChild("up").setInt("code", upCode);
    config.getChild("down").setString("key", String.valueOf(downKey));
    config.getChild("down").setInt("code", downCode);
    config.getChild("left").setString("key", String.valueOf(leftKey));
    config.getChild("left").setInt("code", leftCode);
    config.getChild("right").setString("key", String.valueOf(rightKey));
    config.getChild("right").setInt("code", rightCode);
    config.getChild("enter").setString("key", String.valueOf(enterKey));
    config.getChild("enter").setInt("code", enterCode);
    config.getChild("cancel").setString("key", String.valueOf(cancelKey));
    config.getChild("cancel").setInt("code", cancelCode);
    config.getChild("shift").setString("key", String.valueOf(shiftKey));
    config.getChild("shift").setInt("code", shiftCode);
    config.getChild("spc").setString("key", String.valueOf(spcKey));
    config.getChild("spc").setInt("code", spcCode);
    config.getChild("esc").setString("key", String.valueOf(escKey));
    config.getChild("esc").setInt("code", escCode);
    saveXML(xml, "data/savedata.xml");
  }
  
  void saveBestScore() {
    xml.getChild("score").setContent(String.valueOf(bestScore));
    saveXML(xml, "data/savedata.xml");
  }
  
  void setDefaultConfig() {
    upKey = (char)CODED;
    upCode = UP;
    downKey = (char)CODED;
    downCode = DOWN;
    leftKey = (char)CODED;
    leftCode = LEFT;
    rightKey = (char)CODED;
    rightCode = RIGHT;
    enterKey = 'z';
    enterCode = 0;
    cancelKey = 'x';
    cancelCode = 0;
    shiftKey = (char)CODED;
    shiftCode = SHIFT;
    spcKey = ' ';
    spcCode = 0;
    escKey = (char)CODED;
    escCode = ESC;
  }
  
  void createSaveData() {
    XML config = xml.addChild("config");
    config.addChild("mouse").setContent("true");
    XML up = config.addChild("up");
    up.setString("key", "CODED");
    up.setInt("code", UP);
    XML down = config.addChild("down");
    down.setString("key", "CODED");
    down.setInt("code", DOWN);
    XML left = config.addChild("left");
    left.setString("key", "CODED");
    left.setInt("code", LEFT);
    XML right = config.addChild("right");
    right.setString("key", "CODED");
    right.setInt("code", RIGHT);
    XML enter = config.addChild("enter");
    enter.setString("key", "z");
    enter.setInt("code", 0);
    XML cancel = config.addChild("cancel");
    cancel.setString("key", "x");
    cancel.setInt("code", 0);
    XML shift = config.addChild("shift");
    shift.setString("key", "CODED");
    shift.setInt("code", SHIFT);
    XML scp = config.addChild("spc");
    scp.setString("key", " ");
    scp.setInt("code", 0);
    XML esc = config.addChild("esc");
    esc.setString("key", "CODED");
    esc.setInt("code", ESC);
    xml.addChild("score").setContent("0");
    saveXML(xml, "data/savedata.xml");
  }
}
