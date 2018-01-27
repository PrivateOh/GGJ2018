class Wall {
  private Coord start;
  private Coord end;
  private FLine wall;

  public Wall(Coord start, Coord end) {
    this.start = start;
    this.end = end;

    this.wall = new FLine(start.x, start.y, end.x, end.y);
    this.wall.setGrabbable(false);
    this.wall.setStatic(true);
    this.wall.setStrokeColor(color(COLOR_WH));
    m_world.add(this.wall);
  }

  void setStart(Coord start) {
    this.start = start;
  }

  Coord getStart() {
    return this.start;
  }

  void setEnd(Coord end) {
    this.end = end;
  }

  Coord getEnd() {
    return this.end;
  }

  FLine getWall() {
    return this.wall;
  }
}