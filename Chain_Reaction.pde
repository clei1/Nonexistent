Ball[] balls;

void setup(){
  
  size(600, 300);
  frameRate(60);
  
  balls = new Ball[25];
  for(int i = 0; i < balls.length; i ++){
    balls[i] = new Ball(); 
  }
}

void draw(){
  
  background(0);
  
  for(Ball b : balls){
    if(mousePressed){
      if(dist(mouseX, mouseY, b.x, b.y) < 2){
           b.state = 1;
         }
    }
    b.collide(balls);
    b.move();
    b.display();
  }
}