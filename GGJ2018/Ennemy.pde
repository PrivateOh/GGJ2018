class Ennemy extends Entity {


  private int radarSens = 1;
  private float radarAngle ;
  private float detectRange;

  private FCircle m_ennemy;

  public Ennemy(Coord coord, int id, float size, float detectRange) {
    super(coord, id);

    // Coords
    float x = this.getCoord().getX();
    float y = this.getCoord().getY();
    this.detectRange = detectRange;

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

    float x = this.m_ennemy.getX();
    float y = this.m_ennemy.getY();

    radarAngle = radarAngle + radarSens;
    stroke(255);
    
    line(x, y, x+detectRange*sin(radians(90-radarAngle)), y-detectRange*sin(radians(radarAngle)));
    FBody b = m_world.raycastOne(x, y, x+detectRange*sin(radians(90-radarAngle)), y-detectRange*sin(radians(radarAngle)), new FRaycastResult(), false);

    if (b != null && abs(sqrt(pow(b.getX(), 2)+pow(b.getY(), 2))-sqrt(pow(x, 2)+pow(y, 2)))<this.detectRange) {
      player.setIsAlive(false);
    } 
  }
}