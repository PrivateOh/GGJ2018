private void defineLevel3() {
  this.player = new Player(caseIntoCoord(AD, 13), 1, 20);

  //Enemy 1
  ArrayList<Coord> coordsEnemy = new ArrayList<Coord>();
  coordsEnemy.add(caseIntoCoord(X, 15));
  coordsEnemy.add(caseIntoCoord(X, 8));
  coordsEnemy.add(caseIntoCoord(P, 8));
  coordsEnemy.add(caseIntoCoord(P, 16));
  coordsEnemy.add(caseIntoCoord(W, 16));

  ArrayList<Integer> rotationsEnemy = new ArrayList<Integer>();
  rotationsEnemy.add(0);
  rotationsEnemy.add(270);
  rotationsEnemy.add(180);
  rotationsEnemy.add(90);
  rotationsEnemy.add(270);
  this.m_ennemys.add(new Ennemy(coordsEnemy.get(0), 1, 20, 100, 0, coordsEnemy, rotationsEnemy, "/data/textures/enemy.png",true));

  //Enemy 2

  coordsEnemy  = new ArrayList<Coord>();
  coordsEnemy.add(caseIntoCoord(S, 10));
  coordsEnemy.add(caseIntoCoord(V, 10));
  coordsEnemy.add(caseIntoCoord(V, 14));
  coordsEnemy.add(caseIntoCoord(S, 14));
  coordsEnemy.add(caseIntoCoord(R, 11));

  rotationsEnemy  = new ArrayList<Integer>();
  rotationsEnemy.add(90);
  rotationsEnemy.add(180);
  rotationsEnemy.add(270);
  rotationsEnemy.add(0);
  rotationsEnemy.add(180);
  this.m_ennemys.add(new Ennemy(coordsEnemy.get(0), 1, 20, 100, 0, coordsEnemy, rotationsEnemy, "/data/textures/enemy.png",true));

  //Wall
  //Horizontaux
  this.m_walls.add(new Wall(caseIntoCoord(S, 2), caseIntoCoord(V, 3)));
  this.m_walls.add(new Wall(caseIntoCoord(P, 7), caseIntoCoord(T, 8)));
  this.m_walls.add(new Wall(caseIntoCoord(U, 7), caseIntoCoord(Y, 8)));
  this.m_walls.add(new Wall(caseIntoCoord(K, 9), caseIntoCoord(O, 10)));
  this.m_walls.add(new Wall(caseIntoCoord(Z, 9), caseIntoCoord(AF, 10)));
  this.m_walls.add(new Wall(caseIntoCoord(K, 13), caseIntoCoord(O, 14)));
  this.m_walls.add(new Wall(caseIntoCoord(P, 17), caseIntoCoord(AF, 18)));

  //Verticaux
  this.m_walls.add(new Wall(caseIntoCoord(R, 2), caseIntoCoord(S, 7)));
  this.m_walls.add(new Wall(caseIntoCoord(V, 2), caseIntoCoord(W, 7)));
  this.m_walls.add(new Wall(caseIntoCoord(O, 7), caseIntoCoord(P, 11)));
  this.m_walls.add(new Wall(caseIntoCoord(J, 9), caseIntoCoord(K, 14)));
  this.m_walls.add(new Wall(caseIntoCoord(O, 12), caseIntoCoord(P, 18)));
  this.m_walls.add(new Wall(caseIntoCoord(Y, 7), caseIntoCoord(Z, 13)));
  this.m_walls.add(new Wall(caseIntoCoord(Y, 14), caseIntoCoord(Z, 17)));
  this.m_walls.add(new Wall(caseIntoCoord(AF, 9), caseIntoCoord(AG, 18)));

  //Obstacles
  this.m_obstacles.add(new Obstacle("table", caseIntoCoord(T, 12), 0));
  this.m_obstacles.add(new Obstacle("box", caseIntoCoord(W, 12), 0));
  this.m_obstacles.add(new Obstacle("chest", caseIntoCoord(T, 15), 0));

  this.m_obstacles.add(new Obstacle ("door", caseIntoCoord(T, 7), 0));
  this.m_obstacles.add(new Interrupteur(caseIntoCoord(J+0.6, 11), 90, m_obstacles.get(m_obstacles.size()-1)));

  //Fin de niveau
  addEnd(T, 4);

  for (Obstacle obs : m_obstacles) {
    obs.drawObstacle();
  }
}