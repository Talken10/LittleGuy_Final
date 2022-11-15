class Boulder extends Sprite
{
boolean hit = false;
int nHit = 0;

 Boulder()
 {
  super();
  this.velocity.x = -4;
  this.location.y = (height/2.5) - boxX;
 }
 
  void hit()
  {
    if(this.nHit < 1)
    {
    this.hit=true;
    this.nHit = this.nHit + 1;
    }
 }//end void hit
 
 void check()
 {
  if (this.location.x < - boxX - (width/2))
  {
   this.location.x = -(width/2.0) + random(999,1000); //boulder position
   this.location.y = (height/2.5) - 150;
   this.currentAni = floor(random(0, this.nAni));
   this.boxX = this.ani[currentAni].frames[0].width/5;
   this.boxY = this.ani[currentAni].frames[0].height/5;
   this.ani[currentAni].w = this.boxX;
   this.ani[currentAni].h = this.boxY;
   this.reg.x = this.boxX/2;
   this.reg.y = this.boxY/2;
   this.hit = false;
   this.nHit = 0;
 
if (collide())
    {
     gameState = 2;
     }


    if (collide2())
    {
     this.nHit = nHit + 1;
     beep.play(); 
   }//END COLLIDE 2
 
 if (this.hit == true)
 {
  this.currentAni = 11; 
 }
 else
 {
  this.currentAni = 6; 
 }
 
 } 
 
 }//VOID CHECK
 
 
 
 
 
 //COLIDES
 boolean collide()//hit sprite
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
  PVector f2 = new PVector(this.location.x, this.location.y); //location of boulder
  PVector f3 = new PVector(f1.location.x, f1.location.y); //location of fire
  PVector d = f2.sub(f3); //vector from boulder to fire
  float dist = d.mag(); //length of vector
  float limit = min(this.boxX, this.boxY)/2 + min(f1.boxX, f1.boxY)/2; //keeps the circle in the bounding box
  if (dist < limit) return (true); 
  return(false); 
 }
 
}
