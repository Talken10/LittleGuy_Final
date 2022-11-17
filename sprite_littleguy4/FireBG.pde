class FireBG extends Sprite
{
  FireBG()
  {
    super();
    this.boxX = width;
    this.boxY = height;
    this.reg.x = 0;
    this.reg.y = 250;
    this.velocity.x = -2;
    
  }//end FireBG
  void check()
  {
    if (this.location.x < -this.boxX - (width/2))
    {
     
      this.location.x = -(width/2)+ (this.boxX * (nFireBG - 1));
      //this.location.x = -(width) + (this.boxX + 80);
      this.currentAni = floor(random(0, this.nAni));
    }//if
  }//end check
  
  
}//end FireBG extends
