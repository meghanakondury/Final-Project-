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