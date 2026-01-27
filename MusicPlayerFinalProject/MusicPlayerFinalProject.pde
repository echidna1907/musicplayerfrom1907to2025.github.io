// ============================================================
// IMPORTS - Must be at the top
// ============================================================
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// ============================================================
// GLOBAL VARIABLES
// ============================================================
Minim minim;
int numberOfSongs = 3;
int numberOfSoundEffects = 1;
AudioPlayer[] playList = new AudioPlayer[numberOfSongs];
AudioPlayer[] SFX = new AudioPlayer[numberOfSoundEffects];
int currentSong = 0;

// Display & Layout
int appWidth;
int appHeight;

// Image variables
PImage image1;
float imageDivX, imageDivY, imageDivWidth, imageDivHeight;
float imageWidthAdjusted1, imageHeightAdjusted1;

// UI Button variables
float divWidth, divHeight, divX, divY;
float stopX, stopY, stopWidth, stopHeight;
float playX1, playY1, playX2, playY2, playX3, playY3;
float fastforwardX, fastforwardY, fastforwardWidth, fastforwardHeight;
float triangleoneX1, triangleoneY1, triangleoneX2, triangleoneY2, triangleoneX3, triangleoneY3;
float triangletwoX1, triangletwoY1, triangletwoX2, triangletwoY2, triangletwoX3, triangletwoY3;

void setup() {
  fullScreen();
  appWidth = width;
  appHeight = height;
  
  minim = new Minim(this);
  
  // Load Audio Files
  String upArrow = "../";
  String musicFolder = "Music/";
  String SFXfolder = "Sound Effects/";
  String mainSongsFolder = "Main Songs/";
  String[] songName = new String[numberOfSongs];
  songName[0] = "Bad Bunny - Tarot [Feat. Jhay Cortez]";
  songName[1] = "Bakar - Hell N Back";
  songName[2] = "Night Fever (From Saturday Night Fever Soundtrack) - Bee Gees";
  String SFX1 = "HD - Clash Royale Tap Button Sound Effect";
  String fileExtension_mp3 = ".mp3";
  String musicDirectory = upArrow + musicFolder + mainSongsFolder;
  String SFXDirectory = upArrow + musicFolder + SFXfolder;
  String file;
  
  for (int i = 0; i < numberOfSongs; i++) {
    file = musicDirectory + songName[i] + fileExtension_mp3;
    playList[i] = minim.loadFile(file);
  }
  
  file = SFXDirectory + SFX1 + fileExtension_mp3;
  SFX[0] = minim.loadFile(file);
  
  if (playList[0] == null || SFX[0] == null) {
    println("The Play List or Sound Effects did not load properly");
    println("Music file attempted: " + musicDirectory + songName[0] + fileExtension_mp3);
    println("SFX file attempted: " + SFXDirectory + SFX1 + fileExtension_mp3);
    printArray(playList);
    printArray(SFX);
  }
  
  // Load Image
  String imageUpArrow = "../../";
  String imageFolder = "Dependent Folder/Images/";
  String whatsapp_horse = "whatsapp_horse";
  String fileExtensionJPG = ".jpg";
  String imagePathway1 = imageUpArrow + imageFolder + whatsapp_horse + fileExtensionJPG;
  image1 = loadImage(imagePathway1);
  
  // Calculate Image Layout
  imageDivX = appWidth * 1/4;
  imageDivY = appHeight * 1/10;
  imageDivWidth = appWidth * 1/2;
  imageDivHeight = appHeight * 4/5;
  
  // Image Aspect Ratio Calculation
  int image1Width = 960;
  int image1Height = 930;
  float image1AspectRatio_GreaterOne = (image1Width >= image1Height) ? float(image1Width)/float(image1Height) : float(image1Height)/float(image1Width);
  imageWidthAdjusted1 = imageDivWidth;
  imageHeightAdjusted1 = (image1Width >= imageDivWidth) ? imageWidthAdjusted1 / image1AspectRatio_GreaterOne : imageWidthAdjusted1 * image1AspectRatio_GreaterOne;
  
  // Handle image height overflow
  if (imageHeightAdjusted1 > imageDivHeight) {
    println("Image doesn't fit, adjusting...");
    int indexWhile = 0;
    while (imageHeightAdjusted1 < imageDivHeight) {
      println("Iteration of Pixel WHILE Loop", indexWhile++);
      if (indexWhile < 10000) {
      } else {
        println("ERROR: infinite loop, Image Pixel WHILE, value:", indexWhile);
        imageHeightAdjusted1 = imageDivHeight;
      }
      imageHeightAdjusted1++;
      println("Inspection of percent decrease:", imageWidthAdjusted1, imageHeightAdjusted1, imageDivHeight);
    }
  }
  
  // Calculate UI Button Positions
  divWidth = appWidth * 0.5;
  divHeight = appHeight * 0.5;
  divX = (appWidth - divWidth) / 2;
  divY = (appHeight - divHeight) / 2;
  
  stopX = divX + divWidth * 1.3 / 3;
  stopY = divY + divHeight * 3.2 / 4;
  stopWidth = divWidth * 0.5 / 4;
  stopHeight = divHeight * 0.4 / 2;
  
  // Play Triangle
  float triangleScale = 0.5;
  float triangleCenterX = stopX + stopWidth / 2;
  float triangleCenterY = stopY + stopHeight / 2;
  playX1 = triangleCenterX - (stopWidth * triangleScale) / 2;
  playY1 = triangleCenterY - (stopHeight * triangleScale) / 2;
  playX2 = triangleCenterX + (stopWidth * triangleScale) / 2;
  playY2 = triangleCenterY;
  playX3 = triangleCenterX - (stopWidth * triangleScale) / 2;
  playY3 = triangleCenterY + (stopHeight * triangleScale) / 2;
  
  // Fast Forward Rectangle and Triangles
  fastforwardWidth = stopWidth;
  fastforwardHeight = stopHeight;
  fastforwardX = stopX + stopWidth;
  fastforwardY = stopY;
  
  float triangleoneScale = 0.5;
  float triangleoneCenterX = fastforwardX + fastforwardWidth / 2;
  float triangleoneCenterY = fastforwardY + fastforwardHeight / 2;
  
  triangleoneX1 = triangleoneCenterX - (fastforwardWidth * triangleoneScale) / 2;
  triangleoneY1 = triangleoneCenterY - (fastforwardHeight * triangleoneScale) / 1.8;
  triangleoneX2 = triangleoneCenterX + (fastforwardWidth * triangleoneScale) / 6;
  triangleoneY2 = triangleoneCenterY;
  triangleoneX3 = triangleoneCenterX - (fastforwardWidth * triangleoneScale) / 2;
  triangleoneY3 = triangleoneCenterY + (fastforwardHeight * triangleoneScale) / 1.8;
  
  float triangletwoOffset = fastforwardWidth * -0.2;
  triangletwoX1 = triangleoneX1 - triangletwoOffset;
  triangletwoY1 = triangleoneY1;
  triangletwoX2 = triangleoneX2 - triangletwoOffset;
  triangletwoY2 = triangleoneY2;
  triangletwoX3 = triangleoneX3 - triangletwoOffset;
  triangletwoY3 = triangleoneY3;
}

