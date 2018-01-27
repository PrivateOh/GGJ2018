  class Obstacle extends Entity {

  private FPoly obstacle;
  private JSONObject json;
  private float rotation;
  private PImage texture;
  private Coord position;
  private String type;
  public static final int Id = 1000;

  public Obstacle(String type, Coord position, float rotation) {
    super(position, 10000, true);
    obstacle = new FPoly();
    obstacle.setGroupIndex(Obstacle.Id);
    this.type = type;
    this.rotation = rotation;
    this.position = position;
  }

  void drawObstacle() {

    texture = loadImage("/data/textures/" + type + ".png");

    json = loadJSONObject("obstacles.json");

    JSONObject obstacleObject = json.getJSONObject(getType());
    JSONArray values = obstacleObject.getJSONArray("coordinates");

    for (int i = 0; i < values.size(); i++) {

      JSONObject coordinate = values.getJSONObject(i); 

      int x = coordinate.getInt("X");
      int y = coordinate.getInt("Y");

      obstacle.vertex(x, y);
    }

    obstacle.setPosition(position.getX(), position.getY());
    obstacle.setStatic(true);
    obstacle.setGrabbable(false);
    obstacle.setRotation(radians(getRotation()));
    obstacle.attachImage(texture);

    m_world.add(obstacle);

  }

  void setCoord(Coord position) {
    this.position = position;
  }

  Coord getCoord() {
    return this.position;
  }
  
  void setRotation(float rotation) {
    this.rotation = rotation;
  }

  float getRotation() {
    return this.rotation;
  }
  
  void setType(String type) {
    this.type = type;
  }

  String getType() {
    return this.type;
  }
  
  FBody getObstacle(){
    return this.obstacle;
  }
}