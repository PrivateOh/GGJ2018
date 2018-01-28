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
  this.m_ennemys.add(new Ennemy(coordsEnemy.get(0), 1, 20, 100, 0, coordsEnemy, rotationsEnemy, "/data/textures/enemy.png",true));

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
  this.m_ennemys.add(new Ennemy(coordsEnemy.get(0), 1, 20, 100, 0, coordsEnemy, rotationsEnemy, "/data/textures/enemy.png",true));

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
  this.m_ennemys.add(new Ennemy(coordsEnemy.get(0), 1, 20, 100, 0, coordsEnemy, rotationsEnemy, "/data/textures/enemy.png",true));

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
  addEnd(C, 14);


  for (Obstacle obs : m_obstacles) {
    obs.drawObstacle();
  }
}