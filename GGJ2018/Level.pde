class Level {

  private int number;
  private ArrayList<Entity> entities;

  public Level(int number) {
    this.number = number;
  }

  public int getNumber() {
    return this.number;
  }
  
  public ArrayList<Entity> getEntities() {
    return this.entities;
  }
}

public Level createLevel(int number) {
  Level level = new Level(number);
  switch (number) {
  case 1:
    defineLevel1(level);
    break;
  case 2:
    defineLevel2(level);
    break;
  }
  return level;
}

private void defineLevel1(Level level) {
}
private void defineLevel2(Level level) {
}