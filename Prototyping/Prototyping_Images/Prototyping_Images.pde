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
//Population
float imageDivX = appWidth*1/4;
float imageDivY = appHeight*1/10;
float imageDivWidth = appWidth*1/2;
float imageDivHeight = appHeight*4/5; //Make smaller to test Landscape
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
int image1Height = 970;
//Aspect Ratio
float image1AspectRatio_GreaterOne = ( image1Width >= image1Height ) ? float(image1Width)/float(image1Height) : float(image1Height)/float(image1Width);
float imageWidthAdjusted1 = imageDivWidth;
float imageHeightAdjusted1 = ( image1Width >= imageDivWidth ) ? imageWidthAdjusted1 / image1AspectRatio_GreaterOne : imageWidthAdjusted1 * image1AspectRatio_GreaterOne; 
//DIV
rect(imageDivX, imageDivY, imageDivWidth, imageDivHeight);
//
image(image1, imageDivX, imageDivY, image1Width, image1Height);
image( image1, imageDivX, imageDivY, imageWidthAdjusted1, imageHeightAdjusted1);
