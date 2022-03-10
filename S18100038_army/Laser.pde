class Laser{
  float x;
  float xd;
  float y;
  float yd;
  String c;
  PImage img;
  float direction;
  
  Laser(float tx, float ty, float txd, float tyd, String tc)
  {
    
    x=tx; y=ty; xd=txd; yd=tyd;
    direction=3;
    c=tc;
    img=loadImage(c);
  }
  

  
  void display(){
    x-=direction;
    if(x<151 || x+xd>850)
   x=839;
    
   image(img,x,y,xd,yd);
   
   //빨간색 조건 
   if(c=="red.png")
   {if(px<x && px+pw>x+xd && l==0 && r==0)
   heart-=1;

   }
   //파란색 조건
   else if(c=="blue.png")
   {if(px<x && px+pw>x+xd && l==1)
   heart-=1;
   else if(px<x && px+pw>x+xd && r==1)
   heart-=1;
   }
    
    
  
}}
