//Meghana's Final Project

let car;     //main object of my game, a moving car in constant speed that can shift lanes in order to escape from the obstacles
let barrel;    //random barrels moving in the opposite direction of the car (obstacle 1)
let cone;      //random traffic cones moving in the opposite direction of the car (obstacle 2)
let c;
let speed = 15;   //speed of the car to move left and right
let o = [];  
let oSpeed=4;   //obstacle - barrel and traffic cones speed 
let oTimer=60;
let stop = false;
let screen = 0;  //have two screens in my game
let sTimer=0;    //used my own variable to have the countdown in screen 1 instead of using millis
let rList=[];  //used an array to have the barrels and traffic cones appear at random places of the screen 
let r;     //this is for the rectangles that give the look of the road
let rect1=[];    //first set of moving rectangles to the left of the screen
let rect2=[];     //second set of moving rectangles to the right of the screen
//let playSound = false;  //I was trying to add music. I found the right music and learnt from a few tutorials on how to add sound. But I could not incorporate it at all. 
                           //I am not deleting out this part of the code as I have spent a lot of time trying to incorporate it and I would like to present what I have. 
//let playMusic = true;
//let PLAY=1;
//let gameState=PLAY;
//let gameover, gameoverImage;
//let restart, restartImage
let growspeed = .01;
let yspeed = 2;
let score=0;
let barrelsize = 0;

function preload(){
 car=loadImage("Untitled-1.png")    //used images instead of drawing simple objects as I wanted a more realistic affect
barrel= loadImage ("barrel.png")
  cone= loadImage("cone-1.png")
	//youLose = loadSound('zapsplat_multimedia_game_lose_negative_001.mp3');
	//Music = loadSound('music_zapsplat_game_music_action_fun_funky_electro_disco_023.mp3');
	//gameoverImage = loadImage ("gameover.png")  //used a premade image to show that the game is over when a player loses the game
	//restartImage = loadImage ("restart.png")
}

function setup() {
  createCanvas(800, 800);
  
  r=new Roads();
  rList=[barrel,cone];
  c=createSprite(400,200,50,50);
  car.resize(150,150);
  barrel.resize(50,60);
  cone.resize(50,60);
  c.addImage(car);
	
	//gameover=createSprite(70,300,30,30)
  //gameover.addImage(gameoverImage);
  //gameover.scale=0.6;
  
  //restart=createSprite(270,400,30,30)
  //restart.addImage(restartImage);
 // restart.scale=0.2;
  
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

		//if(playMusic == true){
		//	Music.play();
			//}playMusic = false
		
    sTimer+=1;
    console.log(sTimer);
    background(100);
    if (sTimer>5 & sTimer<7000){
      textAlign(CENTER);
      textSize(50);
      fill(255);
      text ('Start', width/2,height/2);
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
			//playsound = true

  if (screen==1){
		//if(gameState===PLAY){

  if (stop == false){
      road();
    r.display();
  if (keyDown ('a')){
    c.position.x -= speed;
    
}
  if (keyDown ('d')){
    c.position.x += speed;
	}
	noStroke();
  fill(255);
  textSize(25);
  text("Score: " + str(floor(frameCount/10)), width-175, 50);   //this displays the score on the screen
	
//obstacle movement 
  
  for (let i=0; i<o.length; i++){
    o[i].position.y -= oSpeed;
       
  //gameover.visible=false;
  //restart.visible=false;
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
			

  sTimer+=1;   //to repeat screen 0 again I am coding it again
    console.log(sTimer);
    background(100);
    if (sTimer>5 & sTimer<7000){
      textAlign(CENTER);
      textSize(50);
      fill(255);
      text ('Start', width/2,height/2);
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
   
  //depending on the player's score, the speed of the obstacles increase 
  if(score>100 && score<200){
    growspeed = .15;
    yspeed=5;
  }
  if(score>250){
    barrelsize+=growspeed;
  }
  
  if(score>300&& score<400){
    growspeed=.18;
    yspeed=6;
  }
  if(score>420){
    barrelsize+=growspeed;
  }
  }
  drawSprites();
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
}