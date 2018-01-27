class Wall {
  private Coord start;
  private Coord end;
  private FPoly wall;
  private ArrayList<FBox> walls;
  private PImage texture;
  public Wall(Coord start, Coord end) {
    this.start = start;
    this.end = end;
    texture = loadImage("/data/textures/wall.png");
    walls = new ArrayList<FBox>();
    float t_x, t_y;
    t_x = abs(end.x-start.x);
    t_y = abs(end.y-start.y);
    int i;
    FBox walltempo;
    if (t_x > t_y) {
      for (i=0; i<t_x/coeffX; i++) {
        walltempo = new FBox(40,40);
        walltempo.setPosition(start.x+i*coeffX,start.y);
        walls.add(walltempo);
      }
    }
    else{
      for (i=0; i<t_y/coeffY; i++) {
        walltempo = new FBox(40,40);
        walltempo.setPosition(start.x,start.y+i*coeffY);
        walls.add(walltempo);
      }
    }

    for (FBox w : walls) {
      w.setGrabbable(false);
      w.setStatic(true);
      w.setRestitution(0);
      w.attachImage(texture);
      m_world.add(w);
    }
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