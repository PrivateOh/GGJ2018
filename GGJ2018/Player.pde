class Player  extends Entity {

  private Boolean isAlive;
  private FCircle player;
  public Player(Coord coord, int id, float size) {
    super(coord, id);
    this.isAlive = true;
    player = new FCircle(size);
    player.setPosition(this.getCoord().getX(),this.getCoord().getY());
    m_world.add(player);
  }

  public Boolean getIsAlive () {
    return this.isAlive;
  }

  public void setIsAlive (Boolean a) {
    this.isAlive = a;
  }
}