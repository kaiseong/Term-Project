class Memo{
  float x;
  float y;
  float xd;
  float yd;
  int n;
  PImage img,message,juge1,juge,answer,message1;
  String p,c;
  Memo(float tx,float ty, float txd, float tyd, String tp, String tc){
    x=tx; y=ty; xd=txd; yd=tyd;
    p=tp; c=tc;
    //판사
    juge=loadImage("juge.jpg");
    juge1=loadImage("juge1.jpg");
    //대사
    message1=loadImage("text1.png");
    answer=loadImage("answer.png");
   img=loadImage(p); 
message=loadImage(c);
n=0;
}
  
  void display(){
 if(p=="man.png")
 {image(img,x,y,xd,yd);
 if(n==1)
 {image(message1,200,450,700,150);
 image(juge1,0,450,210,150);}
 if(n==2)
 {image(juge,0,450,210,150);
 image(message,200,450,700,150);}
 if(n==3){
   image(juge,0,450,200,150);
 image(answer,200,450,700,150);
 }
if(n>=4)
{hend=true; 
  start=false;}

 }
    else{
    image(img,x,y,xd,yd);
    if(n==1)
    image(message,200,450,700,150);
 
 if(n>=2)
 n=0;
    }
  }
    
}
