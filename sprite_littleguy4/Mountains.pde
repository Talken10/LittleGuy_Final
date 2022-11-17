class Mountains extends Sprite
{
  Mountains()
  {
    super();
    this.boxX = width;
    this.boxY = height - 50;
    this.reg.x = 0;
    this.reg.y = 0;
    this.velocity.x = -.5;
    this.location.y = (height/2)- this.boxY;
    
  }//end Mountains
  void check()
  {
    if (this.location.x < -this.boxX - (width - 50))
    {
     this.location.x = -(width/2)+ (this.boxX * (nMountains - 1));
    }//if
  }//end check
  
  
}//end Mountains extends
