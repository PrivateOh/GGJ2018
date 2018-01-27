class Entity {
  private Coord coord;
  private int id;
  
  public Entity(Coord coord, int id) {
    this.coord = coord;
    this.id = id;
  }
  public int getId () {
    return this.id;
  }
  public Coord getCoord () {
    return this.coord;
  }
}