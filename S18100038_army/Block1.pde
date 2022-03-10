class Block {
  float x;
  float y;
  float xd;
  float yd;
  String img;
  PImage block;

  Block(float tx, float ty, float txd, float tyd,String timg)
  {
    x=tx; 
    y=ty; 
    xd=txd; 
    yd=tyd;
    img=timg;

    block=loadImage(img);
  }

  void display() {
    image(block, x, y, xd, yd);


    //왼쪽 벽부딪히기
    if (px+pw>x-error && x>px+error  && py+ph>y+error &&py<y+yd)
      px-=2;

    //오른쪽 벽 부딪히기
    if (px<x+xd+error  && px+pw>x+xd  && py+ph>y && py<y+yd+error)
      px+=2;
    //밑면에 부딪히기
    if (px+pw>x && x+xd >px && py+ph > y+yd && py<y+yd+error)
    {
      speed=speed+2;
      gravityfield=true;
    }



    //위에 서있기(중력 등등)
    if (px+pw>x && px<x+xd  && py+ph>=y-error && py<=y)
    {  gravityfield=false; 
      canjump=true;}
    else
    gravityfield=true;
   
    if (px+pw>=x && px<=x+xd  && py+ph>y-error && py<y) {
      py=y-ph-error;
   speed=0;
   gravity=0;
 
    }
    
 
  }
}
