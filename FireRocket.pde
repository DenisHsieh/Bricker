class FireRocket{
  float x,y;
  FireRocket(float a, float b){
      img = loadImage("rocket.gif");
      x=a;
      y=b;
  }
  void display(){
      image(img, x, y);
      x-=20;
      y-=20;
  }
}
