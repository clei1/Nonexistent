class Ball{
  float x, y, dx, dy;
  color c;
  int state, r, maxR, dr;

  Ball() {
    r = 10;
    maxR = 70;
    dr = 1;
    x = random(width - r) + r/2;
    y = random(height - r) + r/2;
    dx = random(r) - r/2;
    dy = random(r) - r/2;
    c = color(random(256), random(256), random(256));
    state = 0;
  }
  
  void move(){
    if(state == 1)
      still();
    else{
      x += dx;
      y += dy;
      bounce();
    }
  }
  
  void collide(Ball[] balls){
    if(state == 0){
      for(Ball b: balls){
        if(b.state == 1 && 
           b.r > 0 &&
           dist(b.x, b.y, x, y) < (b.r + r)){
             state = 1;
           }
      }
    }
  }
  
  void still(){    
    r += dr; //updates 
    if(r > maxR) //decreasing size
      dr = -dr;
    if(r < 0){ //updates to nonexistence
      dr = 0;
      r = 0;
    }
  }

  void bounce(){
    if(x > width || x < 0){
      dx *= -1;
    }
    if(y > height || y < 0){
      dy *= -1;
    }
  }
  
  void display(){
    fill(c);
    ellipse(x, y, -r, -r);
  }
}