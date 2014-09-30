class Ball {

  float r;   // radius
  float x,y; // location
  float xspeed,yspeed; // speed
  
  // Constructor
  Ball(float tempR) {
    r = tempR;
    x = random(width);
    y = random(height);
    xspeed = random( - 7,7);
    yspeed = random( - 5,5);
  }
  
 
  
  void move() {
    x = x+xspeed; // Increment x
    y = y+yspeed; // Increment y
    
    // Check horizontal edges
    if (x > width || x < 0) {
      xspeed = xspeed *(-1);
    }
    //Check vertical edges
    if (y > height || y < 0) {
      yspeed = yspeed *(-1);
    }
  }
  
  void mouseMove(){
    x=mouseX;
    y=mouseY;
  }
  
  // Draw the ball
  void display() {
    stroke(0);


    ellipse(x,y,r*2,r*2);
  }
  
  void collide(Ball hit) {

      float rSum=this.r + hit.r;
      
      if( ((x - hit.x)*(x - hit.x) + (y-hit.y)*(y-hit.y))
      <= rSum*rSum ){
        hit.yspeed*=-1;
        hit.xspeed*=-1;
      }
      
    
    }
  
  
  // Change color  (this does not work )
  void changeColor(float x, float y){
    
  }
    
}
// Two ball variables
Ball ball1;
Ball mouseball;

void setup() {
  size(500,600);
  smooth();
  
  // Initialize balls
  ball1 = new Ball(20);
  mouseball = new Ball(40);
}

void draw() {
  background(255);
  
  noStroke();
  fill(52,52,100);

 

  ball1.move();
  mouseball.mouseMove();
  
  //print(ball1.x);  i was trying to make the ball change color, but havent figure it out
 /* if( overlap ){
    ball1.changeColor();
  }
  */
  ball1.display();
  mouseball.display();
  //ball1.collide(ball2);
  mouseball.collide(ball1);
}
