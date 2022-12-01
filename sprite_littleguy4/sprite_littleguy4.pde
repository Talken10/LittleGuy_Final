//SOUND
import processing.sound.*;
SoundFile beep;

//GAMESTATE
int gameState = 0; //0 startscreen, 1 is gameplay, 2 is being dead

//ASSETS
Sprite s;
//Sprite g1;
//Sprite g2;
//Sprite g3;
//Sprite f1;
Ground[]g;
Boarder[]bd;
Mountains[] mt;
FireBG[] fb;
Boulder b;
Fire f;
Sky sk; 
int nGround = 2;
int nBoarder = 3;
int nMountains = 2;
int nFireBG = 2;

boolean collide = false;
int kill = 0;

PImage myShape1;
PImage myShape2; 
PImage myShape3; 

//START
void setup()
{
  surface.setTitle("Little Guy");
  size (800,600);
  beep = new SoundFile(this, "64940__syna-max__wilhelm-scream.wav");
  s = new LittleGuy();
  reset();
}
//END VOID SETUP

void draw()
{
  if (gameState == 0) startScreen();
  if (gameState == 1) gamePlay();
  if (gameState == 2) deadScreen();
  if (gameState == 4) instructionScreen();
  
 }
 //END VOID DRAW
 
//GAMESTATE CODES:
void startScreen()
{
 /* noStroke ();
  colorMode(HSB);
  fill(5,175,245);
  rect(0,0,width, height);
  fill(255);
  textAlign(CENTER);
  textSize(50);
  fill(225);
  text(" little guy ", width/2, (height/2 - 15));
  
  textAlign(CENTER);
  textSize(25);
  fill(225);
  text("press 's' to start ", (width/2), (height/2) + 25);*/
  
  myShape1 = loadImage("littleguy startscreen.png");
  myShape1.resize(width,height);
  background(myShape1);

 
}//END START 
 
 void instructionScreen()
 {
  /* noStroke ();
  colorMode(HSB);
  fill(5,175,245);
  rect(0,0,width, height);
  fill(255);*/
   
  
  myShape2 = loadImage("littleguy tutorial.png");
  myShape2.resize(width,height);
  background(myShape2);
 }
 void deadScreen()
{
  /*noStroke ();
  fill(0,0,0);
  rect(0,0,width, height);
  fill(255);
  textAlign(CENTER);
  text(" uh oh you're dead, press any key to try again", width/2, height/2);*/
  myShape2 = loadImage("littleguy endscreen.png");
  myShape2.resize(width,height);
  background(myShape2);
  
  textAlign(CENTER);
  textSize(25);
  fill(255);
  text("k i l l s :",((width/2)+ 19),574);
  
  textAlign(CENTER);
  textSize(25);
  fill(255);
  text(kill,((width/2)+ 69),575);
}//END DEAD

 void gamePlay()
 {
 background(0);
 translate(width/2, height/2);
 
 sk.update();
 sk.check();
 sk.display();
 
 for(int i =0; i < nMountains; i = i + 1)
{
 mt[i].update();
 mt[i].check();
 mt[i].display();
}

for(int i =0; i < nFireBG; i = i + 1)
{
 fb[i].update();
 fb[i].check();
 fb[i].display();
}

noStroke();
fill(255,50,200,20);
rect(-400,-300, width, height);
 
for(int i =0; i < nGround; i = i + 1)
{
 g[i].update();
 g[i].check();
 g[i].display();
}

 b.update();
 b.check();
 b.display();
 
 
 f.update();
 f.check();
 f.display();
 

 s.update();
 s.check();
 s.display();
 
 for(int i =0; i < nBoarder; i = i + 1)
{
 bd[i].update();
 bd[i].check();
 bd[i].display();
}
 
 hud();
 
}//END GAMEPLAY

//END GAMESTATES

