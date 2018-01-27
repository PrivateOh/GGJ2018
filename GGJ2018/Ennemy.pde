class Ennemy extends Entity {


  private int radarSens = 1;
  private float radarAngle ;
  private float detectRange;
  private FCircle m_ennemy;
  private int cptChangeDirection = 0;
  private float timer = 0.0;

  private Coord force;
  private Coord coordToRush;
  private boolean isRushing = false;
  private ArrayList<Coord> positions;
  private ArrayList<Integer> rotations;
  private int indexPos = 1;
  private int sensPos = 1;

  public Ennemy(Coord coord, int id, float size, float detectRange, float rotate, ArrayList<Coord> positions, ArrayList<Integer> rotations) {
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
    this.m_ennemy.setRotation(rotate);
    radarAngle = 90 + m_ennemy.getRotation();
    m_world.add(this.m_ennemy);
  }

  public void draw() {
    if (this.isRushing) {
      this.rushing();
    } else {
      if (millis() - this.timer > 500) {
        this.timer = millis();
        this.rotate(sensPos == 1 ? this.rotations.get(indexPos) : (this.rotations.get(indexPos)+180)%360);
        rushTo(this.positions.get(indexPos));
        indexPos += sensPos;
        if (indexPos == this.positions.size()-1 || indexPos==0) sensPos = -1*sensPos;
      }
    }
  }

  public void detectObstacle () {
    if (radarAngle <= 60 + m_ennemy.getRotation()) {
      radarSens = 1;
    } else if (radarAngle >= 120 + m_ennemy.getRotation()) {
      radarSens = -1;
    }

    float x = this.m_ennemy.getX();
    float y = this.m_ennemy.getY();

    radarAngle = radarAngle + radarSens;

    stroke(255);
    line(x, y, x+detectRange*sin(radians(90-radarAngle)), y-detectRange*sin(radians(radarAngle)));

    FBody b = m_world.raycastOne(x, y, x+detectRange*sin(radians(90-radarAngle)), y-detectRange*sin(radians(radarAngle)), new FRaycastResult(), false);

    if (b != null && abs(sqrt(pow(b.getX(), 2)+pow(b.getY(), 2))-sqrt(pow(x, 2)+pow(y, 2)))<this.detectRange && b == player.getObject()) {
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
      if (this.force.getX() != -50)
        cptChangeDirection++;
      this.setForceX(-50);
    } else {
      if (this.coordToRush.getX()-this.m_ennemy.getX() > 10) {
        if (this.force.getX() != 50)
          cptChangeDirection++;
        this.setForceX(50);
      } else
        this.setForceX(0);
    }
    if ( this.coordToRush.getY()-this.m_ennemy.getY() < -10) {
      if (this.force.getY() != -50)
        cptChangeDirection++;
      this.setForceY(-50);
    } else {
      if (this.coordToRush.getY()-this.m_ennemy.getY() > 10) {
        if (this.force.getY() != 50)
          cptChangeDirection++;
        this.setForceY(50);
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
    println("Print velocity:\n x --> " + this.force.getX()+"\n y --> " + this.force.getY());
    this.m_ennemy.setVelocity(this.force.getX(), this.force.getY());
  }


  public void rotate (int degres) {
    this.m_ennemy.setRotation(degres);
  }
}