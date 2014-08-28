import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer song;
AudioPlayer songbackground;
PImage img;
FireRocket ro1,ro2,ro3;
boolean fire=false;
boolean fire2=false;
XML xml;
XML xml2;
XML[] children;
XML[] children2;
int score=0;
float pad_x;
float bbx;//controll the ball before start
float ball_x=70;
float ball_y=440;
float move_x=1;//ball move
float move_y=-1;//ball move
boolean a=false;//a key to controll the ball to move 
boolean start=false;//to controll the start time
boolean controll=true;
boolean manscreen=true;
float locate_x;
//ArrayList<Brick> brick;
Brick brick[][]; 
setBrick setbrick[][];
float brickTable[][];
float friction1;
float friction2;
ToolBox toolbox;
BrickButtom brickbuttom1,brickbuttom2,brickbuttom3;
float weight;//to attach the color of brick
void setup(){
  minim = new Minim(this);
  songbackground = minim.loadFile("mission.mp3");
    songbackground.play();
    ro1=new FireRocket(400,480);
    ro2=new FireRocket(500,500);
    ro3=new FireRocket(600,520);
  background(255);
  size(700,500);
  smooth();
  xml= loadXML("bricks.xml");
  children = xml.getChildren("aquare");
  xml2= loadXML("subset.xml");
  children2 = xml.getChildren("aquare");
  brickTable=new float [50][50];
    for(int i=0;i<50;i++){
        for(int j=0;j<50;j++){
            brickTable[i][j]=0;
        }    
    }
    /*
  brick=new ArrayList<Brick>();
    for(float j=45;j<=180;j+=30){
      for(float i=70;i<=445;i+=40){
          brick.add(new Brick(i,j,round(180.0)));    
      }
    }
    */
    // finish the bricks
    float xx=70,yy=45;  
    brick=new Brick[50][50];
    for(int i=0;i<5;i++){
        for(int j=0;j<10;j++){
          brick[j][i]=new Brick(xx,yy);//****************
          xx+=40;
        }
        xx=70;
        yy+=30;
    }
    //finish the bricks
    //set the bricks weight>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 
    float xx2=70,yy2=45;
    float ww2=2;
    setbrick=new setBrick[50][50];
    for(int i=0;i<5;i++){
        for(int j=0;j<10;j++){
          setbrick[j][i]=new setBrick(xx2,yy2);//****************
          xx2+=40;
        }
        xx2=70;
        yy2+=30;
    }
    //set the bricks<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
    
    
    
}

