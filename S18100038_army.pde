//참고:  강의자료
import ddf.minim.*;
Minim bgm;
Minim happyend;
Minim jump;
Minim badend;
AudioPlayer play1;
AudioPlayer play2;
AudioPlayer play3;
AudioPlayer jumpplay;
//정의
int l, r, N=-1, heart;
float px, py, pw, ph, p=3, error;
float speed=0;
float gravity=0.1;
boolean gravityfield;
boolean start, bend, hend;
boolean canjump, jumping;
Score score;
//스테이지1
Memo sign;
Block [] land=new Block[8];
Block [] ceiling=new Block[20];
Block [] block01= new Block[12];
Block [] block02= new Block[6];
Block [] block03=new Block[15];
Block [] block04=new Block[7];
Block [] block05=new Block[15];
Wind wind;
//스테이지2
Lock lock;
Memo TMI;
Block [] land2=new Block[20];
Block [][] block11=new Block[20][3];
Skill skill;
Laser [] rlaser=new Laser[3];
Laser [] blaser=new Laser[3];
PImage hart;
//스테이지3
Lock [] onbutton=new Lock[2];
Lock [] offbutton=new Lock[2];
Block [] land3=new Block[5];
Block [] land4=new Block[10];
Block [] land5=new Block[10];
Block [] land6=new Block[10];
Block [] land7=new Block[7];
Block [] land8=new Block[6];
Block [] block31=new Block[2];
Skill [] skil=new Skill[2];

Memo man;

//기타
PImage player, badending, happyending;
PImage pastor, msg, yes, no, plus;

