class Boarder extends Sprite
{
  Boarder()
  {
    super();
    this.boxX = width;
    this.boxY = height;
    this.reg.x = 0;
    this.reg.y = 0;
    this.velocity.x = -5;
    this.location.y = (height/2)- this.boxY;
    
  }//end Boarder
  void check()
  {
    if (this.location.x < -this.boxX - (width/2))
    {
      this.location.x = -(width/2)+ (this.boxX * (nBoarder - 1));
      this.currentAni = floor(random(0, this.nAni));
    }//if
  }//end check
  
  
}//end Boarder extends
