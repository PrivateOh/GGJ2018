  //////////////////////////////////////////////
  //         GGJ2018 - AstralProjection       //
  //           Creation : 26/01/18            //
  //     Derniere modification : 26/01/18     //
  //              Version : 0.08              //
  //////////////////////////////////////////////
  
  import fisica.*;
  
  public static final int COLOR_BK = 0;
  public Player player = null;
  public ArrayList<Ennemy> m_ennemys = null;
  public FLine m_line;
  public int currentLevel;
  
  // World
  public FWorld m_world;
  
  void setup() {
    fullScreen();
    smooth();
    currentLevel = 1;
    Fisica.init(this);
  
    this.m_ennemys = new ArrayList<Ennemy>();
    this.initWorld();
    this.loadLevel(1);
  }
  
  void draw() {
    background(COLOR_BK);
  
    if (!this.player.getIsAlive()) {
      loadLevel(currentLevel);
    }
    this.m_world.step();
    this.m_world.draw();
    this.player.detectObstacle();
    for (Ennemy ennemy : m_ennemys) {
      ennemy.detectObstacle();
    }
  }
  
  /* Create the world and init parameters */
  void initWorld() {
    this.m_world = new FWorld();
    this.m_world.setGravity(0, 0);
  }
  
  /* Load the level passed in parameter */
  void loadLevel(int number) {
    if (this.m_world != null) {
      this.m_world.clear();
    }
    this.m_ennemys.clear();
    this.initWorld();
    /* File: Level.ine */
    this.createLevel(number);
  }
  
  void keyPressed() {
    if (this.player != null)
    {
      this.player.keyPressed(keyCode);
    }
  }
  
  void keyReleased() {
    if (this.player != null)
    {
      this.player.keyReleased(keyCode);
    }
  }