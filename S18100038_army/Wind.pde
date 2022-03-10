class Wind{
  float x; float y;
  PImage rwind; PImage lwind;
  int n;
  
  
Wind(){
  rwind=loadImage("rwind.png");
  lwind=loadImage("lwind.png"); 
x=800; y=300;
n=0;
}

void display(){
  if(x<500)
  n++;
  if(x>850)
  n--;
  //오른쪽으로 불기
  if(n==1)
  {if(px>430 && px+pw<900 &&py+ph<400 && py>160)
  px+=1;
    x+=1;
  image(rwind,x,y,70,70);
  }
  //왼쪽으로 불기
  else if(n==0)
  { if(px>430 && px+pw<900 &&py+ph<400 && py>160)
  px-=1;
  x-=1;
  image(lwind,x,y,70,70);
}
  
 
  
  
}

}