void setup() {
  //점수
  score=new Score();

  size(900, 600);
  //엔딩과 시작 
  badending=loadImage("badending.jpg");
  happyending=loadImage("happyending.jpg");
  start=true; 
  hend=false;
  bend=false;
  //노래
  bgm=new Minim(this);
  happyend=new Minim(this);
  jump=new Minim(this);
  badend=new Minim(this);
  play1=bgm.loadFile("bgm.mp3");
  play2=happyend.loadFile("hend.mp3");
  play3=badend.loadFile("bend.mp3");
  jumpplay=jump.loadFile("jump.mp3");
  play1.play();

  //플레이어
  player=loadImage("r2.png");
  pw=ph=30;
  //오차
  error=1;
  //점프조건
  canjump=true;
  //중력조건
  gravityfield=false;
  //정의
  definitionStage1();
  definitionStage2();
  definitionStage3();
}
void draw() {
  //배경
  background(#CBD5F5);
  //엔딩
  if (hend==true && start==false)
    happyend();
  else if (bend==true && start==false)
    badend();
  //중력
  if (gravityfield==false)
    gravity=0;
  else if (gravityfield==true)
    gravity=0.1;
  //게임 시작
  if (start==true && hend==false &&bend==false ) {

    //질문
    if(N==-1)
    set();
    else if (N==0)
      Stage0();
    else {
      score.display();
      //천장 만들기
      for (int i=0; i<20; i++)
        ceiling[i].display();


      //스테이지
      if (N==1) {
        Stage1();
      } else if (N==2) {
        Stage2();
      } else if (N==3) {
        Stage3();
      }
      //플레이어
      speed=speed+gravity;

      py+=speed;

      image(player, px, py, pw, ph);
      //미루기
      if (jumping==true)
        jump();
      //오른쪽으로 걷기
      if (r==1) {
        p+=0.1;
        px+=2;
        if (p%3<=1)
          player=loadImage("r1.png");
        else if (p%3<=2)
          player=loadImage("r2.png");
        else if (p%3<=3)
          player=loadImage("r3.png");
      }
      //왼쪽으로 걷기
      if (l==1)
      { 
        p+=0.1;       
        px-=2;
        if (p%3<=1)
          player=loadImage("l1.png");
        else if (p%3<=2)
          player=loadImage("l2.png");
        else if (p%3<=3)
          player=loadImage("l3.png");
      }
    }
  }
}

void Stage0() {
  //초기값
  px=10; 
  py=520;
  //이미지
  msg=loadImage("message.png");
  pastor=loadImage("pastor.png");
  yes=loadImage("yes.png");
  no=loadImage("no.png");
  plus=loadImage("plus.jpg");
  image(plus, 0, 0, 900, 600);
  image(pastor, 0, 450, 200, 150);
  image(msg, 200, 450, 700, 150);
  image(yes, 300, 200, 100, 100);
  image(no, 500, 200, 100, 100);
  if (mouseX<=400 && mouseX>=300 && mouseY<=300 && mouseY>=200 && mousePressed)
    N++;
  if (mouseX<=600 && mouseX>=500 && mouseY<=300 && mouseY>=200 && mousePressed)
  {
    bend=true;
    start=false;
  }
  //천장 
  for (int i=0; i<20; i++)
    ceiling[i]=new Block(i*50, -40, 50, 40, "brown.png");
}
//스테이지1 함수
//정의
void definitionStage1() {
  //안내 및 표지판
 textAlign(CENTER);

  sign=new Memo(100, 520, 25, 50, "sign.png", "text.png");

  //바람
  wind=new Wind();
  //구조물
  for (int j=0; j<8; j++)
    land[j]= new Block(j*45-20, 570, 45, 30, "land.jpg");
  for (int o=0; o<12; o++)
    block01[o]=new Block(300, o*40+90, 40, 40, "brown.png");
  for (int k=0; k<4; k++)
    block02[k]=new Block(260, k*100+155, 40, 50, "brown.png");
  block02[4]=new Block(340, 570, 40, 40, "brown.png");
  for (int i=0; i<13; i++) 
    block03[i]=new Block(390, i*40-120, 40, 40, "brown.png");
  block03[13]=new Block(430, 100, 40, 40, "brown.png");
  block03[14]=new Block(430, 10, 30, 40, "brown.png");
  //발판들
  block04[0]=new Block(440, 570, 40, 10, "brown.png");
  block04[1]=new Block(650, 530, 40, 10, "brown.png");
  block04[2]=new Block(850, 480, 40, 10, "brown.png");
  block04[3]=new Block(650, 400, 40, 10, "brown.png");
  block04[4]=new Block(440, 340, 40, 10, "brown.png");
  block04[5]=new Block(700, 280, 40, 10, "brown.png");
  block04[6]=new Block(500, 200, 40, 10, "brown.png");

  for (int p=0; p<15; p++)
    block05[p]=new Block(p*40+600, 100, 40, 40, "brown.png");
}
//실행
void Stage1() {
  //안내
  fill(0);
  textSize(20);
 text("Pressed key 'x'",100,500);
  //블록
  for (int j=0; j<8; j++)
    land[j].display();
  for (int o=0; o<12; o++)
    block01[o].display();
  for (int k=0; k<5; k++)
    block02[k].display();
  for (int i=0; i<15; i++) 
    block03[i].display();
  for (int l=0; l<7; l++)
    block04[l].display();
  for (int p=0; p<15; p++)
    block05[p].display();
  //바람
  wind.display();
  //다음 스테이지
  if (px>width-error && px<width+10 && py+ph<200)
  {
    N++;
    px=10;
    //스테이지 2 스킬체크 방지
    if (skill.skilling==true)
      skill.skilling=false;
  }
  //사망
  if (py>700)
  {
    bend=true; 
    start=false;
    score.score-=(8000-N*2000);
  }
  //표지판
  sign.display();
}
//스테이지2 함수
void definitionStage2() {
  //
  TMI=new Memo(0, 520, 35, 50, "sign.png", "11.png");
  //체력
  heart=30;
  //체력그림
  hart=loadImage("hart.png");
  //구조물
  for (int i=0; i<20; i++)
    land2[i]=new Block(i*50-20, 570, 50, 30, "land.jpg");
  for (int j=0; j<20; j++)
  { 
    block11[j][0]=new Block(-50, j*40, 50, 40, "gray.png");
    block11[j][1]=new Block(100, j*40-310, 50, 40, "gray.png");
    block11[j][2]=new Block(850, j*40-310, 50, 40, "gray.png");
  }
  //스킬체크
  skill=new Skill(100, 0, 0.05);
  skill.skilling=false;
  //문
  lock=new Lock(100, 490, 50, 80, "door.png");
  //레이저
  for (int q=0; q<3; q++)
    rlaser[q]=new Laser(q*200+250, 0, 10, 570, "red.png");
  for (int w=0; w<3; w++)
    blaser[w]=new Laser(w*200+350, 0, 10, 570, "blue.png");
}
//실행
void Stage2() {

  //체력
  image(hart, 0, 0, 30, 30);
  //구조물
  for (int i=0; i<20; i++)
  {
    land2[i].display();
    for (int o=0; o<3; o++)
      block11[i][o].display();
  }
  //문
  lock.display();
  //스킬체크 실행
  if (skill.skilling==true)
    skill.display();

  //레이저실행
  for (int k=0; k<3; k++)
  {
    rlaser[k].display();
    blaser[k].display();
  }
  //체력 표시
  fill(0);
  textSize(30);
  text((heart*100)/30, 30, 30); 
  //사망
  if (heart<0)
  {
    bend=true;
    start=false;
    score.score-=(8000-N*2000);
  }
  //다음 스테이지넘어가기
  if (px>width-error && px<width+error*10)
  {
    N++;
    px=10;
    //스킬체크 미리뜨는거 방지
    if (skil[0].skilling==true)
      skil[0].skilling=false;
  }
  //정보 안내
  TMI.display();
}


//스테이지3
void definitionStage3() {
  //성직자
  man=new Memo(800, 520, 30, 50, "man.png", "qusetion.png");
  //구조물

  for (int i=0; i<5; i++)
    
      land3[i]=new Block(i*50-100, 570, 50, 50, "land.jpg");

  for (int k=0; k<10; k++)
    {land4[k]=new Block(k*50+600, 570, 50, 50, "land.jpg");
    land5[k]=new Block(k*50+100,300,50,40,"gray.png");
  land6[k]=new Block(600,k*60+60,40,60,"gray.png");}
  for (int b=0; b<2; b++)
    block31[b]=new Block(b*200+300, 570, 40, 10, "brown.png");
  for(int o=0;o<6;o++)
  {land7[o]=new Block(o*120-100,400,20,20,"brown.png");
land8[o]=new Block(o*100+100,300-o*50,40,40,"brown.png");}
  land7[6]=new Block(560,500,40,40,"brown.png");
  //스킬및 버튼
  for (int j=0; j<2; j++) {
    skil[j]=new Skill(100, 0, j*0.03+0.08);
    skil[j].skilling=false;
    onbutton[j]=new Lock(j*250+100, 520, 40, 40, "on.png");
    offbutton[j]=new Lock(j*250+100, 520, 40, 40, "off.png");
  }
}
void Stage3() {
  //구조물
  for (int i=0; i<5; i++)
    {land3[i].display();
    }
  for (int k=0; k<10; k++)
{    land4[k].display();
 land5[k].display();
 land6[k].display();}
 for(int o=0;o<7;o++)
 land7[o].display();
 for(int u=0;u<6;u++)
 land8[u].display();
 
  for (int b=0; b<2; b++)
  { 
    if (skil[b].unlock==true)
      block31[b].display();
  }
  //스킬체크 및 버튼
  for (int j=0; j<2; j++)
  {
    if (skil[j].skilling==true)
      skil[j].display();
    //버튼 전원 키기
    if (skil[j].unlock==false)
      offbutton[j].display();
    else
      onbutton[j].display();
  }
  //사망
  if (py>700)
  { 
    bend=true; 
    start=false;
    score.score-=(8000-N*2000);
  }
  //다음스테이지
  if (px+pw<0)
  {
    N--;
    px=890; 
    py=530;
  }
  //성직자
  man.display();
}


void keyPressed() {
  //점프
  if (key==' ') 
  {
    jumping=true;
    jumpplay.play();
    jumpplay.rewind();
  }

  //움직이기 강의자료 참고
  if (keyCode==LEFT)
  {
    l=1;
  }
  if (keyCode==RIGHT)
  {
    r=1;
  }
  //제 1스테이지 안내
  if ( dist(px+pw/2, py+ph/2, sign.x+sign.xd/2, sign.y+sign.yd/2)<60 &&key=='x')
    sign.n++;
  //2스테이지 안내 및 스킬체크 실행
  if (dist(px+pw/2, py+ph/2, lock.x+lock.xd/2, lock.y+lock.yd/2)<50 && key=='x')
    skill.skilling=true;
  if ( dist(px+pw/2, py+ph/2, TMI.x+TMI.xd/2, TMI.y+TMI.yd/2)<50 &&key=='x')
    TMI.n++;
  //3스테이지 안내 및  스킬체크 실행
  for (int i=0; i<2; i++)
  {
    if (dist(px+pw/2, py+ph/2, offbutton[i].x+offbutton[i].xd/2, offbutton[i].y+offbutton[i].yd/2)<60 && key=='x')
      skil[i].skilling=true;
  }
  if ( dist(px+pw/2, py+ph/2, man.x+man.xd/2, man.y+man.yd/2)<50 &&key=='x')
    man.n++;
  //네! 라고 대답
  if (key=='x' && man.n==4)
  {
    hend=true;
    start=false;
  }
  //아니오! 라고 대답
  if (key=='c' && man.n==3)
  {
    bend=true;
    start=false;
  }
  if (key=='q')
    N++;
  //리셋
  if (key=='r')
    reset();
  //노래
  if (key=='m')play1.pause();
  if (key=='n')play1.play();
}
//강의자료 참고
void keyReleased() {
  if (keyCode==LEFT)
  {
    l=0;
    player=loadImage("l2.png");
  }
  if (keyCode==RIGHT)
  {

    r=0;
    player=loadImage("r2.png");
  }
  if (key==' ')
    jumping=false;
}
//점프
void jump()
{
  if (canjump ==true) {
    canjump=false;

    speed= -5;
    gravity= 0.10;
  }
}
//값 초기화
void reset() {
  start=true; 
  bend=false;
  hend=false;
  definitionStage1();
  definitionStage2();
  definitionStage3();
  N=-1;
}
void badend() {
  image(badending, 0, 0, 900, 600);
  textSize(100);
  textAlign(CENTER);
  fill(0, 255, 255);
  text(score.score, width/2, height/2);
  play1.pause();
  play2.pause();
  play3.play();
}
void happyend() {
  image(happyending, 0, 0, 900, 600);
  textSize(100);
  textAlign(CENTER);
  fill(0, 255, 255);
  text(score.score, width/2, height/2);
  play1.pause();
  play3.pause();
  play2.play();
}

void set(){
   fill(#43E567);
     textSize(30);
    textAlign(CENTER);
    text("Please Pressed key",width/2,height/2);
    if(keyPressed)
    N++;
}
