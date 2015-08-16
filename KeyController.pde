class KeyController {
  Key up, down, left, right, shift, enter, cancel, spc;
  ArrayList<Key> keys;
  
  KeyController() {
    up = new Key("UP", (char)CODED, UP);
    down = new Key("DOWN", (char)CODED, DOWN);
    left = new Key("LEFT", (char)CODED, LEFT);
    right = new Key("RIGHT", (char)CODED, RIGHT);
    shift = new Key("SHIFT", (char)CODED, SHIFT);
    enter = new Key("ENTER", 'z', 0);
    cancel = new Key("CANCEL", 'x', 0);
    spc = new Key("SPC", ' ', 0);
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
