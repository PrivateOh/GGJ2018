public int resoX ;
public int resoY ;
public int coeffX, coeffY;
public PImage texture_end;
int A=1, B=2, C=3, D=4, E=5, F=6, G=7, H=8, I=9, J=10, K=11, L=12, M=13, N=14, O=15, P=16, Q=17, R=18, S=19, T=20, U=21, V=22, W=23, X=24, Y=25, Z=26, AA=27, AB=28, AC=29, AD=30, AE=31, AF=32, AG=33, AH=34, AI=35, AJ=36, AK=37, AL=38, AM=39, AN=40, AO=41, AP=42, AQ=43, AR=44, AS=45, AT=46, AU=47, AV=48, AW=49;


public void createLevel(int number) {
  resoX = width;
  resoY = height;
  coeffX = resoX/48;
  coeffY = resoY/27;

  texture_end = loadImage("/data/textures/end.png");
  switch (number) {
  case 1:
    defineLevel1();
    break;
  case 2:
    defineLevel2();
    break;
  case 3:
    defineLevel3();
    break;
   case 4:
   defineLevel4();
  }
}

private Coord caseIntoCoord (float lettre, float number) {
  Coord result;
  result = new Coord((lettre-1)*coeffX, (number-1)*coeffY);
  return result;
}

private void addEnd (float lettre, float number){
   endLevel = new FBox(coeffX, coeffY);
  Coord start = caseIntoCoord(lettre, number);
  endLevel.setPosition(start.x, start.y);
  endLevel.setGrabbable(false);
  endLevel.setStatic(true);
  endLevel.setRestitution(0);
  endLevel.attachImage(texture_end);
  m_world.add(endLevel); 
}