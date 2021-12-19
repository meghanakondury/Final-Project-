let car;
let barrel;
let cone;
let c;
let speed = 5;
let o = [];
let oSpeed=4;
let oTimer=60;
let stop = false;
let screen = 0;
let sTimer=0;
let rList=[];
let r;
let rect1=[];
let rect2=[];

function preload(){
 car=loadImage("Untitled-1.png") 
barrel= loadImage ("barrel.png")
  cone= loadImage("cone-1.png")
}

function setup() {
  createCanvas(800, 800);
  
  r=new Roads();
  rList=[barrel,cone];
  c=createSprite (400,200,50,50);
  car.resize(50,50);
  barrel.resize(50,60);
  cone.resize(50,60);
  c.addImage(car);
  
  for (let i=0; i<3; i++){
    let shape=rList[int(random(0,rList.length))];
  
    o[i] = createSprite(300+i*100,700,50,60)
    o[i].addImage(shape);
  }
for(var i =0; i<15; i++){
    let y = height/6*i;
    rect1[i] = new Roads(width*2/3,y,25,25);
  }
   for(var i =0; i<15; i++){
    let u = height/6*i;
    rect2[i] = new Roads(width/3,u,25,25);
}  
}

function draw(){
  console.log(screen);
  background(120);
  if (screen==0){
    sTimer+=1;
    console.log(sTimer);
    background(100);
    if (sTimer>5 & sTimer<7000){
      textAlign(CENTER);
      textSize(50);
      fill(255);
      text ('start', width/2,height/2);
    }
    if (sTimer>60 & sTimer<120){
      fill(255);
      text ('5',width/2,height/2+60);
    }
    if (sTimer>120 & sTimer<180){
      fill(255);
      text ('4',width/2,height/2+60);
    }
    if (sTimer>180 & sTimer<240){
      fill(255);
    text ('3',width/2,height/2+60);
    }
    if (sTimer>240 & sTimer<300){
      fill(255);
      text ('2',width/2,height/2+60);
      fill(255);
    }
    if (sTimer>300 & sTimer<360){
      fill(255);
      text ('1',width/2,height/2+60);
    }
    if (sTimer>360 & sTimer<420){
      fill(255);
      text ('GO!!',width/2,height/2+60);
    }
    if (sTimer>420){
      sTimer=0;
      screen=1;    
    }
  }

  if (screen==1){

  if (stop == false){
      road();
    r.display();
  if (keyDown ('a')){
    c.position.x -= speed;
    
}
  if (keyDown ('d')){
    c.position.x += speed;
    
}
  //obstacle movement 
  
  for (let i=0; i<o.length; i++){
    o[i].position.y -= oSpeed;
    
  }
  //obstacle creation
  oTimer-=1;
  
  if (oTimer<1){
    oTimer = 60;
    o.push(createSprite (random (100,700),800,40,40))
    let shape=rList[int(random(0,rList.length))];
  
    o[o.length-1].addImage(shape);
  }
  //obstacle detection
  for (let i=0; i<o.length; i++){
    if (c.overlap(o[i])){
        console.log("END")  
      stop = true;
    }
  }
  }
  else{
    road();
    fill(255);
   for(var i =0; i<15; i++){
rect1[i].stop ();
   }
for(var i =0; i<15; i++){
rect2[i].stop ();  
}    
    textSize(50);
    textAlign(CENTER,CENTER);
    fill(255,57,0);
    text("YOU LOST", 400,400);
    text("Press R to restart", 400,600);
    if (keyDown("r")){
      screen=0;
      console.log("restart");
      
      
    }
  }
  
  drawSprites();
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




//tab 2 
class Roads{
  constructor (x,y,size,color){
    this.x = x;
    this.y = y;
    this.size = size;
    this.color = color;
  
  }
  display(){
    noStroke();
    rect(this.x,this.y,this.size,this.size);
    this.y = this.y-8;
    if (this.y<0){
      this.y=height;
    }
  }
  stop(){
    this.y=0;
  }
}
