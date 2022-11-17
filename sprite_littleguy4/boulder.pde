class Boulder extends Sprite
{
boolean hit = false;

 Boulder()
 {
  super();
  this.velocity.x = -4;
  this.location.y = (height/2.5) - boxX;
 }

  void hit()
  {
    this.velocity.y = 10;
   }//end void hit
 
 void check()
 {
  if (this.location.x < -this.boxX - (width/2))
  {
   this.velocity.y = 0;
   this.location.x = -(width/2.0) + random(999,1000); //boulder position
   this.location.y = (height/2.0) - random(250, 450);
   this.currentAni = floor(random(0, this.nAni));
   this.boxX = this.ani[currentAni].frames[0].width/5;
   this.boxY = this.ani[currentAni].frames[0].height/5;
   this.ani[currentAni].w = this.boxX;
   this.ani[currentAni].h = this.boxY;
   this.reg.x = this.boxX/2;
   this.reg.y = this.boxY/2;
   this.hit = false;
  }
  
  if(this.collide()) 
  {
    if (this.hit == false)
    {
    beep.play(); 
    gameState = 2; 
    }
   
   }
  
  if(this.collide2())
  {
    beep.play(); 
    this.hit = true;
  }
  
if (this.hit)
{
  if (this.collide2())
  {
 this.currentAni = 1; 
  }
}
 else 
  {
   this.currentAni = 0; 
  }


 }//VOID CHECK
 
 
 
 
 
 //COLIDES
boolean collide()
 {
  PVector s1 = new PVector(this.location.x, this.location.y); //location of boulder
  PVector s2 = new PVector(s.location.x, s.location.y); //location of sprite
  PVector d = s1.sub(s2); //vector from boulder to sprite
  float dist = d.mag(); //length of vector
  float limit = min(this.boxX, this.boxY)/2 + min(s.boxX, s.boxY)/2; //keeps the circle in the bounding box
  if (dist < limit) return (true); 
  return(false); 
 }
   
   boolean collide2()//hit with fireball
 {
   if(f.shoot)
   {
  PVector f2 = new PVector(this.location.x, this.location.y); //location of boulder
  PVector f3 = new PVector(f.location.x, f.location.y); //location of fire
  PVector d = f2.sub(f3); //vector from boulder to fire
  float dist = d.mag(); //length of vector
  float limit = min(this.boxX, this.boxY)/2 + min(f.boxX, f.boxY)/2; //keeps the circle in the bounding box
  if (dist < limit) return (true); 
  return(false); 
   }
   return(false);
 }
 
}
