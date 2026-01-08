//Library - Minim
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// Global Variables
Minim minim; // initiates entire class - don't know yet
int numberOfSongs = 1;
int numberOfSoundEffects = 1;
AudioPlayer[] playList = new AudioPlayer[numberOfSongs];
AudioPlayer[] SFX = new AudioPlayer[numberOfSoundEffects];
int currentSong = numberOfSongs - numberOfSongs;

void setup() {
  fullScreen();
  int appWidth = width;
  int appHeight = height;
  minim = new Minim(this);
  String upArrow = "../../..";
  String musicFolder = "Music/";
  String mainSongsFolder = "Main Songs/";
  String SFXfolder = "Sound effects/";
  String SFX1 = "HD - Clash Royale Tap Button Sound Effect";
  String Song1 = "Bakar - Hell N Back";
  String fileExtension_mp3 = ".mp3";

  String musicDirectory = upArrow + musicFolder + mainSongsFolder;
  String SFXDirectory = upArrow + musicFolder + SFXfolder;
  String file = musicDirectory + Song1 + fileExtension_mp3;
  playList[currentSong] = minim.loadFile(file);
  file = SFXDirectory + SFX1 + fileExtension_mp3;
  SFX[currentSong] = minim.loadFile(file);

  if (playList[currentSong] == null || SFX[currentSong] == null) { // ERROR, play list is NULL
    // See FILE or minim.loadFile
    println("The Play List or Sound Effects did not load properly");
    printArray(playList);
    printArray(SFX);
  }

  playList[currentSong].play(); // Play the current song
} // End setup

void draw() {
  playList[currentSong].play(); // DRAW is deactivated by noLoop()
} // End draw

void mousePressed() {
} // End Mouse Pressed

void keyPressed() {
} // End Key Pressed
// End MAIN Program
