class Entity  extends FBody{

  private Coord coord;
  private int id;
  public Entity(Coord coord, int id) {
    this.coord = coord;
    this.id = id;
  }
  public int getId () {
    return this.id;
  }
}