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
      print("Key : " + key + "\n");
/*      if(tmpKey == m_key) {
        return(true);
      } else {
        return(false);
      }*/
      return(tmpKey == key);
    } else {
      print("KeyCode : " + keyCode + "\n");
/*      if(tmpKeyCode == m_keyCode) {
        return(true);
      } else {
        return(false);
      }*/
      return(tmpKeyCode == keyCode);
    }
  }
  
  void pressed(char tmpKey, int tmpKeyCode) {
    if(equals(tmpKey, tmpKeyCode)) {
      isPressed = true;
      print(name + " pressed\n");
    }
  }
  
  void released(char tmpKey, int tmpKeyCode) {
    if(equals(tmpKey, tmpKeyCode)) {
      isPressed = false;
      print(name + " released\n");
    }
  }
}
