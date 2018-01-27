class Obstacle {
  
  FPoly obstacle = new FPoly();
  color colour;
  ArrayList<Coord> coordinates = new ArrayList<Coord>();
  JSONObject json;
  String orientation;

  public Obstacle(String orientation, color c) { 
    //PImage texture = loadImage("/data/textures/desk.jpeg");
    this.colour = c;
    this.orientation = orientation;

    //obstacle.setPosition(3*width/4, 100);
    obstacle.setStatic(true);
    //obstacle.setGrabbable(false);
    obstacle.setFillColor(color(255, 255, 255, 255));
    //obstacle.attachImage(texture);
  }

  void drawObstacle() {

    json = loadJSONObject("obstacles.json");

    JSONArray values = json.getJSONArray("coordinates");

    //orientation = json.get("orientation").toString();

    for (int i = 0; i < values.size(); i++) {

      JSONObject animal = values.getJSONObject(i); 

      int x = animal.getInt("X");
      int y = animal.getInt("Y");

      println(orientation.equals("verticale"));

      if (orientation.equals("verticale")) {
        obstacle.vertex(y, x);
      } else {
        obstacle.vertex(x, y);
      }

      //console.log(ob
    }

    // for(Coord coor : coordinates){
    //   obstacle.vertex(coor.x, coor.y);
    // }

    m_world.add(obstacle);
  }
}