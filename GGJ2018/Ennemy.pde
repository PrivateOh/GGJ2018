class Ennemy extends Entity {


  private int radarSens = 1;
  private float radarAngle ;
  private float detectRange;
  private float size;

  private FCircle m_ennemy;

  public Ennemy(Coord coord, int id, float size, float detectRange) {
    super(coord, id);

    // Coords
    float x = this.getCoord().getX();
    float y = this.getCoord().getY();
    this.detectRange = detectRange;
    this.size = size;

    // Create ennemy
    this.m_ennemy = new FCircle(size);
    this.m_ennemy.setPosition(x, y);
    this.m_ennemy.setGrabbable(false);
    this.m_ennemy.setStatic(true);
    radarAngle = 90 + m_ennemy.getRotation();
    m_world.add(this.m_ennemy);
  }


  public void detectObstacle () {
    if (radarAngle <= 60 + m_ennemy.getRotation()) {
      radarSens = 1;
    } else if (radarAngle >= 120 + m_ennemy.getRotation()) {
      radarSens = -1;
    }

    radarAngle = radarAngle + radarSens;
    FRaycastResult result = new FRaycastResult();
    FBody b = m_world.raycastOne(this.m_ennemy.getX(), m_ennemy.getY(), this.m_ennemy.getX()+detectRange*sin(radians(90-radarAngle)), this.m_ennemy.getY()-detectRange*sin(radians(radarAngle)), result, false);

    if (b != null && abs(sqrt(pow(b.getX(), 2)+pow(b.getY(), 2))-sqrt(pow(m_ennemy.getX(), 2)+pow(m_ennemy.getY(), 2)))<this.detectRange) {
      player.setIsAlive(false);
    }
    b= null;
  }

  public void notifyPlayerDead() {
    player.setIsAlive(false);
  }
}