class Raindrop {
  float diam;
  PVector v, acc, loc; //initialize variables

  Raindrop(float a, float b) { //constructor
    loc = new PVector(a, b);
    v = new PVector(0, 5);
    acc = new PVector(0, random(.03, .09));
    diam = 20; //assign values to variables
  }

  void fall() { //method fall
    loc.add(v);
    v.add(acc); //add velocity to location and acceleration to velocity
  }

  void display() { //method display
    noStroke();
    fill(0, 0, 255,75);
    ellipse(loc.x, loc.y, diam, diam); //display a circle at loc
  }

  boolean isInContactWith(Bucket b) { //method is in contact with
    boolean e;
    if (loc.dist(b.loc) < diam/2 + b.diam/2) { //if objects are in contact
      e = true; //true
    } else { //if they are not
      e = false; //false
    };
    return e; //if the mose touches a raindrop, return true
  }

  void reset() { //method reset 
    loc.y = -20;
    v.set(0, 5); //reset the velocity and put the raidrop at the top
  }
}