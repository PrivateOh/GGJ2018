public int resoX ;
public int resoY ;
public int coeffX, coeffY;
public PImage texture_end;
int A=1, B=2, C=3, D=4, E=5, F=6, G=7, H=8, I=9, J=10, K=11, L=12, M=13, N=14, O=15, P=16, Q=17, R=18, S=19, T=20, U=21, V=22, W=23, X=24, Y=25, Z=26, AA=27, AB=28, AC=29, AD=30, AE=31, AF=32, AG=33, AH=34, AI=35, AJ=36, AK=37, AL=38, AM=39, AN=40, AO=41, AP=42, AQ=43, AR=44, AS=45, AT=46, AU=47, AV=48;
public void createLevel(int number) {
  resoX = width;
  resoY = height;
  coeffX = resoX/48;
  coeffY = resoY/27;

  texture_end = loadImage("/data/textures/end.png");
  switch (number) {
  case 1:
    defineLevel1();
    break;
  case 2:
    defineLevel2();
    break;
  }
}
//71*56

private void defineLevel1() {
  //Player
  this.player = new Player(caseIntoCoord(G, 6.5), 1, 20);

  //Enemy
  ArrayList<Coord> coords = new ArrayList<Coord>();
  coords.add(caseIntoCoord(Y, 6));
  coords.add(caseIntoCoord(Y, 11));
  coords.add(caseIntoCoord(V, 11));
  coords.add(caseIntoCoord(V, 12));
  coords.add(caseIntoCoord(P, 12));
  coords.add(caseIntoCoord(P, 11));
  coords.add(caseIntoCoord(J, 11));
  coords.add(caseIntoCoord(J, 12));

  ArrayList<Integer> rotations = new ArrayList<Integer>();
  rotations.add(180);
  rotations.add(270);
  rotations.add(180);
  rotations.add(270);
  rotations.add(0);
  rotations.add(270);
  rotations.add(180);
  rotations.add(0);
  this.m_ennemys.add(new Ennemy(coords.get(0), 1, 20, 100, 0, coords, rotations, "/data/textures/enemy.png"));

  //Wall
  //Horizontaux
  this.m_walls.add(new Wall(caseIntoCoord(G, 4), caseIntoCoord(AA, 5)));
  this.m_walls.add(new Wall(caseIntoCoord(G, 14), caseIntoCoord(AA, 15)));
  this.m_walls.add(new Wall(caseIntoCoord(G, 9), caseIntoCoord(Y, 10)));

  //Verticaux
  this.m_walls.add(new Wall(caseIntoCoord(F, 4), caseIntoCoord(G, 15)));
  this.m_walls.add(new Wall(caseIntoCoord(AA, 4), caseIntoCoord(AB, 15)));
  this.m_walls.add(new Wall(caseIntoCoord(V, 5), caseIntoCoord(W, 8)));
  this.m_walls.add(new Wall(caseIntoCoord(M, 12), caseIntoCoord(N, 14)));
  this.m_walls.add(new Wall(caseIntoCoord(S, 10), caseIntoCoord(T, 12)));


  //Obstacles
  this.m_obstacles.add(new Obstacle("tonneau", caseIntoCoord(K, 5), 0));
  this.m_obstacles.add(new Obstacle("table", caseIntoCoord(K, 8), 0));
  this.m_obstacles.add(new Obstacle("box", caseIntoCoord(X, 8), 0));
  this.m_obstacles.add(new Obstacle("chest", caseIntoCoord(W, 12), 0));

  this.m_obstacles.add(new Obstacle ("door", caseIntoCoord(V, 8), 90));
  this.m_obstacles.add(new Interrupteur(caseIntoCoord(V-0.6, 6), 90, m_obstacles.get(m_obstacles.size()-1)));




  //Fin de niveau
  endLevel = new FBox(coeffX, coeffY);
  Coord start = caseIntoCoord(G, 12);
  endLevel.setPosition(start.x, start.y);
  endLevel.setGrabbable(false);
  endLevel.setStatic(true);
  endLevel.setRestitution(0);
  endLevel.attachImage(texture_end);
  m_world.add(endLevel);
  for (Obstacle obs : m_obstacles) {
    obs.drawObstacle();
  }
}
private void defineLevel2() {
  this.player = new Player(caseIntoCoord(C, 9), 1, 20);

  //Enemy 1
  ArrayList<Coord> coordsEnemy = new ArrayList<Coord>();
  coordsEnemy.add(caseIntoCoord(D, 6));
  coordsEnemy.add(caseIntoCoord(D, 4));
  coordsEnemy.add(caseIntoCoord(R, 4));
  coordsEnemy.add(caseIntoCoord(R, 8));
  coordsEnemy.add(caseIntoCoord(D, 8));

  ArrayList<Integer> rotationsEnemy = new ArrayList<Integer>();
  rotationsEnemy.add(0);
  rotationsEnemy.add(90);
  rotationsEnemy.add(180);
  rotationsEnemy.add(270);
  rotationsEnemy.add(90);
  this.m_ennemys.add(new Ennemy(coordsEnemy.get(0), 1, 20, 100, 0, coordsEnemy, rotationsEnemy, "/data/textures/enemy.png"));

  //Enemy 2

  coordsEnemy  = new ArrayList<Coord>();
  coordsEnemy.add(caseIntoCoord(AL, 4));
  coordsEnemy.add(caseIntoCoord(T, 4));
  coordsEnemy.add(caseIntoCoord(T, 8));
  coordsEnemy.add(caseIntoCoord(AL, 8));

  rotationsEnemy  = new ArrayList<Integer>();
  rotationsEnemy.add(270);
  rotationsEnemy.add(180);
  rotationsEnemy.add(90);
  rotationsEnemy.add(270);
  this.m_ennemys.add(new Ennemy(coordsEnemy.get(0), 1, 20, 100, 0, coordsEnemy, rotationsEnemy, "/data/textures/enemy.png"));

  //Enemy 3
  coordsEnemy = new ArrayList<Coord>();
  coordsEnemy.add(caseIntoCoord(AE, 12));
  coordsEnemy.add(caseIntoCoord(AE, 16));
  coordsEnemy.add(caseIntoCoord(W, 16));
  coordsEnemy.add(caseIntoCoord(W, 12));
  coordsEnemy.add(caseIntoCoord(N, 12));
  coordsEnemy.add(caseIntoCoord(N, 16));
  coordsEnemy.add(caseIntoCoord(D, 16));
  coordsEnemy.add(caseIntoCoord(D, 12));

  rotationsEnemy = new ArrayList<Integer>();
  rotationsEnemy.add(180);
  rotationsEnemy.add(270);
  rotationsEnemy.add(0);
  rotationsEnemy.add(270);
  rotationsEnemy.add(180);
  rotationsEnemy.add(270);
  rotationsEnemy.add(0);
  rotationsEnemy.add(180);
  this.m_ennemys.add(new Ennemy(coordsEnemy.get(0), 1, 20, 100, 0, coordsEnemy, rotationsEnemy, "/data/textures/enemy.png"));

  //Wall
  //Horizontaux
  this.m_walls.add(new Wall(caseIntoCoord(B, 2), caseIntoCoord(AP, 3)));
  this.m_walls.add(new Wall(caseIntoCoord(B, 18), caseIntoCoord(AP, 19)));
  this.m_walls.add(new Wall(caseIntoCoord(C, 10), caseIntoCoord(AJ, 11)));
  this.m_walls.add(new Wall(caseIntoCoord(AK, 10), caseIntoCoord(AO, 11)));
  this.m_walls.add(new Wall(caseIntoCoord(V, 6), caseIntoCoord(AO, 7)));
  this.m_walls.add(new Wall(caseIntoCoord(E, 6), caseIntoCoord(R, 7)));
  //Verticaux
  this.m_walls.add(new Wall(caseIntoCoord(B, 3), caseIntoCoord(C, 18)));
  this.m_walls.add(new Wall(caseIntoCoord(AO, 3), caseIntoCoord(AP, 18)));
  this.m_walls.add(new Wall(caseIntoCoord(AG, 11), caseIntoCoord(AH, 16)));

  //Obstacles
  this.m_obstacles.add(new Obstacle("table", caseIntoCoord(K, 3), 0));
  this.m_obstacles.add(new Obstacle("box", caseIntoCoord(Z, 5), 0));
  this.m_obstacles.add(new Obstacle("chest", caseIntoCoord(AH, 3), 0));
  this.m_obstacles.add(new Obstacle("box", caseIntoCoord(AC, 9), 0));
  this.m_obstacles.add(new Obstacle("table", caseIntoCoord(AK, 7), 0));

  this.m_obstacles.add(new Obstacle ("door", caseIntoCoord(AJ, 10), 0));
  this.m_obstacles.add(new Interrupteur(caseIntoCoord(AO-0.6, 4), 90, m_obstacles.get(m_obstacles.size()-1)));

  //Fin de niveau
  endLevel = new FBox(coeffX, coeffY);
  Coord start = caseIntoCoord(C, 14);
  endLevel.setPosition(start.x, start.y);
  endLevel.setGrabbable(false);
  endLevel.setStatic(true);
  endLevel.setRestitution(0);
  endLevel.attachImage(texture_end);
  m_world.add(endLevel);

  for (Obstacle obs : m_obstacles) {
    obs.drawObstacle();
  }
}

private Coord caseIntoCoord (float lettre, float number) {
  Coord result;
  result = new Coord((lettre-1)*coeffX, (number-1)*coeffY);
  return result;
}