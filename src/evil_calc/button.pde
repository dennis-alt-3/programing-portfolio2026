class Button {
  // member variables
  float x, y, w, h;
  color c1, c2;
  char val;
  boolean hover;

  // constructer
  Button(float x, float y, char val) {
    this.x = x;
    this.y =y;
    w = 100;
    h = 30;
    c1 = color(60);
    c2 = color (177);
    this.val = val;
    hover = false;
  }

  // member methods
  void display () {
    if ( hover == true) {
      fill (c1);
    } else {
      fill (c2);
    }
    rectMode(CENTER);
    rect(x, y, w/3, h);
    fill(255);
    rectMode(CENTER);
    text(val, x-2, y+4);
  }
  void mouseOver(float tempX, float tempY ) {
    if (tempX > x-w/4 +5 && tempX < x+w/4 -5 && tempY >y-h/2 && tempY < y+h/2) {
      hover= true;
    } else {
      hover = false;
    }
  }
}
