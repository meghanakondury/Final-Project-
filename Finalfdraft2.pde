function preload(){
 car3=loadImage("Untitled-1.png") 
barrel= loadImage ("barrel.png")
  tcone= loadImage("cone-1.png")
}
class Obstacles{
  constructor (x,y,size){
    this.x = random (width);
    this.y = y;
    this.size = size;
  
  }
  displayb(){
  image(barrel,this.x,this.y,this.size,this.size);
  }
  displayt(){  
  image(tcone,10,height/2,100,100);

}
}

class Roads{
  constructor (x,y,size,color){
    this.x = x;
    this.y = y;
    this.size = size;
    this.color = color;
  
  }
  display(){
    noStroke();
   // fill(this.color);
    rect(this.x,this.y,this.size,this.size);
    this.y = this.y-8;
    if (this.y<0){
      this.y=height;
    }
  }
}

let car3;
let rect1 = [];
let rect2 = [];
let carposx=400;
let cardir=0;
let barrel= [];
let tcone;
let sec = 0;
let min= 0;

function setup() {
  createCanvas(800, 800);
  
  
  for(var i =0; i<15; i++){
    let y = height/6*i;
    rect1[i] = new Roads(width*2/3,y,25,25);
  }
   for(var i =0; i<15; i++){
    let u = height/6*i;
    rect2[i] = new Roads(width/3,u,25,25);
}
  //tcone = new Obstacles ();
  for(var i =0; i<15; i++){
    let x = random(height);
    let 
  barrel = new Obstacles ();
  }
  setInterval("hello()",1000); 

}
  
function draw() {

//scene1(); 


  //if (millis()>7000 & millis()<15000){
    background(107,111,115);
  car();
  road();
  //barrel.displayb();
  image(barrel,10,height/2,100,100);
  image(tcone,100,height/2,100,100);
  timer();
 // tcone.displayt();
  //barrel.displayb();
  
//}
 
}

function scene1 () {
   background(100);
  if (millis()>5 & millis()<7000){
  textAlign(CENTER);
  textSize(50);
  fill(255);
  text ('start', width/2,height/2);
  }
  if (millis()>1000 & millis()<2000){
    fill(255);
  text ('5',width/2,height/2+60);
}
  if (millis()>2000 & millis()<3000){
    fill(255);
  text ('4',width/2,height/2+60);
}if (millis()>3000 & millis()<4000){
  fill(255);
  text ('3',width/2,height/2+60);
}if (millis()>4000 & millis()<5000){
  fill(255);
  text ('2',width/2,height/2+60);
  fill(255);
}if (millis()>5000 & millis()<6000){
  fill(255);
  text ('1',width/2,height/2+60);
}
  if (millis()>6000 & millis()<7000){
  fill(255);
  text ('GO!!',width/2,height/2+60);
}
}
function road(){
fill(255);
   for(var i =0; i<15; i++){
rect1[i].display ();
   }
for(var i =0; i<15; i++){
rect2[i].display ();  
}  
}

function keyPressed (){    
      if(keyIsDown=='a'){
        if(carposx>=40){
        carposx+=-5;
        cardir+=1;
          if(cardir<0){
           cardir+=2;
          }
        }
      }
    
    if(keyIsDown=='d'){
     if(carposx<=460){ 
      carposx+=5;
      cardir-=1;
      if(cardir>0){
      cardir-=2;
      }
     }
  }
  else
  {
   if(cardir>0){
   cardir-=2;
   } 
   if(cardir<0){
   cardir+=2;  
   }
  }
}

function car (){
 image(car3,carposx,height/2,100,100);

}
function hello() {
print("abc")
sec+=1;
  if(sec == 60){
    sec= 0;
    min+= 1;
    if(min== 60){
      min=0;
    
    }
  }
  return 1;
} 

function timer (){
  //scene1(); 
fill(0);
  textSize(25);
 // text(":",width/2-40,height/2);     // :
  fill(0);
  text(min,width*5/6+10,height/20);     // min
  fill(0);
  text(":",width*5/6+30,height/20);     // : 
  fill(0);
  text(sec,width*5/6+50,height/20);    // sec
}



  
  
