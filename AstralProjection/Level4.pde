private void defineLevel4() {
  this.player = new Player(caseIntoCoord(X, 13), 1, 20);

  //Enemy 1
  ArrayList<Coord> coordsEnemy = new ArrayList<Coord>();
  coordsEnemy.add(caseIntoCoord(U, 15));

  ArrayList<Integer> rotationsEnemy = new ArrayList<Integer>();
  this.m_ennemys.add(new Ennemy(coordsEnemy.get(0), 1, 20, 100, 0, coordsEnemy, rotationsEnemy, "/data/textures/enemy.png", false));
  //Enemy 1
  coordsEnemy = new ArrayList<Coord>();
  coordsEnemy.add(caseIntoCoord(U, 11));

  rotationsEnemy = new ArrayList<Integer>();
  this.m_ennemys.add(new Ennemy(coordsEnemy.get(0), 1, 20, 100, 180, coordsEnemy, rotationsEnemy, "/data/textures/enemy.png", false));


  //Wall
  //Horizontaux
  this.m_walls.add(new Wall(caseIntoCoord(W, 1), caseIntoCoord(AD, 2)));
  this.m_walls.add(new Wall(caseIntoCoord(W, 8), caseIntoCoord(Y, 9)));
  this.m_walls.add(new Wall(caseIntoCoord(AB, 8), caseIntoCoord(AD, 9)));
  this.m_walls.add(new Wall(caseIntoCoord(U, 10), caseIntoCoord(V, 11)));
  this.m_walls.add(new Wall(caseIntoCoord(R, 12), caseIntoCoord(T, 13)));
  this.m_walls.add(new Wall(caseIntoCoord(R, 14), caseIntoCoord(T, 15)));
  this.m_walls.add(new Wall(caseIntoCoord(U, 16), caseIntoCoord(V, 17)));
  this.m_walls.add(new Wall(caseIntoCoord(W, 12), caseIntoCoord(Y, 13)));
  this.m_walls.add(new Wall(caseIntoCoord(AB, 12), caseIntoCoord(AK, 13)));
  this.m_walls.add(new Wall(caseIntoCoord(AL, 7), caseIntoCoord(AS, 8)));
  this.m_walls.add(new Wall(caseIntoCoord(AT, 12), caseIntoCoord(AV, 13)));
  this.m_walls.add(new Wall(caseIntoCoord(AT, 14), caseIntoCoord(AV, 15)));
  this.m_walls.add(new Wall(caseIntoCoord(AL, 19), caseIntoCoord(AS, 20)));
  this.m_walls.add(new Wall(caseIntoCoord(AH, 14), caseIntoCoord(AK, 15)));
  this.m_walls.add(new Wall(caseIntoCoord(W, 14), caseIntoCoord(AE, 15)));
  this.m_walls.add(new Wall(caseIntoCoord(I, 17), caseIntoCoord(AE, 18)));
  this.m_walls.add(new Wall(caseIntoCoord(I, 20), caseIntoCoord(AG, 21)));

  //Verticaux
  this.m_walls.add(new Wall(caseIntoCoord(V, 1), caseIntoCoord(W, 9)));
  this.m_walls.add(new Wall(caseIntoCoord(AD, 1), caseIntoCoord(AE, 9)));
  this.m_walls.add(new Wall(caseIntoCoord(Y, 8), caseIntoCoord(Z, 13)));
  this.m_walls.add(new Wall(caseIntoCoord(AA, 8), caseIntoCoord(AB, 13)));
  this.m_walls.add(new Wall(caseIntoCoord(V, 10), caseIntoCoord(W, 13)));
  this.m_walls.add(new Wall(caseIntoCoord(V, 14), caseIntoCoord(W, 17)));
  this.m_walls.add(new Wall(caseIntoCoord(T, 14), caseIntoCoord(U, 17)));  
  this.m_walls.add(new Wall(caseIntoCoord(T, 10), caseIntoCoord(U, 13)));
  this.m_walls.add(new Wall(caseIntoCoord(Q, 12), caseIntoCoord(R, 15)));
  this.m_walls.add(new Wall(caseIntoCoord(AK, 7), caseIntoCoord(AL, 13)));
  this.m_walls.add(new Wall(caseIntoCoord(AK, 14), caseIntoCoord(AL, 20)));
  this.m_walls.add(new Wall(caseIntoCoord(AS, 7), caseIntoCoord(AT, 13)));
  this.m_walls.add(new Wall(caseIntoCoord(AS, 14), caseIntoCoord(AT, 20)));
  this.m_walls.add(new Wall(caseIntoCoord(AV, 12), caseIntoCoord(AW, 15)));
  this.m_walls.add(new Wall(caseIntoCoord(AE, 14), caseIntoCoord(AF, 18)));
  this.m_walls.add(new Wall(caseIntoCoord(AG, 14), caseIntoCoord(AH, 21)));
  this.m_walls.add(new Wall(caseIntoCoord(H, 17), caseIntoCoord(I, 21)));

  //Obstacles
  this.m_obstacles.add(new Obstacle("table", caseIntoCoord(A,1), 90));

  this.m_obstacles.add(new Obstacle ("door", caseIntoCoord(U, 12), 90));
  this.m_obstacles.add(new Interrupteur(caseIntoCoord(Z, 1+0.6), 0, m_obstacles.get(m_obstacles.size()-1)));
  this.m_obstacles.add(new Obstacle ("door", caseIntoCoord(U, 14), 90));
  this.m_obstacles.add(new Interrupteur(caseIntoCoord(H+0.6, 19), 90, m_obstacles.get(m_obstacles.size()-1)));
  this.m_obstacles.add(new Obstacle ("door", caseIntoCoord(S, 13), 90));
  this.m_obstacles.add(new Interrupteur(caseIntoCoord(AV-0.6, 13), 90, m_obstacles.get(m_obstacles.size()-1)));

  //Fin de niveau
  addEnd(R, 13);

  for (Obstacle obs : m_obstacles) {
    obs.drawObstacle();
  }
}