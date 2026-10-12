// dennis tokhtuev // sept 14 2026 // calc
String displayVal;
float l, r, result;
char op;
boolean left;
boolean newEntry;

Button[] numButtons = new Button[10];
Button[] opButtons = new Button[12];
void setup() {
  size(400, 520);
  displayVal = "0.0";
  l=0.0;
  r= 0.0;
  result = 0.0;
  op = ' ';
  newEntry=true;
  numButtons[0] = new Button(180, 240, '0');
  numButtons[1] = new Button(60, 160, '1');
  numButtons[2] = new Button(100, 160, '2');
  numButtons[3] = new Button(140, 160, '3');
  numButtons[4] = new Button(180, 160, '4');
  numButtons[5] = new Button(60, 200, '5');
  numButtons[6] = new Button( 100, 200, '6');
  numButtons[7] = new Button( 140, 200, '7');
  numButtons[8] = new Button( 180, 200, '8');
  numButtons[9] = new Button(60, 240, '9');
  opButtons[0] = new Button(60, 120, 'C');
  opButtons[1] = new Button(180, 120, '.');
  opButtons[2] = new Button(280, 140, '+');
  opButtons[3] = new Button(280, 180, '-');
  opButtons[4] = new Button(280, 220, '/');
  opButtons[5] = new Button(280, 260, 'X');
  opButtons[6] = new Button(280, 300, '=');
  opButtons[7] = new Button(60, 280, '-');
  opButtons[8] = new Button(280, 100, ' ');
  opButtons[9] = new Button(120, 300, ' ');
  opButtons[10] = new Button(160, 305, ' ');
  opButtons[11] = new Button(200, 310, ' ');
}


void draw () {
  background(111);
  updateDisplay();
  for (int i = 0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].mouseOver(mouseX, mouseY);
  }
  for (int i = 0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].mouseOver(mouseX, mouseY);
  }
}


void updateDisplay() {
  //background shape
  rect(width/2, 20, width-20, 40);
  // overlay text
  fill(0);
  textAlign(RIGHT);
  text(displayVal, width-30, 35);
}

void mouseReleased() {


  // update displa with button clicked
  for (int i= 0; i < numButtons.length; i++) {
    if ( numButtons[i].hover) {
      handleEvent(numButtons[i].val, true);
    }
  }
  for (int i= 0; i < opButtons.length; i++) {
    if ( opButtons[i].hover) {
      char clicked = opButtons[i].val;

      if (clicked == '=') {
        performCalc();
      } else if ( clicked == '+' || clicked == '-' ||
        clicked == 'X' || clicked == '/') {

        op= clicked;
        left = false;
        newEntry = true;
        displayVal = str(op);
      } else if (clicked ==' ') {
      }
    }
  }
}











void performCalc() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == '/') {
    if (r == 0) {
      displayVal = "ERROR";
      newEntry = true;
      return;
    }
    result = l/r;
  } else if (op == 'X') {
    result = l * r;
  }
     displayVal = str(result);
  l = result;
  r = 0.0;
  left = true;
  newEntry = true;
}
 



void keyPressed() {
  if (key == '1') {
    println("you hit 1" + keyCode );
    handleEvent('1', true);
  }
}

void handleEvent( char val, boolean isNum) {
  if (isNum) {

    String digit = str(val); 

    if (newEntry || displayVal.equals("o.o")) {
      displayVal = digit;
      newEntry = false;
    } else {
      displayVal += digit;
    }

    if (left == true) {
      l= float(displayVal);
    } else {
      r = float(displayVal);
    }
  } else {
  }
}









void printstate() {
  println(
    "l: " + l +
    "r: " + r +
    "result: " + result +
    "op: " + op +
    " display:" + displayVal
    );
}
