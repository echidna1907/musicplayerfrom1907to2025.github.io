//Library - Minim
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// Global Variables
Minim minim;
int numberOfSongs = 1;
int numberOfSoundEffects = 1;
AudioPlayer[] playList = new AudioPlayer[numberOfSongs];
AudioPlayer[] SFX = new AudioPlayer[numberOfSoundEffects];
int currentSong = 0;

void setup() {
  size(500, 800);
  int appWidth = width;
  int appHeight = height;
  
  minim = new Minim(this);
  
  String upArrow = "../../";
  String musicFolder = "Music/";
  String SFXfolder = "Sound Effects/";  // Fixed capitalization
  String mainSongsFolder = "Main Songs/";
  String Song1 = "Bakar - Hell N Back";
  String SFX1 = "HD - Clash Royale Tap Button Sound Effect";
  String fileExtension_mp3 = ".mp3";
  
  String musicDirectory = upArrow + musicFolder + mainSongsFolder;
  String SFXDirectory = upArrow + musicFolder + SFXfolder;
  
  String file = musicDirectory + Song1 + fileExtension_mp3;
  playList[currentSong] = minim.loadFile(file);
  
  file = SFXDirectory + SFX1 + fileExtension_mp3;
  SFX[currentSong] = minim.loadFile(file);
  
  if (playList[currentSong] == null || SFX[currentSong] == null) {
    println("The Play List or Sound Effects did not load properly");
    println("Music file attempted: " + musicDirectory + Song1 + fileExtension_mp3);
    println("SFX file attempted: " + SFXDirectory + SFX1 + fileExtension_mp3);
    printArray(playList);
    printArray(SFX);  // Fixed variable name
  }
}
