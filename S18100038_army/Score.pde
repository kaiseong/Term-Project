class Score{
  int savedTime;
  int totalTime;
  int passedTime;
  int score;
  
  Score()
  {
   score=10000;
   savedTime=0;
   passedTime=0;
   totalTime=1000;
 
   
  }
  
  void display(){
    passedTime=millis()-savedTime;
    
    //초당 -10점씩
    if(passedTime>totalTime){
      score-=10;
      savedTime=millis();
      
  }
    
  }}
