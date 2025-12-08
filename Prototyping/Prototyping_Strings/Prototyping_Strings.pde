/* String
*/
//
//Display
fullScreen(); //Landscape
size(500, 100); //Portrait
int appWidth = displayWidth; //displayWidth
int appHeight = displayHeight; //displayHeight
//println("Display VARS:", "appWidth:"+appWidth, "appHeight:"+appHeight);
//println("\t\t\t\tFullScreen, displayWidth:\t"+displayWidth, "\tdisplayHeight:\t"+displayHeight, "\n\t\t\t\tSize\t, width:\t\t"+width, "\theight:\t\t"+height);
float stringDivX = appWidth*1/4;
float stringDivY = appHeight*1/9;
float stringDivWidth = appWidth*1/2;
float stringDivHeight = appHeight*4/5;
String title = "Holy crackers";
float fontSize = 500;
PFont titleFont;
String Papyrus = "Papyrus";
titleFont = createFont (Papyrus, fontSize);
rect(stringDivX, stringDivY, stringDivWidth, stringDivHeight);
color greenInk = #10FF0D;
fill(greenInk);
text(title, stringDivX, stringDivY, stringDivWidth, stringDivHeight);
textFont(titleFont, fontSize);
