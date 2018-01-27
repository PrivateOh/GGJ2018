private void defineLevel1() {
 // this.player = new Player(new Coord(width/2, height/2), 1, 60);
  new Ennemy(new Coord(width/2, height/2), 1, 60);
}
private void defineLevel2() {
  this.player = new Player(new Coord(width/3, height/5), 1, 40);
}


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