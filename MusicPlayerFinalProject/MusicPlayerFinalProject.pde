/* Aspect Ratio: Bike Only Demonstration
- Old Man
*/ 
//Display
fullScreen(); //Lanscape
size(500, 700); //Portrait
int appWidth = displayWidth; //Width
int appHeight = displayHeight; //Height
//println("Display VARS:", "appWidth:"+appWidth, "appHeight:"+appHeight, "\n\t\t\tdisplayWidth:"+displayWidth, "displayHeight:"+displayHeight, "width:"+width, "height:"+height);
//
float imageDivX = appWidth*1/4;
float imageDivY = appHeight*1/10;
float imageDivWidth = appWidth*1/2;
float imageDivHeight = appHeight*4/5; 
// 
//Image Aspect Ratio Vars & Algorithm
//Directory or Pathway
String upArrow = "../../";
String folder = "Dependent Folder/Images/";
String whatsapp_horse = "whatsapp_horse";
String fileExtensionJPG = ".jpg";
String imagePathway1 = upArrow + folder + whatsapp_horse + fileExtensionJPG;
//println("WhatsApp Horse Pathway:", imagePathway1);
//Image Loading & Aspect Ratio
PImage image1 = loadImage( imagePathway1 );

int image1Width = 960;
int image1Height = 930;

//Aspect Ratio
float image1AspectRatio_GreaterOne = ( image1Width >= image1Height ) ? float(image1Width)/float(image1Height) : float(image1Height)/float(image1Width);
float imageWidthAdjusted1 = imageDivWidth;
float imageHeightAdjusted1 = ( image1Width >= imageDivWidth ) ? imageWidthAdjusted1 / image1AspectRatio_GreaterOne : imageWidthAdjusted1 * image1AspectRatio_GreaterOne; 
if ( imageHeightAdjusted1 > imageDivHeight ) {
  println("Image doesn't fit, program ended ... Fatal Flaw, must be solved ... Image doesn't show.");
  //exit();
  int indexWhile = 0; //Local Variable to IF-Statement
  //** WHILE Loops can run infinitely with an error if not controlled
  while ( imageHeightAdjusted1<imageDivHeight ) {
    println("Iteration of Pixel WHILE Loop", indexWhile++); 
    if ( indexWhile < 10000 ) {
    } else {
      println("ERROR: infinite loop, Image Pixel WHILE, value:", indexWhile);
      //exit(); //doesn't work, must force WHILE Stop
      imageHeightAdjusted1=imageDivHeight;
    }
    imageHeightAdjusted1++;
    println("Inspection of percent dcrease:", imageWidthAdjusted1, imageHeightAdjusted1, imageDivHeight);
  } 
  
} 
rect(imageDivX, imageDivY, imageDivWidth, imageDivHeight);
//
image(image1, imageDivX, imageDivY, image1Width, image1Height);
image( image1, imageDivX, imageDivY, imageWidthAdjusted1, imageHeightAdjusted1);
/* DIVs: 2D Rectangles
*/

// Set fullscreen mode
fullScreen(); // displayWidth and displayHeight
println(displayWidth, displayHeight);

// Make the main rectangle smaller
float divWidth = appWidth * 0.5; // 50% of screen width
float divHeight = appHeight * 0.5; // 50% of screen height
float divX = (appWidth - divWidth) / 2;
float divY = (appHeight - divHeight) / 2;

// Make the second square thinner and centered inside the first rectangle
float stopX = divX + divWidth * 1.3 / 3; // Adjusted to center the thinner square
float stopY = divY + divHeight * 3.2 / 4;
float stopWidth = divWidth * 0.5 / 4; // Reduced width to make it thinner
float stopHeight = divHeight * 0.4 / 2; // Keep the height the same

// Center the triangle inside the second square
float triangleScale = 0.5; // Scale the triangle to 50% of the second square
float triangleCenterX = stopX + stopWidth / 2;
float triangleCenterY = stopY + stopHeight / 2;

