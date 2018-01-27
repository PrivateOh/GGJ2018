public int resoX ;
public int resoY ;
public int coeffX, coeffY;
int
  A=1, B=2, C=3, D=4, E=5, F=6, G=7, H=8, I=9, J=10, K=11, L=12, M=13, N=14, O=15, P=16, Q=17, R=18, S=19, T=20, U=21, V=22, W=23, X=24, Y=25, Z=26, AA=27, AB=28, AC=29, AD=30, AE=31, AF=32, AG=33, AH=34, AI=35, AJ=36, AK=37, AL=38, AM=39, AN=40, AO=41, AP=42, AQ=43, AR=44, AS=45, AT=46, AU=47, AV=48;
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
  this.player = new Player(caseIntoCoord(C, 4), 1, 20);

  //Enemy
  ArrayList<Coord> coords = new ArrayList<Coord>();
  coords.add(caseIntoCoord(AF, 20));
  coords.add(caseIntoCoord(AF, 15));
  coords.add(caseIntoCoord(AA, 15));
  coords.add(caseIntoCoord(AA, 20));
  coords.add(caseIntoCoord(X, 20));
  
  ArrayList<Integer> rotations = new ArrayList<Integer>();
  rotations.add(0);
  rotations.add(90);
  rotations.add(180);
  rotations.add(90);
  rotations.add(270);
  this.m_ennemys.add(new Ennemy(coords.get(0), 1, 20, 200,0, coords, rotations));

  //Wall
  //Horizontaux
  this.m_walls.add(new Wall(caseIntoCoord(B, 2), caseIntoCoord(M, 3)));
  this.m_walls.add(new Wall(caseIntoCoord(B, 7), caseIntoCoord(I, 8)));
  this.m_walls.add(new Wall(caseIntoCoord(J, 7), caseIntoCoord(M, 8)));
  this.m_walls.add(new Wall(caseIntoCoord(L, 6), caseIntoCoord(S, 7)));
  this.m_walls.add(new Wall(caseIntoCoord(J, 12), caseIntoCoord(O, 13)));
  this.m_walls.add(new Wall(caseIntoCoord(L, 11), caseIntoCoord(O, 12)));
  this.m_walls.add(new Wall(caseIntoCoord(P, 11), caseIntoCoord(S, 13)));
  this.m_walls.add(new Wall(caseIntoCoord(S, 12), caseIntoCoord(V, 13)));
  this.m_walls.add(new Wall(caseIntoCoord(H, 14), caseIntoCoord(T, 15)));
  this.m_walls.add(new Wall(caseIntoCoord(U, 13), caseIntoCoord(AF, 14)));
  this.m_walls.add(new Wall(caseIntoCoord(S, 23), caseIntoCoord(AI, 24)));
  this.m_walls.add(new Wall(caseIntoCoord(AG, 13), caseIntoCoord(AI, 14)));
  this.m_walls.add(new Wall(caseIntoCoord(AC, 8), caseIntoCoord(AF, 9)));
  this.m_walls.add(new Wall(caseIntoCoord(AG, 8), caseIntoCoord(AJ, 9)));
  this.m_walls.add(new Wall(caseIntoCoord(AC, 2), caseIntoCoord(AJ, 3)));
  //Verticaux
  this.m_walls.add(new Wall(caseIntoCoord(B, 3), caseIntoCoord(C, 7)));
  this.m_walls.add(new Wall(caseIntoCoord(H, 8), caseIntoCoord(I, 14)));
  this.m_walls.add(new Wall(caseIntoCoord(J, 8), caseIntoCoord(K, 12)));
  this.m_walls.add(new Wall(caseIntoCoord(L, 3), caseIntoCoord(M, 6)));
  this.m_walls.add(new Wall(caseIntoCoord(L, 8), caseIntoCoord(M, 11)));
  this.m_walls.add(new Wall(caseIntoCoord(R, 7), caseIntoCoord(S, 11)));
  this.m_walls.add(new Wall(caseIntoCoord(S, 15), caseIntoCoord(T, 23)));
  this.m_walls.add(new Wall(caseIntoCoord(W, 14), caseIntoCoord(X, 18)));
  this.m_walls.add(new Wall(caseIntoCoord(AC, 17), caseIntoCoord(AD, 23)));
  this.m_walls.add(new Wall(caseIntoCoord(AH, 14), caseIntoCoord(AI, 23)));
  this.m_walls.add(new Wall(caseIntoCoord(AE, 9), caseIntoCoord(AF, 13)));
  this.m_walls.add(new Wall(caseIntoCoord(AG, 9), caseIntoCoord(AH, 13)));
  this.m_walls.add(new Wall(caseIntoCoord(AC, 3), caseIntoCoord(AD, 8)));
  this.m_walls.add(new Wall(caseIntoCoord(AI, 3), caseIntoCoord(AJ, 8)));

  //Obstacles
  this.m_obstacles.add(new Obstacle("desk", caseIntoCoord(G, 3+0.5), 0));
  this.m_obstacles.add(new Obstacle("sink", caseIntoCoord(K+0.5, 5), 90));
  this.m_obstacles.add(new Obstacle("desk", caseIntoCoord(V+0.5, 16), 90));
  this.m_obstacles.add(new Obstacle("desk", caseIntoCoord(V, 22+0.5), 0));
  this.m_obstacles.add(new Obstacle("sink", caseIntoCoord(AC+0.5, 16+0.5), 0));
  this.m_obstacles.add(new Obstacle("desk", caseIntoCoord(AD+0.5, 20), 270));
  this.m_obstacles.add(new Obstacle("door", caseIntoCoord(R, 13+0.5), 90));
  this.m_obstacles.add(new Interrupteur(caseIntoCoord(O+0.5, 7), 0, m_obstacles.get(m_obstacles.size()-1)));
  this.m_obstacles.add(new Obstacle ("door", caseIntoCoord(AF+0.5, 10), 0));
  this.m_obstacles.add(new Interrupteur(caseIntoCoord(AF, 23), 180, m_obstacles.get(m_obstacles.size()-1)));

  //Fin de niveau
  endLevel = new FPoly();
  Coord start = caseIntoCoord(AF, 2);
  Coord end = caseIntoCoord(AG, 3);
  endLevel.vertex(start.x, start.y);
  endLevel.vertex(start.x, end.y);
  endLevel.vertex(end.x, end.y);
  endLevel.vertex(end.x, start.y);
  endLevel.vertex(start.x, start.y);
  endLevel.setGrabbable(false);
  endLevel.setStatic(true);
  endLevel.setStrokeColor(color(255,23,23));
  endLevel.setFillColor(color(color(255,23,23)));
  endLevel.setRestitution(0);
  m_world.add(endLevel);
  for (Obstacle obs : m_obstacles) {
    obs.drawObstacle();
  }
}
private void defineLevel2() {
  this.player = new Player(new Coord(width/3, height/5), 1, 40);
}

private Coord caseIntoCoord (float lettre, float number) {
  Coord result;
  result = new Coord((lettre-1)*coeffX, (number-1)*coeffY);
  return result;
}