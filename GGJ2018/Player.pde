class Player  extends Entity { //<>// //<>//

  private Boolean isAlive;
  private FCircle player;
  private Coord force;

  public Player(Coord coord, int id, float size) {
    super(coord, id);
    this.isAlive = true;
    this.force = new Coord(0, 0);
    this.player = new FCircle(size);
    this.player.setPosition(this.getCoord().getX(), this.getCoord().getY());
    //this.player.setStatic(true);
    m_world.add(this.player);
  }

  public Boolean getIsAlive () {
    return this.isAlive;
  }

  public void setIsAlive (Boolean a) {
    this.isAlive = a;
  }

  public void updateForce () {
    player.setVelocity(this.force.getX(), this.force.getY());
  }

  public void setForceX (float x) {
    this.force.setX(x);
  }

  public void setForceY (float y) {
    this.force.setY(y);
  }
}