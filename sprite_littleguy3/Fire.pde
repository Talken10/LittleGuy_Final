class Fire extends Sprite
{
  boolean shoot = false;
  boolean hit = false;
  boolean hide = true;
 Fire()
 {
  super();
   
    this.velocity.x = 0;
    this.location.y = (s.location.y)-125; 
    this.location.x = (s.location.x)-75;
    
 }
 void shoot()
 {
   this.velocity.x = 5;
   this.acceleration.x = .50;
   this.shoot = true;
 }
 
 void check()
 {
   //if (this.hit == true)
  
 
   
   if (this.location.x > width - 50)
   {
    this.location.x = s.location.x;
    this.location.y = (s.location.y)-25; 
    this.shoot = false;
    this.hide = true;
   }
  if (this.shoot)
  {
    this.shoot = true;
    this.hide = false;
  }
 else
 {
  this.location.x = s.location.x; 
  this.location.y = (s.location.y)-25;
  this.hide = true;
 } 
  
  /*if(this.collide()) 
  {
    beep.play(); 
    hit = true;
  }*/

 }
 
 /*boolean collide()
 {
  PVector b1 = new PVector(this.location.x, this.location.y); //location of boulder
  PVector b2 = new PVector(b.location.x, b.location.y); //location of sprite
  PVector d = b1.sub(b2); //vector from boulder to sprite
  float dist = d.mag(); //length of vector
  float limit = min(this.boxX, this.boxY)/2 + min(b.boxX, b.boxY)/2; //keeps the circle in the bounding box
  if (dist < limit) return (true); 
  return(false); 
 }*/
 

 
}
