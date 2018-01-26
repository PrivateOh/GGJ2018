import fisica.*;

// World
FWorld world;

void setup() {
 smooth();
 Fisica.init(this);
 this.world = new FWorld();
}

void draw() {
  background(255);
  world.draw();
  world.step();
}