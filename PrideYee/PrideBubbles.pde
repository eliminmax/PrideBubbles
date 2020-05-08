import java.util.Random;
Random rand = new Random();
final int margin = 18;
int frameNum = 0;
void setup() {
  frameRate(100);
  fullScreen();
  labelFont =loadFont("ArialRoundedMTBold-128.vlw");
  flagDraw = createGraphics(width, height);
  textDraw = createGraphics(width, height);
  frameRate(100);
  loadFlags();
  background(143);
  frameRate(100);
}
PGraphics flagDraw, textDraw;
int currentFlag;
void draw() {
  background(143);
  if (frameNum == 1000) {
    currentFlag ++;
    frameNum = 0;
    if (currentFlag==flags.length) {
      currentFlag = 0;
    }
  } else {
    int x = rand.nextInt(width);
    int y = rand.nextInt(height);
    int d = rand.nextInt(height/10)+(height/10);
    flagDraw.beginDraw();
    flagDraw.fill(flags[currentFlag].bandColor(y));
    flagDraw.noStroke();
    flagDraw.ellipse(x, y, d, d);
    flagDraw.endDraw();
    textDraw.beginDraw();
    textDraw.clear();
    textDraw.textFont(labelFont);
    textDraw.textAlign(CENTER, CENTER);
    textDraw.fill(flags[currentFlag].inverseBandColor());
    textDraw.text(flags[currentFlag].getID()+" Pride", width/2, height/2);
    textDraw.endDraw();
  }
  image(flagDraw, 0, 0);
  image(textDraw, 0, 0);  
  frameNum++;
}
PFont labelFont;
