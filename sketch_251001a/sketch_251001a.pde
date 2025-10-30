/* DIVs: 2D Rectangles
*/
//
fullScreen(); //displayWidth //displayHeight
println(displayWidth, displayHeight);
int appWidth = displayWidth;
int appHeight = displayHeight;
//
float stopX = divX + divWidth * 1/4;
float stopY = divY + divHeight * 1/4;
float stopWidth = divWidth * 2/4; 
float stopHeight = divHeight * 1/2;
float mute1X1 = stopx;
float mute1Y1 = stopY;
float mute2X2 = stopX;
float mute2Y2 = stopY;
float mute3X1 = stopX;
float mute3Y1 = stopY;
float mute4X2 = stopX;
float mute4Y2 = stopY;
float divX = appWidth * 2.8/16;
float divY = appHeight * 2.8/16;
float divWidth = appWidth * 22/34;
float divHeight = appHeight * 24/34;
float playX1 = divX + divWidth * 1/4;
float playY1 = divY + divHeight * 1/4;
float playX2 = divX + divWidth * 3/4; 
float playY2 = divY + divHeight * 1/2;
float playX3 = divX + divWidth * 1/4;
float playY3 = divY + divHeight * 3/4;
//
rect(divX, divY, divWidth, divHeight);
//
rect(stopX, stopY, stopWidth, stopHeight);
triangle(playX1, playY1, playX2, playY2, playX3, playY3);
line(mute1X1, mute1Y1, mute2X2, mute2Y2);
line(mute3X1, mute3Y1, mute4X2, mute4Y2);
