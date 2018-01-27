class Wall {
  private Coord start;
  private Coord end;
  private FPoly wall;

  public Wall(Coord start, Coord end) {
    this.start = start;
    this.end = end;

    FPoly wall = new FPoly();
    wall.vertex(start.x, start.y);
    wall.vertex(start.x, end.y);
    wall.vertex(end.x, end.y);
    wall.vertex(end.x, start.y);
    wall.vertex(start.x, start.y);
    wall.setGrabbable(false);
    wall.setStatic(true);
    wall.setStrokeColor(color(COLOR_GR));
    wall.setFillColor(color(COLOR_GR));
    wall.setRestitution(0);
    m_world.add(wall);
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

  FPoly getWall() {
    return this.wall;
  }
}