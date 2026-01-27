int timerStart, currentTime, endSetup, drawBeginning, drawEnd;
//
void setup() {
  timerStart = millis(); //Measure program start time called "scope"
  println("Beginning", timerStart);
  //Code for Setup()
  endSetup = millis();
  println("End Setup", endSetup);
} //End setup
//
void draw() {
  drawBeginning = millis();
  println("Draw Beginning", drawBeginning);
  noLoop(); //Affects exit() & draw() looping
  drawEnd = millis();
  println("Draw End 1:", drawEnd);
  exit();
  drawEnd = millis();
  println("Draw End 2:", drawEnd);
}
