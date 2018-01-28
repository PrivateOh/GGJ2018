public int resoX ;
public int resoY ;
public int coeffX, coeffY;
int A=1, B=2, C=3, D=4, E=5, F=6, G=7, H=8, I=9, J=10, K=11, L=12, M=13, N=14, O=15, P=16, Q=17, R=18, S=19, T=20, U=21, V=22, W=23, X=24, Y=25, Z=26, AA=27, AB=28, AC=29, AD=30, AE=31, AF=32, AG=33, AH=34, AI=35, AJ=36, AK=37, AL=38, AM=39, AN=40, AO=41, AP=42, AQ=43, AR=44, AS=45, AT=46, AU=47, AV=48;
public void createLevel(int number) {
  resoX = width;
  resoY = height;
  coeffX = resoX/48;
  coeffY = resoY/27;
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
  coords.add(caseIntoCoord(AF, 20));


  ArrayList<Integer> rotations = new ArrayList<Integer>();
  rotations.add(0);
<<<<<<< HEAD
  rotations.add(270);
  rotations.add(180);
  rotations.add(270);
  rotations.add(90);
  this.m_ennemys.add(new Ennemy(coords.get(0), 1, 20, 200,0, coords, rotations, "/data/textures/enemy20x20.png"));

=======
  //this.m_ennemys.add(new Ennemy(coords.get(0), 1, 20, 200, 0, coords, rotations));
>>>>>>> 1d24166d2e4ef10c7aedd7b6055dc8422f7029b3
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
  this.m_obstacles.add(new Obstacle("tonneau", caseIntoCoord(K, 5), 180));
  
  this.m_obstacles.add(new Obstacle ("door", caseIntoCoord(V, 8), 90));
  this.m_obstacles.add(new Interrupteur(caseIntoCoord(V-0.6, 6), 90, m_obstacles.get(m_obstacles.size()-1)));




  //Fin de niveau
  endLevel = new FPoly();
  Coord start = caseIntoCoord(AF-0.5, 2-0.5);
  Coord end = caseIntoCoord(AG-0.5, 3-0.5);
  endLevel.vertex(start.x, start.y);
  endLevel.vertex(start.x, end.y);
  endLevel.vertex(end.x, end.y);
  endLevel.vertex(end.x, start.y);
  endLevel.vertex(start.x, start.y);
  endLevel.setGrabbable(false);
  endLevel.setStatic(true);
  endLevel.setStrokeColor(color(255, 23, 23));
  endLevel.setFillColor(color(color(255, 23, 23)));
  endLevel.setRestitution(0);
  m_world.add(endLevel);
  for (Obstacle obs : m_obstacles) {
    obs.drawObstacle();
  }
}
private void defineLevel2() {
  this.player = new Player(caseIntoCoord(C, 4), 1, 20);

  //Wall
  //Horizontaux
  this.m_walls.add(new Wall(caseIntoCoord(B, 2), caseIntoCoord(AP, 3)));
  this.m_walls.add(new Wall(caseIntoCoord(B, 18), caseIntoCoord(AP, 19)));
  this.m_walls.add(new Wall(caseIntoCoord(C, 10), caseIntoCoord(AJ, 11)));
  this.m_walls.add(new Wall(caseIntoCoord(AL, 10), caseIntoCoord(AO, 11)));
  this.m_walls.add(new Wall(caseIntoCoord(V, 6), caseIntoCoord(AO, 7)));
  //Verticaux
  this.m_walls.add(new Wall(caseIntoCoord(B, 3), caseIntoCoord(C, 18)));
  this.m_walls.add(new Wall(caseIntoCoord(AO, 3), caseIntoCoord(AP, 18)));
  this.m_walls.add(new Wall(caseIntoCoord(AG, 11), caseIntoCoord(AH, 16)));

  //Fin de niveau
  endLevel = new FPoly();
  Coord start = caseIntoCoord(B-0.5, 14);
  Coord end = caseIntoCoord(C-0.5, 15);
  endLevel.vertex(start.x, start.y);
  endLevel.vertex(start.x, end.y);
  endLevel.vertex(end.x, end.y);
  endLevel.vertex(end.x, start.y);
  endLevel.vertex(start.x, start.y);
  endLevel.setGrabbable(false);
  endLevel.setStatic(true);
  endLevel.setStrokeColor(color(255, 23, 23));
  endLevel.setFillColor(color(color(255, 23, 23)));
  endLevel.setRestitution(0);
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