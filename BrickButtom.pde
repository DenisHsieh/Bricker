class BrickButtom{
  float x,y,weight;
 
  
  BrickButtom(float a,float b,float e){//brick button
    x=a;
    y=b;
    weight=e;
  }
  
  void display(){
        if(weight==3){
          fill(#7B7B7B);//metal
        }else if(weight==2){
          fill(#842B00);//wood
        }else{
          fill(#FFFF93);
        }
      
      stroke(0);
      strokeWeight(0);
      rectMode(CENTER);
      rect(x,y,40,30);
      
      fill(0);
      textSize(20);
      if(weight==3){
          text("3", x,y+5);
        }else if(weight==2){
          text("2", x,y+5);
        }else{
          text("1", x,y+5);
        }
       
      
  }
}


