class Bucket {
  PVector loc;
  int diam; //initialize variables

  Bucket(int d) { //constructor
    diam = d;
    loc = new PVector();
  }

  void update() { //method update
    loc.set(mouseX, mouseY); //update position to mouse
  }

  void display() { //method display
    fill(0,0);
    ellipse(loc.x, loc.y, diam, diam); //display bucket
  }
}