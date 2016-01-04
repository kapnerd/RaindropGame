class Raindrop {
  float diam;
  PVector v, acc, loc;

  Raindrop(float a, float b) {
    loc = new PVector(a, b);
    v = new PVector(0, 5);
    acc = new PVector(0, random(.03, .09));
    diam = 20;
  }

  void fall() {
    loc.add(v);
    v.add(acc); //add velocity to location and acceleration to velocity
  }

  void display() {
    noStroke();
    fill(0, 0, 255,75);
    ellipse(loc.x, loc.y, diam, diam); //display a circle at loc
  }

  boolean isInContactWith(Bucket b) {
    boolean e;
    if (loc.dist(b.loc) < diam/2 + b.diam/2) {
      e = true;
    } else {
      e = false;
    };
    return e; //if the mose touches a raindrop, return true
  }

  void reset() {
    loc.y = -20;
    v.set(0, 5); //reset the velocity and put the raidrop at the top
  }
}