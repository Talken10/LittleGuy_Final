class Sprite
{
 PVector location = new PVector (0,0);
 PVector velocity = new PVector (0,0);
 PVector acceleration = new PVector (0,0);
 
 float boxX = 100;
 float boxY = 150;
  
 PVector reg = new PVector (boxX/2, boxY/2); //axis point
 
 Animation[] ani = new Animation[20];
 int nAni = 0;
 int currentAni = -1;
 
 Sprite()
 {
  
 }//Sprite end
 
 void addAnimation(String[] filenames, int speed)
 {
   if (nAni < 20)
   {
   this.ani[nAni] = new Animation(filenames);
   this.ani[nAni].speed = speed;
   this.ani[nAni].w = boxX;
   this.ani[nAni].h = boxY;
   nAni = nAni + 1; 
   currentAni = nAni - 1;
   }//end if nAni
   
 }//end void add
 
  void update()
  {
   this.velocity = this.velocity.add(this.acceleration); //add the acceleration vector to the velocity vector to change speed and direction
   this.location = this.location.add(this.velocity); 
    
  }//void end
  
  void check()
  {
  float actualX = screenX(this.location.x, this.location.y);
  float newX = screenX(-boxX, this.location.y);
  if(actualX > width + boxX) this.location.x = - boxX - (width/2);; //if location is bigger than width of screen, the sprite will be moved to the other side 
 if (actualX > width+boxX)
 {
   this.velocity.mult(-1);
   this.currentAni = 1;
 }//end if actualX
 
 if (actualX < -boxX)
 {
  this.velocity.mult(-1);
  this.currentAni=0;
 }

}
  
  void display()
  {
    pushMatrix();
      translate(this.location.x, this.location.y);
      noStroke();
      fill (0,100,255,0);
      circle(0,0,10);  
      circle(0,0,min(boxX,boxY));
      translate(-reg.x, -reg.y);
      fill(0,100,255,0);
      rect (0,0,boxX, boxY);
      if (currentAni > -1) ani[currentAni].display();
    popMatrix();
    
  }//end void display
  
  void jump()
  {
    
  }
  void shoot ()
  {
    
  }

  void hit()
 {
   
 }

 
}//class sprite end
