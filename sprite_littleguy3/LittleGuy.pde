class LittleGuy extends Sprite
{
  boolean isJump = false;
  int nJump = 0;
  
  LittleGuy()
  {
   super(); 
  } //end LittleGuy
  
  void jump()
  {
    if(this.nJump < 3)
    {
    this.velocity.y = -8;
    this.acceleration.y = 0.3;
    this.isJump=true;
    this.nJump = this.nJump + 1;
    }
  }//end void jump
  
  
  void check()
  {
      
    //float actualY = screenY(this.location.x, this.location.y);
   
    if(location.y > (height/2)-200)
    {
     this.acceleration.y = 0;
     this.velocity.y = 0;
     this.location.y =(height/2)-200;
     this.isJump = false;
     this.nJump = 0;
    }
    
    if(this.isJump)
    {
      if(this.velocity.y < 0)
      {
        this.currentAni=2; //up
      }
     else
     {
       this.currentAni=3; //down
     }
   
    }
    else
    {
      this.currentAni=0; //grounded
    }
 
  }

  
}//Little Guy class
