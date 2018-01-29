class Interrupteur extends Obstacle {
  private Obstacle doorLinked;
  private boolean isOpen;
  public Interrupteur( Coord position, float rotation, Obstacle door) {
    super("interrupteur", position, rotation);
    this.doorLinked = door;
    isOpen = false;
  }

  public void openDoor () {
    if (!isOpen) {
      doorOpen.play();
      doorLinked.setRotation(doorLinked.getRotation()+90);
      if (doorLinked.getRotation() == 0 || doorLinked.getRotation() == 180) {
        doorLinked.setCoord(new Coord(doorLinked.getCoord().getX(), doorLinked.getCoord().getY()+(0.5*coeffY)));
      } else {
        doorLinked.setCoord(new Coord(doorLinked.getCoord().getX()+(0.5*coeffX), doorLinked.getCoord().getY()));
      }
      doorLinked.drawObstacle();
      isOpen = true;
    }
  }
}