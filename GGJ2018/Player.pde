class Player  extends Entity { //<>// //<>// //<>// //<>// //<>//

  private Boolean isAlive;
  private FCircle player;
  private Coord force;
  public Player(Coord coord, int id, float size) {
    super(coord, id);
    this.isAlive = true;

    this.force = new Coord(0, 0);
    this.player = new FCircle(size);
    this.player.setGrabbable(false);
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
    if (b != null) {
    }
  }

  public void draw () {
    noFill();
    stroke(25);
    ellipse(this.player.getX(), this.player.getY(), 240, 240);
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

  public void rushTo (Coord coord) {
    while ( coord.getX() != this.player.getX() && coord.getY() != this.player.getY()) {
      if ( coord.getX()-this.player.getX() > 0) {
        this.setForceX(1500);
      } else {
        if (coord.getX()-this.player.getX() < 0) {
          this.setForceX(-1500);
        } else
          this.setForceX(0);
      }
      if ( coord.getY()-this.player.getY() > 0) {
        this.setForceY(1500);
      } else {
        if (coord.getY()-this.player.getY() < 0) {
          this.setForceY(-1500);
        } else
          this.setForceY(0);
      }
    }
  }
}