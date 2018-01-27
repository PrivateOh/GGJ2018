class Player  extends Entity { //<>// //<>//

  private Boolean isAlive;
  private FCircle player;
  private Coord force;
  public Player(Coord coord, int id, float size) {
    super (coord, id);
    this.isAlive = true;
    this.force = new Coord(0, 0);
    player = new FCircle(size);
    player.setPosition(this.getCoord().getX(), this.getCoord().getY());
    m_world.add(player);
  }

  public Boolean getIsAlive () {
    return this.isAlive;
  }

  public void setIsAlive (Boolean a) {
    this.isAlive = a;
  }

  public void updateForce () {
    player.addForce(this.force.getX(), this.force.getY());
  }

  public void setForceX (float x) {
    this.force.setX(x);
  }

  public void setForceY (float y) {
    this.force.setY(y);
  }
}