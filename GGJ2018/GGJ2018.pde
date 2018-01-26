//////////////////////////////////////////////
//         GGJ2018 - AstralProjection       //
//           Creation : 26/01/18            //
//     Derniere modification : 26/01/18     //
//              Version : 0.01              //
//////////////////////////////////////////////

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