void draw(){
  
  //Pad>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  pad_x=mouseX;
  background(255);
  fill(0);
  rectMode(CENTER);
  if(pad_x>480){
    pad_x=480;
  }else{
    pad_x=mouseX;
  }
  rect(pad_x,450,30,10);
  //Pad<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  
   //display the setbricks>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 
    
    //--------------------------------------------------**********************
 if(start==false){ 
    for(int i=0;i<5;i++){
        for(int j=0;j<10;j++){
          setbrick[j][i].getcolor(weight);
          setbrick[j][i].display();//****************
          
        }
    }
 }
    //display  the setbricks<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  
  
  
  
  
  //bound>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  Bound left=new Bound(7.5,height/2,15,500);
        left.display();
  Bound up=new Bound(260,7.5,495,15);
        up.display();
  Bound right=new Bound(504,height/2,15,500);
        right.display();
  //bound<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  
  //ball>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        friction1=mouseX;
       if(a==true){
           locate_x=mouseX;
         ball_y+=(move_y*3);//start location and the way
         ball_x+=(move_x*3);
         ellipse(ball_x,ball_y,20,20);
         if(ball_y<20){//controll the rebound of y-axis
           move_y*=-1;
         }
         if(ball_x>485||ball_x<30){//controll the rebound of x-axis
           move_x*=-1;
           
         }
         if(ball_y>485&&manscreen==true){//gameover
           song = minim.loadFile("manscreen.mp3");
              song.play();
           manscreen=false; 
             a=false; 
            start=false; 
         }
         
           
          
         if(ball_y>435){//hit the ball
           friction2=mouseX;
           if(ball_x>locate_x-13&ball_x<locate_x+13){
               move_y*=-1;
               move_x+=(friction2-friction1)*10000;
               
           }
           if(ball_x>locate_x-17&ball_x<locate_x-13){
               move_y*=-1;
               move_x*=-1;
               
           }
           if(ball_x>locate_x+13&ball_x<locate_x+17){
               move_y*=-1;
               move_x*=-1;
               
           }
         }
       }else{//the condition of ball before start
         bbx=mouseX;
         if(bbx>480){
           bbx=480;
         }else{
           bbx=mouseX;
         }  
        ellipse(bbx,ball_y,20,20);       
       }
    
  //ball<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  //brick<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
      //hit the bricks
if(start==true){ 
  for(int i=0;i<5;i++){
        for(int j=0;j<10;j++){
              if(a==false){ //"a" is a key to controll the ball to move            
                   
                   brick[j][i].display();
                   
              }
          
              if(brick[j][i]!=null&a==true){
                  if(brick[j][i].gotahit(ball_x,ball_y)==false|
                                brick[j][i].sawtheblock()==false){
                    brick[j][i]=null;
                  }
                 
                  if(brick[j][i]!=null){
                    
                    brick[j][i].display();
                  }
              }else{
            
              }
          
          
        }
    }
}  
    /*
    if(a==true){
      for(int i=0;i<5;i++){
        for(int j=0;j<10;j++){
          //brick[j][i].gotahit(ball_x,ball_y);
          if(brick[j][i].gotahit(ball_x,ball_y)==false){
            brick[j][i]=null;
          }
        }
      }
    }
  */
  //brick<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  //toolbox>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    toolbox= new ToolBox(610,height/2,200,height,180);
      toolbox.display();
    brickbuttom1=new BrickButtom(610,50,1);
    brickbuttom2=new BrickButtom(610,90,2);
    brickbuttom3=new BrickButtom(610,130,3);
    
      brickbuttom1.display();
      brickbuttom2.display();
      brickbuttom3.display();
  //toolbox<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  //test the brick weight
  fill(255);
  textSize(10);
  text(weight, 20,10);
  //test the brick weight
  //"save" buttom
      fill(255);
      stroke(0);
      strokeWeight(2);
      rectMode(CENTER);
      rect(610,250,60,50);
          fill(0);
          textSize(20);
          text("SAVE", 585,260);
   //"save" buttom  
  //"LOAD" buttom
      fill(255);
      stroke(0);
      strokeWeight(2);
      rectMode(CENTER);
      rect(610,320,60,50);
          fill(0);
          textSize(20);
          text("LOAD", 582,330);
   //"LOAD" buttom  
  //score
          fill(0);
          textSize(20);
          text("SCORE", 582,400);
          fill(0);
          textSize(50);
          text(score, 582,450);
   //score     
   if(score>=10){
     fire=true;
   }
   if(fire==true){
          fill(#CE0000);//RED
          textSize(20);
          text("press F to fire rockets", 200,300);
   }
   if(fire2==true){
     ro1.display();
     ro2.display();
     ro3.display();
     fire2=false;
   }
     
}
void keyPressed(){//start the game
 if(fire==true){
  if(key=='f'|key=='F'){
    fire2=true;
     song = minim.loadFile("firerocket.mp3");
              song.play();
              fire=false;
              
  }
 }
  if(key=='s'|key=='S'){
    a=true;
    start=true;
  }
}
void mousePressed(){
  //controll the weight when click
  if((mouseX>610-20&mouseX<610+20)&(mouseY>50-15&mouseY<50+15)){
      weight=1;
  }
  if((mouseX>610-20&mouseX<610+20)&(mouseY>90-15&mouseY<90+15)){
      weight=2;
  }
  if((mouseX>610-20&mouseX<610+20)&(mouseY>130-15&mouseY<130+15)){
      weight=3;
  }
  if((mouseX>610-30&mouseX<610+30)&(mouseY>250-25&mouseY<250+25)){//save
      for(int i=0;i<5;i++){
        for(int j=0;j<10;j++){
            brickTable[j][i]=setbrick[j][i].SaveToBrickTable();
            
            for (int h = 0; h < children.length; h++) {
                  int id = children[h].getInt("id");
                  int sp = children[h].getInt("species");
                  
                  if(id==i&sp==j){
                    children[h].setFloat("num",brickTable[j][i]);
                  }
                   
            }
             saveXML(xml, "subset.xml");
        }
      }
      
      
  }
  
  if((mouseX>610-30&mouseX<610+30)&(mouseY>320-25&mouseY<320+25)){//load
      if(controll==true){
        for(int i=0;i<5;i++){
        for(int j=0;j<10;j++){
         //brick[j][i].gotcolor(m);
            
            for (int h = 0; h < children2.length; h++) {
                  int id = children2[h].getInt("id");
                  int sp = children2[h].getInt("species");
                  
                  if(id==i&sp==j){
                    brick[j][i].gotcolor(children2[h].getFloat("num"));
                    
                  }
                   
            }
            
        }
      }
      controll=false;
   } 
  }
  
}