void draw() {
  background(255);
  
  // Draw image container
  rect(imageDivX, imageDivY, imageDivWidth, imageDivHeight);
  
  // Draw image with adjusted aspect ratio
  if (image1 != null) {
    image(image1, imageDivX, imageDivY, imageWidthAdjusted1, imageHeightAdjusted1);
  }
  
  // Draw UI buttons
  rect(stopX, stopY, stopWidth, stopHeight);
  triangle(playX1, playY1, playX2, playY2, playX3, playY3);
}

void mousePressed() {
  // Add mouse interaction for buttons here if needed
}

void keyPressed() {
  if (key == 'P' || key == 'p') playList[currentSong].loop(0);
  
  if (key == 'O' || key == 'o') { 
    if (playList[currentSong].isPlaying()) {
      playList[currentSong].pause();
    } else {
      playList[currentSong].play();
    }
  }
  
  if (key == 'S' || key == 's') { 
    if (playList[currentSong].isPlaying()) {
      playList[currentSong].pause();
    } else {
      playList[currentSong].rewind();
    }
  }
  
  if (key == 'L' || key == 'l') playList[currentSong].loop(1);
  if (key == 'K' || key == 'k') playList[currentSong].loop();
  if (key == 'F' || key == 'f') playList[currentSong].skip(10000);
  if (key == 'R' || key == 'r') playList[currentSong].skip(-10000);
  
  if (key == 'W' || key == 'w') { // MUTE
    if (playList[currentSong].isMuted()) {
      playList[currentSong].unmute();
    } else {
      playList[currentSong].mute();
    }
  }
  
  if (key == CODED && keyCode == ESC) exit();
  if (key == 'Q' || key == 'q') exit();
  
  if (key == 'N' || key == 'n') { 
    if (playList[currentSong].isPlaying()) {
      playList[currentSong].pause();
      playList[currentSong].rewind();
      
      if (currentSong == numberOfSongs - 1) {
        currentSong = 0;
      } else {
        currentSong++;
      }
      playList[currentSong].play();
    } else {
      playList[currentSong].rewind();
      
      if (currentSong == numberOfSongs - 1) {
        currentSong = 0;
      } else {
        currentSong++;
      }
    }
  }
  
  if (key == 'Y' || key == 'y') { // RANDOM
    currentSong = int(random(numberOfSongs));
  }
}
