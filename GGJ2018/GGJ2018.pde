//////////////////////////////////////////////
//         GGJ2018 - AstralProjection       //
//           Creation : 26/01/18            //
//     Derniere modification : 26/01/18     //
//              Version : 0.01              //
//////////////////////////////////////////////

import fisica.*;

public static final int COLOR_BK = 0;

// World
public FWorld m_world;

void setup() {
  fullScreen();
  smooth();

  Fisica.init(this);
  this.initWorld();
  this.loadLevel(1);
}

void draw() {
  background(COLOR_BK);
  this.m_world.step();
  this.m_world.draw();
}

/* Create the world and init parameters */
void initWorld() {
  this.m_world = new FWorld();
  this.m_world.setGravity(0, 0);
}

/* Load the level passed in parameter */
void loadLevel(int number) {
  this.initWorld();
  /* File: Level.ine */
  this.createLevel(number);
}