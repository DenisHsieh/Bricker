class ToolBox{
  float x,y,w,h;
  float colour;
  
  ToolBox(float a,float b,float c,float d,float cc){//toolbox 610,weight/2
    x=a;
    y=b;
    w=c;
    h=d;
    colour=cc;
  }
  
  
  void display(){
      fill(colour);      
      stroke(0);
      strokeWeight(0);
      rectMode(CENTER);
      rect(x,y,w,h);
  }
}
