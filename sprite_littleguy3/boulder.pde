class Boulder extends Sprite
{
 Boulder()
 {
  super();
  this.velocity.x = -4;
  this.location.y = (height/2.0) - this.boxY;
 }
 
 void check()
 {
  if (this.location.x < -this.boxX - (width/2))
  {
   this.location.x = -(width/2.0) + random(999,1000); //boulder position
   this.location.y = (height/2.0) - 150;
   this.currentAni = floor(random(0, this.nAni));
   this.boxX = this.ani[currentAni].frames[0].width/5;
   this.boxY = this.ani[currentAni].frames[0].height/5;
   this.ani[currentAni].w = this.boxX;
   this.ani[currentAni].h = this.boxY;
   this.reg.x = this.boxX/2;
   this.reg.y = this.boxY/2;
  }
  if(this.collide()) 
  {
    beep.play(); 
    gameState = 2;
    
  }

 }
 
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
   
   
}
