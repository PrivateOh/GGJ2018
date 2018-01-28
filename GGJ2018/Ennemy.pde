class Ennemy extends Entity {


  private int radarSens = 1;
  private float radarAngle ;
  private float detectRange;
  private FCircle m_ennemy;
  private int cptChangeDirection = 0;

  private Coord force;
  private Coord coordToRush;
  private boolean isRushing = false;
  private ArrayList<Coord> positions;
  private ArrayList<Integer> rotations;
  private int indexPos = 1;
  private int sensPos = 1;
  private PImage texture;
  private float speed = 100;

  public Ennemy(Coord coord, int id, float size, float detectRange, float rotate, ArrayList<Coord> positions, ArrayList<Integer> rotations, String imgPath) {
    super(coord, id, false);

    // Coords
    float x = this.getCoord().getX();
    float y = this.getCoord().getY();
    this.detectRange = detectRange;

    this.positions = positions;
    this.rotations = rotations;

    this.force = new Coord(0, 0);
    this.coordToRush = new Coord (0, 0);
    // Create ennemy
    this.m_ennemy = new FCircle(size);
    this.m_ennemy.setPosition(x, y);
    this.m_ennemy.setGrabbable(false);
    //this.m_ennemy.setStatic(true);
    this.m_ennemy.setGroupIndex(0);
    //this.m_ennemy.setRotation(60);
    this.rotate((int)rotate);
    radarAngle = 90 + m_ennemy.getRotation();

    // Texture
    this.texture = loadImage(imgPath);
    m_ennemy.attachImage(this.texture);
    m_world.add(this.m_ennemy);
  }

  public void draw() {
    if (this.isRushing) {
      this.rushing();
    } else {
      int rot = sensPos == 1 ? this.rotations.get(indexPos==0 ? 0 : indexPos-1) : (this.rotations.get(indexPos)+180)%360;
      if (indexPos == 0) {
        rot = 180-rot;
      }

      this.rotate((rot));
      if (degrees(m_ennemy.getRotation()) == 90.0 || degrees(m_ennemy.getRotation()) == 270.0) {
        radarAngle = (270) + degrees(m_ennemy.getRotation());
      } else {
        radarAngle = (90) + degrees(m_ennemy.getRotation());
      }
      rushTo(this.positions.get(indexPos));
      indexPos += sensPos;
      if (indexPos == this.positions.size()-1 || indexPos==0) sensPos = -1*sensPos;
    }
  }

  public void detectObstacle () {
    if (degrees(m_ennemy.getRotation()) != 90.0 && degrees(m_ennemy.getRotation()) != 270) {
      if (radarAngle <= 60 + degrees(m_ennemy.getRotation())) {
        radarSens = 5;
      } else if (radarAngle >= 120 + degrees(m_ennemy.getRotation())) {
        radarSens = -5;
      }
    }
    if (degrees(m_ennemy.getRotation()) == 90.0 || degrees(m_ennemy.getRotation()) == 270) {
      if (radarAngle <= 240 + degrees(m_ennemy.getRotation())) {
        radarSens = 5;
      } else if (radarAngle >= 300 + degrees(m_ennemy.getRotation())) {
        radarSens = -5;
      }
    }

    float x = this.m_ennemy.getX();
    float y = this.m_ennemy.getY();

    radarAngle = radarAngle + radarSens;

    FBody b = m_world.raycastOne(x, y, x+detectRange*sin(radians(90-radarAngle)), y-detectRange*sin(radians(radarAngle)), new FRaycastResult(), false);

    if (b != null && abs(sqrt(pow(b.getX(), 2)+pow(b.getY(), 2))-sqrt(pow(x, 2)+pow(y, 2)))<this.detectRange && b == player.getObject() && player.getPossed() == false) {
      player.setIsAlive(false);
    }
  }

  public void rushTo (Coord coord) {
    this.isRushing = true;
    this.coordToRush.setX(coord.getX());
    this.coordToRush.setY(coord.getY());
  }

  public void rushing () {
    if ( this.coordToRush.getX()-this.m_ennemy.getX() < -10 ) {
      if (this.force.getX() != -speed)
        cptChangeDirection++;
      this.setForceX(-speed);
    } else {
      if (this.coordToRush.getX()-this.m_ennemy.getX() > 10) {
        if (this.force.getX() != speed)
          cptChangeDirection++;
        this.setForceX(speed);
      } else
        this.setForceX(0);
    }
    if ( this.coordToRush.getY()-this.m_ennemy.getY() < -10) {
      if (this.force.getY() != -speed)
        cptChangeDirection++;
      this.setForceY(-speed);
    } else {
      if (this.coordToRush.getY()-this.m_ennemy.getY() > 10) {
        if (this.force.getY() != speed)
          cptChangeDirection++;
        this.setForceY(speed);
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

  public void setForceX (float x) {
    this.force.setX(x);
  }

  public void setForceY (float y) {
    this.force.setY(y);
  }

  // Change velocity
  public void updateForce () {
    this.m_ennemy.setVelocity(this.force.getX(), this.force.getY());
  }


  public void rotate (int degres) {
    this.m_ennemy.setRotation(radians(degres));
  }
}