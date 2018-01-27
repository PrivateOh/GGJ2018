class Entity  {

  private Coord coord;
  private int id;
  private boolean gettable;
  
  public Entity(Coord coord, int id, boolean gettable) {
    this.coord = coord;
    this.gettable=gettable;
    this.id = id;
  }
  public boolean getGettable() {
    return this.gettable;
  }
  
  public int getId () {
    return this.id;
  }
  public Coord getCoord () {
    return this.coord;
  }
}