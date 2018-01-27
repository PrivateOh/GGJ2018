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
  this.player = new Player(new Coord(width/2, height/2), 1, 60);
  this.m_ennemys.add(new Ennemy(new Coord(width/2, height/1.2), 1, 60, 200));
  this.m_ennemys.add(new Ennemy(new Coord(width/5, height/1.2), 1, 60, 200));
}
private void defineLevel2() {
  this.player = new Player(new Coord(width/3, height/5), 1, 40);
}