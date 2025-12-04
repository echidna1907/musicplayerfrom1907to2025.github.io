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
