class Player  extends Entity { //<>// //<>// //<>// //<>// //<>// //<>//

  private Boolean isAlive;
  private FCircle player;
  private Coord force;
  private int rushRange = 350;
  private int cptChangeDirection = 0;
  private Coord coordToRush;
  private boolean possed = false;
  private boolean isRushing = false;
  public Player(Coord coord, int id, float size) {
    super(coord, id);
    this.isAlive = true;

    this.force = new Coord(0, 0);
    this.coordToRush = new Coord (0, 0);
    this.player = new FCircle(size);
    this.player.setGrabbable(false);
    this.player.setPosition(this.getCoord().getX(), this.getCoord().getY());
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
      for (Obstacle obs : m_obstacles) {
        if (obs.getObstacle().equals(b)) {
          println(obs.getType());
        }
      }
    }
  }

  public void draw () {
    if (this.possed == true) {
      player.setDrawable(false);
    } else {
      player.setDrawable(true);
    }
    noFill();
    stroke(25);
    ellipse(this.player.getX(), this.player.getY(), rushRange, rushRange);
    if (this.isRushing)
      rushing();
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
    this.isRushing = true;
    this.coordToRush.setX(coord.getX());
    this.coordToRush.setY(coord.getY());
  }

  public void rushing () {
    if ( this.coordToRush.getX()-this.player.getX() < -10 ) {
      if (this.force.getX() != -1300)
        cptChangeDirection++;
      this.setForceX(-1300);
    } else {
      if (this.coordToRush.getX()-this.player.getX() > 10) {
        if (this.force.getX() != 1300)
          cptChangeDirection++;
        this.setForceX(1300);
      } else
        this.setForceX(0);
    }
    if ( this.coordToRush.getY()-this.player.getY() < -10) {
      if (this.force.getY() != -1300)
        cptChangeDirection++;
      this.setForceY(-1300);
    } else {
      if (this.coordToRush.getY()-this.player.getY() > 10) {
        if (this.force.getY() != 1300)
          cptChangeDirection++;
        this.setForceY(1300);
      } else
        this.setForceY(0);
    }
    this.updateForce();
    if ((this.force.getX() == 0 && this.force.getY() == 0) || this.cptChangeDirection > 4)
    {
      this.setForceY(0);
      this.setForceX(0);
      this.updateForce();
      this.isRushing = false;
      this.possed = !this.possed;
      this.cptChangeDirection = 0;
    }
  }

  void mousePressed() {
    if (this.possed == false) {
      if (abs(sqrt(pow(mouseX-this.player.getX(), 2)+pow(mouseY-this.player.getY(), 2))) < rushRange/2) {
        this.rushTo(new Coord(mouseX, mouseY));
      }
    } else
    {
      if (abs(sqrt(pow(mouseX-this.player.getX(), 2)+pow(mouseY-this.player.getY(), 2))) < rushRange/2) {
        this.rushTo(new Coord(mouseX, mouseY));
      }
    }
  }
}