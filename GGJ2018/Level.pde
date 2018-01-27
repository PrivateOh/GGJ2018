public int resoX ;
public int resoY ;
public int coeffX,coeffY;
public void createLevel(int number) {
  resoX = width;
  resoY = height;
  coeffX = resoX/54;
  coeffY = resoY/38;
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
  this.player = new Player(new Coord(width/2, height/2), 1, 20);

  //Enemy
  this.m_ennemys.add(new Ennemy(new Coord(38*coeffX,18*coeffY), 1, 20, 200,90));

  //Wall
  //Horizontaux
  this.m_walls.add(new Wall(new Coord(0*coeffX,0*coeffY),new Coord(20*coeffX,1*coeffY)));
  this.m_walls.add(new Wall(new Coord(0*coeffX,14*coeffY),new Coord(14*coeffX,15*coeffY)));
  this.m_walls.add(new Wall(new Coord(16*coeffX,14*coeffY),new Coord(44*coeffX,15*coeffY)));
  this.m_walls.add(new Wall(new Coord(6*coeffX,28*coeffY),new Coord(36*coeffX,29*coeffY)));
  this.m_walls.add(new Wall(new Coord(38*coeffX,28*coeffY),new Coord(52*coeffX,29*coeffY)));
  this.m_walls.add(new Wall(new Coord(34*coeffX,36*coeffY),new Coord(52*coeffX,37*coeffY)));
  this.m_walls.add(new Wall(new Coord(32*coeffX,20*coeffY),new Coord(34*coeffX,21*coeffY)));
  //Verticaux
  this.m_walls.add(new Wall(new Coord(0*coeffX,0*coeffY),new Coord(1*coeffX,14*coeffY)));
  this.m_walls.add(new Wall(new Coord(19*coeffX,0*coeffY),new Coord(20*coeffX,22*coeffY)));
  this.m_walls.add(new Wall(new Coord(6*coeffX,14*coeffY),new Coord(7*coeffX,28*coeffY)));
  this.m_walls.add(new Wall(new Coord(44*coeffX,14*coeffY),new Coord(45*coeffX,28*coeffY)));
  this.m_walls.add(new Wall(new Coord(34*coeffX,20*coeffY),new Coord(35*coeffX,37*coeffY)));
  this.m_walls.add(new Wall(new Coord(52*coeffX,28*coeffY),new Coord(53*coeffX,37*coeffY)));
  //Obstacles
  this.m_obstacles.add(new Obstacle("desk",new Coord(31*coeffX+coeffX/2,20*coeffY+coeffY/2),90));
  for (Obstacle obs : m_obstacles) {
    obs.drawObstacle();
  }
}
private void defineLevel2() {
  this.player = new Player(new Coord(width/3, height/5), 1, 40);
}