class Raindrop {
  float diam;
  PVector v, acc, loc;

  Raindrop(float a, float b) {
    loc = new PVector(a, b);
    v = new PVector(0, 5);
    acc = new PVector(0, random(.03,.09));
    diam = 20;
  }

  void fall() {
    loc.add(v);
    v.add(acc);
  }

  void display() {
    noStroke();
    fill(0, 0, 255);
    ellipse(loc.x, loc.y, diam, diam);
  }

  boolean isInContactWith(PVector c) {
    boolean e;
    if (loc.dist(c) < diam/2) {
      e = true;
    } else {
      e = false;
    };
    return e;
  }

  void reset() {
    loc.y = -20;
    v.set(0, 5);
  }
}