class setBrick{
  
    float X,Y;
  boolean a=true;
  float w;
  setBrick(float x,float y){
    X= x;
    Y= y;
  }
  
  void getcolor(float ww){
    if((mouseX>X-20&mouseX<X+20)&(mouseY>Y-15&mouseY<Y+15)){
        w=ww;
    }
  }
  
  float SaveToBrickTable(){
    return w;
  }
  
  void display(){
    
      if(w==3){
        fill(#7B7B7B);//metal
      }else if(w==2){
        fill(#842B00);//wood
      }else if(w==1){
        fill(#FFFF93);
      }else{
        fill(255);
      }
      
      
      stroke(0);
      strokeWeight(0);
      rectMode(CENTER);
      rect(X,Y,40,30);
    }
}

