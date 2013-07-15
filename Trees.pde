Branch b;
Branch[] bArray;

int numLines;
float startingLength;
float startingAngle;
float startingWidth;
int runCount = 0;

Point startingPoint;

void setup() {
  if (runCount==0) {
    background(0);



    strokeJoin(BEVEL);



  }
  if (runCount%3==0) {
    startingPoint = new Point();
    startingWidth = 10.0f;
    numLines = int(random(8))+16;
    startingLength = random(10)+45;
        startingAngle = random(360);//PI/-2.0f;
        println("dip");
  } 
  else {
    println("derp");
  }

  size(1920, 1080);
  // b = new Branch();
  bArray = new Branch[numLines];

  Point lastEndPoint = new Point();
  lastEndPoint.x = startingPoint.x;
  lastEndPoint.y = startingPoint.y;

  float desiredLength = startingLength;
  float desiredAngle = startingAngle;
  float desiredWidth = startingWidth;
  
  for (int i=0;i<numLines;i++) {

    bArray[i] = new Branch(lastEndPoint, desiredLength, desiredAngle, desiredWidth); 
    lastEndPoint.x = bArray[i].end.x;
    lastEndPoint.y = bArray[i].end.y;
    desiredLength/=1.1f;
    desiredAngle = bArray[i].endAngle;
    desiredWidth = bArray[i].endWidth;  
    if (i==ceil(numLines/2) && runCount%3==0) {
      startingLength = desiredLength;
      startingAngle = desiredAngle;
      startingWidth = desiredWidth; 
      startingPoint.x = lastEndPoint.x;
      startingPoint.y = lastEndPoint.y;
      println("ummm");
    }


  }
      runCount++;
}
void draw() {
  // background(128);
}
void keyPressed() {
  setup();
  translate(width/2, height/2);


  for (int i=0;i<numLines;i++) {
    stroke(255, 255, 255, 32);
    bArray[i].draw();
  }
}
void mousePressed() {
  setup();
  translate(width/2, height/2);


  for (int i=0;i<numLines;i++) {
    stroke(255, 255, 255, 32);
    bArray[i].draw();
  }
}
class Point {

  float x, y;
  Point() {
    x = 0.0f;
    y = 0.0f;
  }
}

