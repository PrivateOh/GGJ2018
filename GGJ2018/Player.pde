class Player  extends Entity { //<>// //<>// //<>// //<>//

  private boolean isAlive = true;
  private FCircle player;
  private float speed = 180;
  private Coord force;
  private final int rushRange = 350;
  private int cptChangeDirection = 0;
  private Coord coordToRush;
  private boolean possed = false;
  private boolean isRushing = false;
  private boolean isObject = false;
  private FBody obstaclePrec = null;

  public Player(Coord coord, int id, float size) {
    super(coord, id, false);
    this.force = new Coord(0, 0);
    this.coordToRush = new Coord (0, 0);
    this.player = new FCircle(size);
    this.player.setGrabbable(false);
    this.player.setRestitution(0);
    this.player.setPosition(this.getCoord().getX(), this.getCoord().getY());
    this.player.setGroupIndex(0);
    m_world.add(this.player);
  }

  /*****************  Getters | Setters ***************/

  public boolean getIsAlive () {
    return this.isAlive;
  }

  public void setIsAlive (boolean a) {
    this.isAlive = a;
  }

  public void setForceX (float x) {
    this.force.setX(x);
  }

  public void setForceY (float y) {
    this.force.setY(y);
  }

  // Change velocity
  public void updateForce () {
    this.player.setVelocity(this.force.getX(), this.force.getY());
  }

  public boolean detectObstacle () {
    FBody fb = m_world.getBody(mouseX, mouseY);
    if (fb != null) {
      if (fb.getGroupIndex() != Obstacle.Id) return true;
    }
    FRaycastResult result = new FRaycastResult();

    FBody b = m_world.raycastOne(this.player.getX(), this.player.getY(), mouseX, mouseY, result, false);
    this.isObject = fb != null;

    if (fb != null && b != null && b.equals(fb)) {
      b = m_world.raycastOne(this.player.getX(), this.player.getY(), b.getX(), b.getY(), result, false);
    }
    return (m_world.getBody(mouseX, mouseY) != b);
  }

  public void draw () {
    if (this.possed && this.isRushing)
      player.setDrawable(true);
    else
      player.setDrawable(true);
    noFill();
    stroke(100);
    if (!this.possed) {
      ellipse(this.player.getX(), this.player.getY(), rushRange, rushRange);
    }

    if (this.isRushing) {
      rushing();
    }
  }

  public void keyPressed(int keyCode) {
    if (this.possed) return;
    switch(keyCode) {
    case LEFT: //GAUCHE
      this.setForceX(-speed);
      break;
    case RIGHT://DROITE
      this.setForceX(speed);
      break;
    case UP: //HAUT
      this.setForceY(-speed);
      break;
    case DOWN: //BAS
      this.setForceY(speed);
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
      this.cptChangeDirection = 0;
    }
  }

  void mousePressed() {
    detectObstacle();
    FBody fb = m_world.getBody(mouseX, mouseY);
    if (fb != null) {
      if (fb.getGroupIndex() != Obstacle.Id) return;
    }

    if ((abs(sqrt(pow(mouseX-this.player.getX(), 2)+pow(mouseY-this.player.getY(), 2))) < rushRange/2)) {
      if (this.possed) {
        this.possed = this.isObject;
        if (obstaclePrec !=null) {
          obstaclePrec.setSensor(false);
        }
        this.rushTo(new Coord(mouseX, mouseY));
      }
      if (!this.possed && this.isObject) {
        this.possed = this.isObject ;
        if (obstaclePrec !=null) {
          obstaclePrec.setSensor(false);
        }
        this.rushTo(new Coord(mouseX, mouseY));
      }
      if (this.isObject && fb != null) {
        fb.setSensor(true);
        obstaclePrec = fb;
      }
    }
  }
  FBody getObject () {
    return this.player;
  }
}