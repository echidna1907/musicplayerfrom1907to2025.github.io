void settings() {
  println(displayWidth, displayHeight);
  int shorterSide = ( displayWidth > displayHeight ) ? displayHeight : displayWidth ; //Ternary Operator
  shorterSide *= 0.9; //90%, WINDOW Frame
  size(shorterSide, shorterSide); //ERROR IllegalStateException: cannot use a var in size()
  println("Display Questions", displayWidth, displayHeight, shorterSide);
  println("CANVAS Size Key Variables for setup()", width, height);
}
