function setup() {
  createCanvas(800, 800);
}

function draw() {
  background(0);
  textAlign(CENTER);
  textSize(50);
  fill(255);
  text ('start', width/2,height/2);
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
