class Key {
  String name;
  char key;
  int keyCode;
  boolean isPressed;
  
  Key(String tmpName, char tmpKey, int tmpKeyCode) {
    name = tmpName;
    key = tmpKey;
    keyCode = tmpKeyCode;
    isPressed = false;
  }
  
  boolean equals(char tmpKey, int tmpKeyCode) {
    if(tmpKey != CODED) {
      tmpKey = Character.toLowerCase(tmpKey);
      return(tmpKey == key);
    } else {
      return(tmpKeyCode == keyCode);
    }
  }
  
  void pressed(char tmpKey, int tmpKeyCode) {
    if(equals(tmpKey, tmpKeyCode)) isPressed = true;
  }
  
  void released(char tmpKey, int tmpKeyCode) {
    if(equals(tmpKey, tmpKeyCode)) isPressed = false;
  }
}
