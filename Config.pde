class Config extends Statement {
  float buttonWidth, buttonHeight;
  TextButton type, mouse, up, down, left, right, enter, cancel, shift, spc, esc, quit;
  ArrayList<TextButton> buttons;
  
  Config() {
    super();
    id = CONFIG;
    buttonWidth = 260;
    buttonHeight = 40;
    float bx = buttonWidth * 0.5 + buttonHeight * 0.25;
    float by = buttonHeight * 1.5;
    sd.loadConfig();
    buttons = new ArrayList<TextButton>();
    buttons.add(type = new TextButton("", 20, width * 0.5 - bx, height * 0.5 - by * 3, buttonWidth, buttonHeight, true));
    buttons.add(mouse = new TextButton("", 20, width * 0.5 + bx, height * 0.5 - by * 3, buttonWidth, buttonHeight, false));
    buttons.add(up = new TextButton("", 20, width * 0.5 - bx, height * 0.5 - by * 2, buttonWidth, buttonHeight, false));
    buttons.add(down = new TextButton("", 20, width * 0.5 + bx, height * 0.5 - by * 2, buttonWidth, buttonHeight, false));
    buttons.add(left = new TextButton("", 20, width * 0.5 - bx, height * 0.5 - by, buttonWidth, buttonHeight, false));
    buttons.add(right = new TextButton("", 20, width * 0.5 + bx, height * 0.5 - by, buttonWidth, buttonHeight, false));
    buttons.add(enter = new TextButton("", 20, width * 0.5 - bx, height * 0.5, buttonWidth, buttonHeight, false));
    buttons.add(cancel = new TextButton("", 20, width * 0.5 + bx, height * 0.5, buttonWidth, buttonHeight, false));
    buttons.add(shift = new TextButton("", 20, width * 0.5 - bx, height * 0.5 + by, buttonWidth, buttonHeight, false));
    buttons.add(spc = new TextButton("", 20, width * 0.5 + bx, height * 0.5 + by, buttonWidth, buttonHeight, false));
    buttons.add(esc = new TextButton("", 20, width * 0.5 - bx, height * 0.5 + by * 2, buttonWidth, buttonHeight, false));
    buttons.add(quit = new TextButton("完了", 20, width * 0.5, height * 0.5 + by * 3, buttonWidth, buttonHeight, true));
  }
  
  void update() {
    if(!startFlag) {
      loadText();
      for(int i = 0; i < buttons.size(); i++) {
        buttons.get(i).drawOnlyUpdate();
      }
      fadeIn();
    } else {
      if(!endFlag) {
        loadText();
        for(int i = 0; i < buttons.size(); i++) {
          buttons.get(i).update();
        }
        if(type.workFlag) changeInputType();
        endFlag = quit.workFlag;
      } else {
        loadText();
        for(int i = 0; i < buttons.size(); i++) {
          buttons.get(i).drawOnlyUpdate();
        }
        fadeOut();
        if(fadeCount > fadeTime) {
          sd.saveConfig();
          nextState = TITLEMENU;
        }
      }
    }
  }
  
  void loadText() {
    String str;
    switch(sd.inputType) {
      case SaveData.TYPE_A:
        str = "A";
        break;
      case SaveData.TYPE_B:
        str = "B";
        break;
      case SaveData.TYPE_C:
        str = "C";
        break;
      case SaveData.TYPE_CUSTOM:
        str = "カスタム";
        break;
      default:
        str = "";
        break;
    }
    type.text = "操作タイプ : " + str;
    mouse.text = "移動入力 : " + (sd.mouseEnabled ? "マウス" : "キーボード");
    up.text = "上 : " + (sd.mouseEnabled ? "マウス" : getKeyName(sd.upKey, sd.upCode));
    down.text = "下 : " + (sd.mouseEnabled ? "マウス" : getKeyName(sd.downKey, sd.downCode));
    left.text = "左 : " + (sd.mouseEnabled ? "マウス" : getKeyName(sd.leftKey, sd.leftCode));
    right.text = "右 : " + (sd.mouseEnabled ? "マウス" : getKeyName(sd.rightKey, sd.rightCode));
    enter.text = "決定/ショット : " + (sd.mouseEnabled ? "マウス左" : getKeyName(sd.enterKey, sd.enterCode));
    cancel.text = "武器変更 : " + (sd.mouseEnabled ? "マウス右" : getKeyName(sd.cancelKey, sd.cancelCode));
    shift.text = "未割り当て : " + getKeyName(sd.shiftKey, sd.shiftCode);
    spc.text = "未割り当て : " + getKeyName(sd.spcKey, sd.spcCode);
    esc.text = "未割り当て : " + getKeyName(sd.escKey, sd.escCode);
  }
  
  void changeInputType() {
    sd.inputType = (sd.inputType < SaveData.TYPE_C) ? sd.inputType + 1 : SaveData.TYPE_A;
    sd.loadConfig();
    type.workFlag = false;
  }
  
  String getKeyName(char tmpKey, int tmpCode) {
    if(tmpKey != CODED) {
      return((tmpKey == ' ') ? "SPACE" : String.valueOf(Character.toUpperCase(tmpKey)));
    } else {
      if(tmpCode == UP) return("↑");
      if(tmpCode == DOWN) return("↓");
      if(tmpCode == LEFT) return("←");
      if(tmpCode == RIGHT) return("→");
      if(tmpCode == SHIFT) return("SHIFT");
      if(tmpCode == ESC) return("ESC");
      return("UNKNOWN");
    }
  }
}