void keyPressed()
{
  //GAMESTATE KEYPRESSES
 
  if (key == 's')
  {
  if (gameState == 4) 
  {
  gameState = 1;
  }
  if (gameState == 0)gameState = 1;
  }
  if (gameState == 1) gameState = 1;
  if (gameState == 2)
    {
      reset();
      gameState = 0;
    }
    
 //GAMEPLAY KEYPRESSES
 if(key == 'w')
  {
 s.jump();
  }

if (key == 'd')
{
 f.shoot();
}
//STARTSCREEN KEYPRESSES
if (key == 'i')
{
 gameState = 4;  
}
}
//END KEYPRESSED


 void reset()
 {
  //s = new Sprite(); //needed before extention
  s.location.x = (-width/2)+100;
  s.location.y=(height/2)-100;
  s.velocity.x = 0;
  s.acceleration.x = 0;
  
//LITTLE GUY (FILES 0 - 3)
String[] files = {"littleguy1.svg", "littleguy2.svg"};
  s.addAnimation(files, 5);
  
  String[] files1 = {"littleguy1.svg", "littleguy2.svg"};
  s.addAnimation(files1, 5);

  String[] files2 = {"jump1.svg","jump2.svg"};
  s.addAnimation(files2, 10);
  
  String[] files3 = {"jump2.svg"};
  s.addAnimation(files3, 10);
  
  s.currentAni = 0;

 //END LITTLE GUY  (FILES 0 - 3)
 
 //GROUND (FILE 4)
  nGround = ceil(width/1000.0)+1;
  println(nGround);
  g = new Ground[nGround];
  String[] files4 = {"ground.svg"};

for (int i = 0; i < nGround; i = i + 1)
  {
   g[i] = new Ground();
   g[i].addAnimation(files4, 15);
   g[i].location.x = -(width/2.0) + (g[i].boxX * i);    
  }
//END GROUND (FILE 4)

//FIREBALL (FILE 5,11)
  f = new Fire();
  String[] files5 = {"fire.svg"};
  f.addAnimation(files5, 10); 
 //FIREBALL (FILE 5,11)
 

//BOULDER (FILE 6,11)
  b = new Boulder();
  String[] files6 = {"boulder.svg","boulder2.svg","boulder3.svg","boulder2.svg"};
  b.addAnimation(files6,6);
  String[] files11 = {"bdie1.svg","bdie2.svg","bdie3.svg","bdie4.svg","bdie5.svg","bdie6.svg","bdie7.svg","bdie8.svg","bdie9.svg","bdie9.svg","bdie9.svg","bdie9.svg","bdie9.svg","bdie9.svg","bdie9.svg","bdie9.svg"};
  b.addAnimation(files11,10);
  
 
  
  
//END BOULDER (FILE 6,11)


 //SKY (FILE 7)
  sk = new Sky();
  String[] files7 = {"Sky.svg"};
  sk.addAnimation(files7, 10);
 //SKY (FILE 7)
 
  //BOARDER (FILE 8)
  nGround = ceil(width/1000.0)+1;
  println(nBoarder);
  bd = new Boarder[nBoarder];
  String[] files8 = {"Boarder.svg"};

for (int i = 0; i < nBoarder; i = i + 1)
  {
   bd[i] = new Boarder();
   bd[i].addAnimation(files8, 15);
   bd[i].location.x = -(width/2.0) + (bd[i].boxX * i);    
  }
//END BOARDER (FILE 4)

 //MOUNTAIN(FILE 9)
  nMountains = ceil(width/1000.0)+1;
  println(nMountains);
  mt = new Mountains[nMountains];
  String[] files9 = {"MountainsBG.svg"};

for (int i = 0; i < nMountains; i = i + 1)
  {
   mt[i] = new Mountains();
   mt[i].addAnimation(files9, 15);
   mt[i].location.x = -(width/2.0) + (mt[i].boxX * i);    
  }
//END MOUNTIAN (FILE 9)

 //FIREBG (FILE 10)
  nFireBG = ceil(width/1000.0)+1;
  fb = new FireBG [nFireBG];
  String[] files10 = {"FireBG_3.svg", "FireBG_2.svg"};

for (int i = 0; i < nFireBG; i = i + 1)
  {
   fb[i] = new FireBG();
   fb[i].addAnimation(files10, 20);
   fb[i].location.x = -(width/2.0) + (fb[i].boxX * i);    
  }
//END FIREBG (FILE 10)



 //FILE #S = 11
  /* NOT NEEDED
  g[1] = new Ground();
  String[] files4 = {"ground1.svg","ground2.svg","ground3.svg"};
  g[1].addAnimation(files4, 20);
  g[1].location.x= -(-width/2);

  
  g2 = new Ground();
 // String[] files5 = {"ground.svg"};
  g2.addAnimation(files4, 10);
  g2.location.x = -(-width/2) + (g2.boxX);

 
  g3 = new Ground();
  //String[] files6 = {"ground.svg"};
  g3.addAnimation(files4, 10);
  g3.location.x = -(-width/2) + (g3.boxX*2); 
 */
 

 
 }
 //END VOID RESET
 
 
//# of kills
void hud()
{
  
  if (b.collide2())
 {
  kill = kill + 1; 
 } 
 
 //kc dec 
 stroke(255);
 strokeWeight(2);
 colorMode(HSB);
 fill(color(10,200,200,80));
 rect(150,220,175,41,10); //x,y,w,h

 
 fill(255);
 textAlign(CENTER);
 textSize(40);
 text("k i l l s :",222,253);
 
 //kill count
 fill(255); 
 textAlign(CENTER);
 textSize(40);
 text(kill,302,253); 
 
 
}
//END VOID HUD
