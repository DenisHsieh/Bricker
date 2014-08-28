class Ball{
  float x,y,w,h;
  Ball(float x_,float y_,float w_,float h_){
      x=x_;
      y=y_;
      w=w_;
      h=h_;
  }
  void display(){
      fill(0);
      smooth();
      stroke(0);
      strokeWeight(1);
      ellipse(x,y,w,h);
  }
  void update(){
    x=mouseX;
    y=mouseY;
    
  }
}
