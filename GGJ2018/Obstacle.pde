class Obstacle {

  FPoly obstacle = new FPoly();
  color colour;
  JSONObject json;
  float rotation;
  PImage texture;
  String name;
  Coord position;

  public Obstacle(Coord position, float rotation) { 
    this.rotation = rotation;
    this.position = position;
  }

  void drawObstacle() {

    texture = loadImage("/data/textures/desk.jpeg");

    json = loadJSONObject("obstacles.json");

    JSONArray values = json.getJSONArray("coordinates");

    name = json.get("name").toString();

    for (int i = 0; i < values.size(); i++) {

      JSONObject animal = values.getJSONObject(i); 

      int x = animal.getInt("X");
      int y = animal.getInt("Y");

      obstacle.vertex(x, y);
    }

    obstacle.setPosition(position.getX(), position.getY());
    obstacle.setStatic(true);
    obstacle.setGrabbable(false);
    obstacle.setRotation(radians(this.rotation));
    obstacle.attachImage(texture);

    m_world.add(obstacle);
  }
}