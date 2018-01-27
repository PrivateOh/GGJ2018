class Player  extends Entity { //<>// //<>// //<>// //<>// //<>//

  private Boolean isAlive;
  private FCircle player;
  private Coord force;
  private FBody listDetected[];
  public Player(Coord coord, int id, float size) {
    super(coord, id);
    this.isAlive = true;

    this.force = new Coord(0, 0);
    this.player = new FCircle(size);
    this.listDetected = new FBody[3];
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

  public void detectObstacle () {
    FRaycastResult result = new FRaycastResult();
    FBody b = m_world.raycastOne(this.player.getX(), this.player.getY(), mouseX, mouseY, result, false);
    stroke(120);
    line(this.player.getX(), this.player.getY(), mouseX, mouseY);
    if (b != null) {
      b.setFill(120, 255, 0);
    }
  }

  public void keyPressed(int keyCode) {
    switch(keyCode) {
    case LEFT: //GAUCHE

      this.setForceX(-500);
      break;
    case RIGHT://DROITE
      this.setForceX(500);
      break;
    case UP: //HAUT
      this.setForceY(-500);
      break;
    case DOWN: //BAS
      this.setForceY(500);
      break;
    }
    this.updateForce();
  }

  public void keyReleased(int keyCode) {
    switch(keyCode) {
    case LEFT: //GAUCHE
      this.setForceX(0);
      break;
    case RIGHT://DROITE
      this.setForceX(0);
      break;
    case UP: //HAUT
      this.setForceY(0);
      break;
    case DOWN: //BAS
      this.setForceY(0);
      break;
    }
    this.updateForce();
  }
}