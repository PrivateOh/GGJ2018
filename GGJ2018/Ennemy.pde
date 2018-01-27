class Ennemy extends Entity {

  private FBox m_ennemy;
  private FPoly m_radar;

  public Ennemy(Coord coord, int id, float size) {
    super(coord, id);
    
    // Coords
    float x = this.getCoord().getX();
    float y = this.getCoord().getY();
    
    // Create ennemy
    this.m_ennemy = new FBox(size, size);
    this.m_ennemy.setPosition(x, y);
    this.m_ennemy.setGrabbable(false);
    
    // Create radar
    this.m_radar = new FPoly();
    this.m_radar.vertex(x, y-(size/2));
    this.m_radar.vertex(x-(size/2), y-300);
    this.m_radar.vertex(x+(size/2), y-300);
    this.m_radar.setGrabbable(false);
    this.m_radar.setFill(255, 0, 0);
    
    // Add object to the world
    m_world.add(this.m_ennemy);
    m_world.add(this.m_radar);
  }
  
  public void notifyPlayerDead() {
    player.setIsAlive(false);
  }
}