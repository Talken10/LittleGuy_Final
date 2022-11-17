class Ground extends Sprite
{
  Ground()
  {
    super();
    this.boxX = 1000;
    this.boxY = 600;
    this.reg.x = 0;
    this.reg.y = 0;
    this.velocity.x = -4;
    this.location.y = (height/2)- this.boxY;
    
  }//end Ground
  void check()
  {
    if (this.location.x < -this.boxX - (width/2))
    {
      this.location.x = -(width/2)+ (this.boxX * (nGround - 1));
      this.currentAni = floor(random(0, this.nAni));
    }//if
  }//end check
  
  
}//end Ground extends
