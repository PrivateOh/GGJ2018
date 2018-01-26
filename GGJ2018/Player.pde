class Player  extends Entity {

  private Boolean isAlive;
  public Player(Coord coord, int id) {
    super (coord, id);
    this.isAlive = true;
  }

  public Boolean getIsAlive () {
    return this.isAlive;
  }

  public void setIsAlive (Boolean a) {
    this.isAlive = a;
  }
}