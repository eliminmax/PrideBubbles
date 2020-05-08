class Flag {
  int[][] bands;
  String flagID;
  Flag(int[][] bands, String flagID) {
    this.bands = bands;
    this.flagID=flagID;
  }
  color bandColor(int yPos) {
    float barHeight = height/(this.bands.length);
    for (int i=0; i < this.bands.length; i += 1) {
      if (yPos < barHeight*float(i+1)) {
        int r = this.bands[i][0]-margin+rand.nextInt(margin*2);
        int g = this.bands[i][1]-margin+rand.nextInt(margin*2);
        int b = this.bands[i][2]-margin+rand.nextInt(margin*2);
        color fc = color(r, g, b);
        return fc;
      }
    }
    return (0);
  }
  color inverseBandColor() {
    float barHeight = height/(this.bands.length);
    for (int i=0; i < this.bands.length; i += 1) {
      if (height/2 < barHeight*float(i+1)) {
        int r = this.bands[i][0];
        int g = this.bands[i][1];
        int b = this.bands[i][2];
        color fc = color(255-r, 255-g, 255-b);
        return fc;
      }
    }
    return (0);
  }
  String getID() {
    return this.flagID;
  }
}
Flag[] flags;
void loadFlags() {
  ArrayList<Flag> flagsTemp = new ArrayList<Flag>();
  int[][] genderqueer = {{181, 126, 220}, {255, 255, 255}, {073, 128, 034}};
  int[][] nonbinary =  {{254, 244, 051}, {255, 255, 255}, {154, 89, 207}, {045, 045, 045}};
  int[][] gay = {{0, 0, 0}, {120, 79, 23}, {255, 0, 0}, {255, 152, 0}, {255, 255, 0}, {0, 152, 0}, {0, 0, 255}, {117, 7, 135}};
  int[][] bisexual = {{216, 0, 113}, {216, 0, 113}, {116, 78, 151}, {0, 053, 169}, {0, 053, 169}};
  int[][] pansexual = {{255, 027, 141}, {255, 217, 0}, {027, 179, 255}};
  int[][] asexual = {{0, 0, 0}, {164, 164, 164}, {255, 255, 255}, {129, 0, 129}};
  int[][] aromantic = {{124, 189, 0}, {255, 243, 0}, {255, 112, 0}, {0, 0, 0}};
  int[][] transgender = {{91, 207, 250}, {245, 171, 185}, {255, 255, 255}, {245, 171, 185}, {91, 207, 250}};
  int[][] lesbian = {{164, 0, 197}, {183, 85, 146}, {208, 99, 166}, {237, 237, 235}, {228, 117, 207}, {197, 78, 84}, {138, 30, 4}};
  int[][] genderfluid = {{254, 117, 161}, {255, 255, 255}, {188, 23, 213}, {0, 0, 0}, {51, 62, 188}};
  flagsTemp.add(new Flag(genderqueer, "Genderqueer"));
  flagsTemp.add(new Flag(nonbinary, "Nonbinary"));
  flagsTemp.add(new Flag(gay, "Gay"));
  flagsTemp.add(new Flag(bisexual, "Bisexual"));
  flagsTemp.add(new Flag(pansexual, "Pansexual"));
  flagsTemp.add(new Flag(asexual, "Asexual"));
  flagsTemp.add(new Flag(aromantic, "Aromantic"));
  flagsTemp.add(new Flag(transgender, "Transgender"));
  flagsTemp.add(new Flag(lesbian, "Lesbian"));
  flagsTemp.add(new Flag(genderfluid, "Genderfluid"));
  flags = new Flag[flagsTemp.size()];
  for (int i = 0; i < flags.length; i++) {
    flags[i] = flagsTemp.get(i);
  }
  currentFlag = rand.nextInt(flags.length);
}    
