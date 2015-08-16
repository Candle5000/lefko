class KeyController {
  Key up, down, left, right, shift, enter, cancel, spc, esc;
  ArrayList<Key> keys;
  
  KeyController() {
    up = new Key("UP", sd.upKey, sd.upCode);
    down = new Key("DOWN", sd.downKey, sd.downCode);
    left = new Key("LEFT", sd.leftKey, sd.leftCode);
    right = new Key("RIGHT", sd.rightKey, sd.rightCode);
    shift = new Key("SHIFT", sd.shiftKey, sd.shiftCode);
    enter = new Key("ENTER", sd.enterKey, sd.enterCode);
    cancel = new Key("CANCEL", sd.cancelKey, sd.cancelCode);
    spc = new Key("SPC", sd.spcKey, sd.spcCode);
    esc = new Key("ESC", sd.escKey, sd.escCode);
    keys = new ArrayList<Key>();
    keys.add(up);
    keys.add(down);
    keys.add(left);
    keys.add(right);
    keys.add(shift);
    keys.add(enter);
    keys.add(cancel);
    keys.add(spc);
  }
  
  void pressed(char tmpKey, int tmpKeyCode) {
    for(int i = keys.size() - 1; i >= 0; i--) {
      Key k = keys.get(i);
      k.pressed(tmpKey, tmpKeyCode);
    }
  }
  
  void released(char tmpKey, int tmpKeyCode) {
    for(int i = keys.size() - 1; i >= 0; i--) {
      Key k = keys.get(i);
      k.released(tmpKey, tmpKeyCode);
    }
  }
}
