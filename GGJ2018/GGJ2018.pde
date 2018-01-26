import fisica.*;

public static final int COLOR_BK = 0;

// World
FWorld m_world;

void setup() {
  fullScreen();
  smooth();

  Fisica.init(this);
  this.initWorld();
}

void draw() {
  background(COLOR_BK);
  m_world.step();
  m_world.draw();
}

/* Create the world and init his parameters */
void initWorld() {
  this.m_world = new FWorld();
  this.m_world.setGravity(0, 0);
}