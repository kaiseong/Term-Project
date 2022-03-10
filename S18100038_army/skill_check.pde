class Skill{
  float x;
  float y;
  float r;
  float theta;
  float tt;
  boolean unlock;
  boolean skilling;
  
  
Skill(float tr, float ttheta, float ttt)
{
  r=tr;
  theta=ttheta;
  tt=ttt;
  unlock=false;
skilling=false;
}


void display(){
  noFill();
strokeWeight(10);
//스킬체크 범위설정
arc(width/2,height/2,100,100,QUARTER_PI/2+PI,PI+QUARTER_PI);

  strokeWeight(1);
  fill(255);
  //테두리
  ellipse(width/2,height/2,r,r);
 x=r*cos(theta);
 y=r*sin(theta);
  theta +=tt;
  println(theta);
fill(255,0,0);
//스킬체크선
line(width/2,height/2,x/2+width/2,y/2+height/2);


//스킬체크 성공
if(3.4<= theta && theta <= 4.01)
{if(keyPressed && key=='c')
{tt=0; skilling=false;
unlock=true;
}
}

//실패
if(7<=theta)
{skilling=false;
theta=0;}

}


  

}
