public void createLevel(int number) {
  switch (number) {
  case 1:
    defineLevel1();
    break;
  case 2:
    defineLevel2();
    break;
  }
}

private void defineLevel1() {
  //Player
  this.player = new Player(new Coord(width/2, height/2), 1, 20);

  //Enemy
  this.m_ennemys.add(new Ennemy(new Coord(width/2, height/1.2), 1, 20, 200));
  this.m_ennemys.add(new Ennemy(new Coord(width/5, height/1.2), 1, 20, 200));

  //Wall
  this.m_walls.add(new Wall(new Coord(400, 400), new Coord(500, 500)));
  this.m_walls.add(new Wall(new Coord(600, 400), new Coord(500, 500)));
  this.m_walls.add(new Wall(new Coord(700, 400), new Coord(500, 500)));


  //Obstacles
  this.m_obstacles.add(new Obstacle("door", new Coord(150, 150), 45));
  this.m_obstacles.add(new Obstacle("door", new Coord(210, 100), 0));
  this.m_obstacles.add(new Obstacle("desk", new Coord(100, 100), 45));
  this.m_obstacles.add(new Obstacle("sink", new Coord(300, 300), 45));
  this.m_obstacles.add(new Obstacle("toilet", new Coord(400, 300), 90));

  for (Obstacle obs : m_obstacles) {
    obs.drawObstacle();
  }
}
private void defineLevel2() {
  this.player = new Player(new Coord(width/3, height/5), 1, 40);
}