float playX1 = triangleCenterX - (stopWidth * triangleScale) / 2;
float playY1 = triangleCenterY - (stopHeight * triangleScale) / 2;
float playX2 = triangleCenterX + (stopWidth * triangleScale) / 2;
float playY2 = triangleCenterY;
float playX3 = triangleCenterX - (stopWidth * triangleScale) / 2;
float playY3 = triangleCenterY + (stopHeight * triangleScale) / 2;

// Update "next" variables
float nextWidth = stopWidth; // Same width as the second square
float nextHeight = stopHeight; // Same height as the second square
float nextX = stopX - nextWidth; // Position to the left of the second square
float nextY = stopY; // Align vertically with the second square

float previousWidth = stopWidth; // Same width as the stop rectangle
float previousHeight = stopHeight; // Same height as the stop rectangle
float previousX = nextX - previousWidth; // Position to the left of the next rectangle
float previousY = stopY; // Align vertically with the stop rectangle

float fastforwardWidth = stopWidth; // Same width as the stop rectangle
float fastforwardHeight = stopHeight; // Same height as the stop rectangle
float fastforwardX = stopX + stopWidth; // Position to the right of the stop rectangle
float fastforwardY = stopY; // Align vertically with the stop rectangle

float pauseWidth = stopWidth; // Same width as the stop rectangle
float pauseHeight = stopHeight; // Same height as the stop rectangle
float pauseX = previousX - pauseWidth; // Position to the left of the previous rectangle
float pauseY = stopY; // Align vertically with the stop rectangle

// Center the second triangle inside the fastforward rectangle
float triangleoneScale = 0.5; // Scale the triangle to 50% of the fastforward rectangle
float triangleoneCenterX = fastforwardX + fastforwardWidth / 2;
float triangleoneCenterY = fastforwardY + fastforwardHeight / 2;

float triangleoneX1 = triangleoneCenterX - (fastforwardWidth * triangleoneScale) / 2;
float triangleoneY1 = triangleoneCenterY - (fastforwardHeight * triangleoneScale) / 1.8;
float triangleoneX2 = triangleoneCenterX + (fastforwardWidth * triangleoneScale) / 6;
float triangleoneY2 = triangleoneCenterY;
float triangleoneX3 = triangleoneCenterX - (fastforwardWidth * triangleoneScale) / 2;
float triangleoneY3 = triangleoneCenterY + (fastforwardHeight * triangleoneScale) / 1.8;

// Offset to move triangletwo slightly to the left
float triangletwoOffset = fastforwardWidth * -0.2; // Adjust this value as needed

// Define triangletwo coordinates based on triangleone, shifted to the left
float triangletwoX1 = triangleoneX1 - triangletwoOffset;
float triangletwoY1 = triangleoneY1;
float triangletwoX2 = triangleoneX2 - triangletwoOffset;
float triangletwoY2 = triangleoneY2;
float triangletwoX3 = triangleoneX3 - triangletwoOffset;
float triangletwoY3 = triangleoneY3;

// Draw shapes
rect(divX, divY, divWidth, divHeight); // Main rectangle
rect(stopX, stopY, stopWidth, stopHeight); // Thinner second square
triangle(playX1, playY1, playX2, playY2, playX3, playY3); // Centered triangle
rect(nextX, nextY, nextWidth, nextHeight); // Third thinner second square
rect(previousX, previousY, previousWidth, previousHeight);
rect(fastforwardX, fastforwardY, fastforwardWidth, fastforwardHeight);
rect(pauseX, pauseY, pauseWidth, pauseHeight);
triangle(triangleoneX1, triangleoneY1, triangleoneX2, triangleoneY2, triangleoneX3, triangleoneY3); // Triangle inside fastforward rectangle
triangle(triangletwoX1, triangletwoY1, triangletwoX2, triangletwoY2, triangletwoX3, triangletwoY3); // Second triangle slightly to the left
