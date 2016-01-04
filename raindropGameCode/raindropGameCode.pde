int count = 1000;
PVector mouse;   //declare a P
ArrayList<Raindrop> drop = new ArrayList<Raindrop>();
Bucket b;
int score;

// On your own, create an array of Raindrop objects instead of just one
// Use the array instead of the single object
// You can start out by just using the single Raindrop as you test


void setup() {
  size(1200, 800);
  mouse = new PVector();//initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
  b = new Bucket(150);
  score = 0;
  textSize(50);
  textAlign(CENTER, CENTER);
}

void draw() {
  mouse.set(mouseX, mouseY);             //set value of mouse as mouseX,mouseY
  background(0, 200, 255);
  b.update();
  b.display();
  drop.add(new Raindrop(random(width), random(-20,0)));
  for (int i = drop.size()-1; i>= 0; i--) { 
    Raindrop r = drop.get(i);
    r.fall();         //make the raindrop fall. It should accelerate as if pulled towards the ground by earth's gravity
    r.display();      //display the raindrop
    if (r.isInContactWith(b)) {      //check to see if the raindrop is in contact with the point represented by the PVector called mouse
      drop.remove(i);  //if it is, reset the raindrop
      score = score + 1;
    }
    if (r.loc.y > height + r.diam/2) {     //check to see if the raindrop goes below the bottom of the screen
      drop.remove(i);                           //if it does, reset the raindrop
    }
  }
  fill(255,0,0);
  text(score,width/2, height/2);
}