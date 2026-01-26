import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// Global Variables
Minim minim;
int numberOfSongs = 3;
int numberOfSoundEffects = 1;
AudioPlayer[] playList = new AudioPlayer[numberOfSongs];
AudioPlayer[] SFX = new AudioPlayer[numberOfSoundEffects];
int currentSong = 0;

void setup() {
  size(500, 800);
  int appWidth = width;
  int appHeight = height;
  
  minim = new Minim(this);
  
  String upArrow = "../../../";
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
}

void draw() {
  //DRAW is deactivated by noLoop()
}

void mousePressed() {
}

void keyPressed() {
  if (key == 'P' || key == 'p') playList[currentSong].loop(0);
  
  if (key == 'O' || key == 'o') { // Pause
    if (playList[currentSong].isPlaying()) {
      playList[currentSong].pause();
    } else {
      playList[currentSong].play();
    }
  }
  
  if (key == 'S' || key == 's') { // Stop
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
  
  if (key == CODED || keyCode == ESC) exit();
  if (key == 'Q' || key == 'q') exit();
  
  if (key == 'N' || key == 'n') { // NEXT
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
  
  if (key == 'Y' || key == 'y') {
    currentSong = int(random(numberOfSongs));
  }
}
