class Lock{
  
  float x;
  float y;
  float xd;
  float yd;
  PImage lock;
  String img;

  Lock(float tx, float ty, float txd, float tyd, String timg)
  {
    x=tx; y=ty; xd=txd; yd=tyd; img=timg;
    //잠금장치
    lock=loadImage(img); 
      
 
    
}
  
  void display(){
   
 //2스테이지
    if(img=="door.png"  && skill.unlock==false)
     image(lock,x,y,xd,yd);
    //3스테이지
    if(img!="door.png")
    image(lock,x,y,xd,yd);
 
 //문에 부딪히기   
 if(skill.unlock==false&& img=="door.png")
 if(px+pw>x && px<x && py+ph>y+error && py<y+yd)
 px-=3;
  
}}
