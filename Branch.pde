
class Branch {

  Point vertexes[];

  Point start;
  Point end;
  float a;
  float startWidth;
  float endWidth;
  float startAngle;
  float endAngle;

  Branch() {
    start = new Point();
    end = new Point();
    start.x = random(100)-50;
    start.y = random(100)-50;

    end.x = random(100)-50;
    end.y = random(100)-50;
  }

  Branch(Point startingPt, float _dLength, float _dAngle, float _dWidth) {
    vertexes = new Point[4];
    startAngle = a = _dAngle;
    endAngle = _dAngle + random(PI/4)-PI/8;

    startWidth = _dWidth;
    endWidth = startWidth / (1 + random(10)/50);

    start = new Point();
    end = new Point();
    start.x = startingPt.x;
    start.y = startingPt.y;

    float dLength;
    if (_dLength<=0) {
      dLength = 50;
    } 
    else {
      dLength = _dLength;
    }
    a = _dAngle + random(PI/8)-PI/16;


    end.x = start.x+cos(a)*dLength;
    end.y = start.y+sin(a)*dLength;
    vertexes[0] = new Point();
    vertexes[1] = new Point();
    vertexes[2] = new Point();
    vertexes[3] = new Point();
    vertexes[0].x = start.x+cos(a+PI/2)*startWidth/2;
    vertexes[0].y = start.y+sin(a+PI/2)*startWidth/2;
    vertexes[1].x = start.x-cos(a+PI/2)*startWidth/2;
    vertexes[1].y = start.y-sin(a+PI/2)*startWidth/2;
    vertexes[2].x = end.x-cos(a+PI/2)*endWidth/2;
    vertexes[2].y = end.y-sin(a+PI/2)*endWidth/2;
    vertexes[3].x = end.x+cos(a+PI/2)*endWidth/2;
    vertexes[3].y = end.y+sin(a+PI/2)*endWidth/2;
  }
  Branch(Point startingPt) {
    this(startingPt, -1.0f, 90, 4.5f);
  }
  void draw() {

    fill(0, 0, 0, 64);
    beginShape();
    for (int i=0;i<4;i++) {
      vertex(vertexes[i].x-2, vertexes[i].y-2);
    }
    endShape(CLOSE);
    // stroke(255,255,255);
    //  line(start.x, start.y, end.x, end.y);
    fill(255);
    noStroke();
    beginShape();
    for (int i=0;i<4;i++) {
      vertex(vertexes[i].x, vertexes[i].y);
    }
    endShape(CLOSE);
  }
}

