class Fire extends Sprite
{
  boolean shoot = false;
  
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
   this.location.y = s.location.y;
 }
 
 void check()
 {
   
   if (this.location.x > width - 50)
   {
    this.location.x = s.location.x;
    this.location.y = (s.location.y)-25; 
    this.shoot = false;
   }
  if (this.shoot)
  {
    this.shoot = true;
  }
 else
 {
  this.location.x = s.location.x; 
  this.location.y = (s.location.y)-25;
 } 
 
 
}
}
