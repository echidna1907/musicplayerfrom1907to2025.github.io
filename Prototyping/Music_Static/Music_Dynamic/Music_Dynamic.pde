

// Hearing Music and Sound Effects
//
/* Program Documentation & Notes
 - Libraries add specific functions to ease programming burdon
 - Must add some libraries in the IDE and the code, like Minim
 - Global Varaibles on harddrive used throuhgout the program sections
 
 - Folder Name matches first-tab or MAIN Program
 - setup() executes once, sets up all libraries & variables (and objects at the advanced level)
 - draw() maniuplates variables and how CANVAS looks
 - mousePressed() and keyPressed() are example listeners, interrupts draw(), then continues draw() at that line
 
 - Once setup() is done, draw() starts looping
 - Can temporarily pause draw() with noLoop() & loop() to wait (behind booleans or interactions)
 - Note: delay() will stop the program for a specified time
 - Reading Code the cursor & braces
 */
//
//Library - Minim
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//Global Variables
Minim minim; //initiates entire class - don't know yet
int numberOfSongs = 1;
int numberOfSoundEffects = 1;
AudioPlayer[] songs = new AudioPlayer[ numberOfSongs ];
AudioPlayer[] sfx = new AudioPlayer[ numberOfSoundEffects ];
int currentSong = numberOfSongs - numberOfSongs;
void setup() {
  fullScreen();
  int appWidth = width;
  int appHeight = height;
} //End setup
//
void draw() {
} //End draw
//
void mousePressed() {
} //End Mouse Pressed
//
void keyPressed() []
