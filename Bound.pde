class Bound{
  float x,y,w,h;
  Bound(float x_,float y_,float w_,float h_){
    x=x_;
    y=y_;
    w=w_;
    h=h_;
  }
  void display(){
      fill(0);
      smooth();
      stroke(0);
      strokeWeight(0);
      
      rect(x,y,w,h);
    
  }
}
