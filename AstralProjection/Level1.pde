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
  this.m_ennemys.add(new Ennemy(coords.get(0), 1, 20, 100, 0, coords, rotations, "/data/textures/enemy.png",true));

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
  addEnd(G, 12);
  for (Obstacle obs : m_obstacles) {
    obs.drawObstacle();
  }
}