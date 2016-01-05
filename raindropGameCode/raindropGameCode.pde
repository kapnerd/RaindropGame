int count = 1000;
ArrayList<Raindrop> drop = new ArrayList<Raindrop>();
Bucket b;
int score;
int l;
PImage vac;
PImage base; //initialize variables

void setup() {
  size(1200, 800);
  b = new Bucket(150); //create a bucket of diameter 150
  score = 0;
  l = 0; //set the water level and score to 0
  textSize(50);
  textAlign(CENTER, CENTER); //chage text display
  vac = loadImage("vac.png");
  base = loadImage("basement.jpg"); //load images
  imageMode(CENTER);
}

void draw() {
  background(0);
  image(base, width/2, height/2, 1200, 800); //use basement as background
  b.update();
  b.display(); //move and show the bucket
  drop.add(new Raindrop(random(width), random(-20, 0))); //create a raindrop to the drop array list
  if (l<height) { //if the water is lower than the height
    for (int i = drop.size()-1; i>= 0; i--) { //the size of the array list decreases until it is 0
      Raindrop r = drop.get(i); //create a raindrop
      r.fall();         //make the raindrop fall. It should accelerate as if pulled towards the ground by earth's gravity
      r.display();      //display the raindrop
      if (r.isInContactWith(b)) {      //check to see if the raindrop is in contact with the bucket
        drop.remove(i);  //if it is, reset the raindrop
        score = score + 1; //add to the score
      }
      if (r.loc.y > height - l + r.diam/2) {     //check to see if the raindrop goes below the bottom of the screen
        drop.remove(i);                           //if it does, reset the raindrop
        l = l + 1; //increase the water level
      }
    }
  }
  fill(0, 0, 255, 75);
  rect(0, height-l, width, l); //create pool of water
  fill(255, 0, 0);
  text(score, width/2, height/2); //display score
  if (l == height) { //if the water fills the screen
    if (score < 1000) { //if the score is less than 100
      background(0);
      text("FAILURE", width/2, height/2); //show game over screen
    } else { //if the score is above 1000
      background(0);
      text("SUCCESS", width/2, height/2); //show winning screen
    }
  }
  if (frameCount<200) { //at the beginning
    textSize(30);
    text("Collect 1,000 raindrops with your Shop-Vac before your basement is flooded!", width/2, height/2 - 100);
    textSize(50); // display ntro text
  }
  image(vac, mouseX, mouseY); //show shopvac at mouse
}