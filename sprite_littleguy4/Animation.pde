int i = 0;
class Animation
{
  int nFrames = 0; //number of frames
  PShape[]frames; 
  int counter = 0;
  int speed = 5; //counter will be reset every 5 frames
  int frameCounter = 0; //counts the frame (needed for the speed)
  float w = 100;
  float h = 100; 
  
  Animation(String[] filenames)
  {
    this.nFrames = filenames.length; 
    this.frames = new PShape[this.nFrames];
   
    for (int i = 0; i < this.nFrames; i = i + 1)
    {
      this.frames[i] = loadShape(filenames[i]); 
       println(this.frames[i]);
    }//end loop
  
  }//end animation
  
  void display()
  {
    this.counter = this.counter + 1;
    if (this.counter > this.speed) 
    {
    this.counter = 0;  
    this.frameCounter = this.frameCounter + 1;
    if (this.frameCounter >= this.nFrames) this.frameCounter = 0; //if bigger than frame counter it will reset to 0
   
    //println(nFrames);
    }//end conditional
    
    shape(frames[frameCounter],0,0, this.w,this.h); 
    
  }//end void display
  
  
}//end animation class
