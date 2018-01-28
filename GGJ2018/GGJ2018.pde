//////////////////////////////////////////////
//         GGJ2018 - AstralProjection       //
//           Creation : 26/01/18            //
//     Derniere modification : 26/01/18     //
//              Version : 0.08              //
//////////////////////////////////////////////

// PLus pouvoir bouger
// Ne plus être détectable
// Entrer de l'intérieur de l'objet
// faire disparaitre le cercle
// Re-click ejecter de l'objet

import fisica.*;

public int COEFF_X;
public int COEFF_Y;
public static final int COLOR_BK = 0;
public static final int COLOR_WH = 255;
public static final int COLOR_GR = 145;
public FBox endLevel;
public Player player = null;
public ArrayList<Ennemy> m_ennemys = null;
public FLine m_line;
public int currentLevel;
public ArrayList<Wall> m_walls = null;
public ArrayList<Obstacle> m_obstacles = null;

// World
public FWorld m_world;

void setup() {
  fullScreen();
  smooth();
  COEFF_X = width/40;
  COEFF_Y = height/27;

  // this.soundAbsorb = new SoundFile(this, "/data/sounds/vomit.mp3");

  currentLevel = 1;
  Fisica.init(this);
  noCursor();
  this.m_ennemys = new ArrayList<Ennemy>();
  this.m_walls = new ArrayList<Wall>();
  this.m_obstacles = new ArrayList<Obstacle>();
  this.initWorld();
  this.loadLevel(1);
}

void draw() {
  background(COLOR_BK);

  stroke(255);
  if (!this.player.getIsAlive()) {
    loadLevel(currentLevel);
  }
  this.m_world.step();
  this.m_world.draw();

  for (Ennemy ennemy : m_ennemys) {
    ennemy.detectObstacle();
    ennemy.draw();
  }

  for (Obstacle obstacle : m_obstacles) {
    obstacle.setPossessed(obstacle.obstacle.isSensor());
  }
  if (player.getObject().isTouchingBody(endLevel)) {
    currentLevel++;
    loadLevel(currentLevel);
  }
  drawCursor();
  if (currentLevel == 1) {
    fill(0);
    text("Click on item in your \naction range to posses them", caseIntoCoord(F, 3).getX(), caseIntoCoord(H, 3-0.5).getY());
    fill(255);
    text("Click on the floor in your \naction range to quit the item", caseIntoCoord(F, 5).getX(), caseIntoCoord(H, 5-0.5).getY());
    fill(0);
    text("Press E when you posses \nswitches to unlock doors", caseIntoCoord(N, 7).getX(), caseIntoCoord(N, 7-0.5).getY());
    fill(255);
    text("Move with ZQSD", caseIntoCoord(C, 9).getX(), caseIntoCoord(C, 9).getY());
    text("Hide from the ghosts in the items", caseIntoCoord(Z, 16).getX(), caseIntoCoord(Z, 16).getY());
  }
  if (this.player != null) {
    this.player.draw();
  }
}

/* Create the world and init parameters */
void initWorld() {
  this.m_world = new FWorld();
  this.m_world.setGravity(0, 0);
}

/* Load the level passed in parameter */
void loadLevel(int number) {
  if (this.m_world != null) {
    this.m_world.clear();
  }
  this.m_ennemys.clear();
  this.m_obstacles.clear();
  this.m_walls.clear();
  this.initWorld();
  /* File: Level.ine */
  this.createLevel(number);
}

void keyPressed() {
  if (this.player != null)
  {
    this.player.keyPressed(keyCode);
  }
}

void keyReleased() {
  if (this.player != null)
  {
    this.player.keyReleased(keyCode);
  }
}

void mousePressed() {
  if (this.player != null)
  {
    this.player.mousePressed();
  }
}

void drawCursor () {
  stroke(255);
  line(mouseX+8, mouseY, mouseX-8, mouseY);
  line(mouseX, mouseY+8, mouseX, mouseY-8);
}