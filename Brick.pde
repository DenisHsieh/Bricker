class Brick{
  float X,Y;
  boolean a=true;
  boolean b=true;
  float weight=1;
  float count=1;
  Brick(float x,float y){
    X= x;
    Y= y;
    
  }
  boolean sawtheblock(){
      if(weight==0){
        b=false;
      }
        return b;
      
  }
  void attack(){
    if(weight==3){
    weight--;
    }
  }
  boolean gotahit(float ball_x,float ball_y){
      if((ball_x>X-35&ball_x<X+35)&(ball_y>Y-30&ball_y<Y+30)){
        
          if(count==3){
              song = minim.loadFile("metal.mp3");
              song.play();
          }else if(count==2){
              song = minim.loadFile("rock.mp3");
              song.play();
          }else{
            song = minim.loadFile("normal.mp3");
              song.play();
          }       
          score++;
          count-=1;
          weight-=1;
          if(count==0){       
             a=false;
          }
         if(ball_y>Y-28&ball_y<Y+28){
             move_x*=-1;
         }
         if(ball_x>X-30&ball_x<X+30){
             move_y*=-1;
         }
      }
      return a;
  }
  void gotcolor(float c){
      weight=c;
      count=c;
  }
  
  void display(){
    if(a==true){
      if(weight==3){
        fill(#7B7B7B);//metal
      }else if(weight==2){
        fill(#842B00);//wood
      }else if(weight==1){
        fill(#FFFF93);
      }else{
        fill(255);
      }
      
      stroke(0);
      strokeWeight(2);
      rectMode(CENTER);
      rect(X,Y,40,30);
    }
  }
}
