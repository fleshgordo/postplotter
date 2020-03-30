/**
 * PostPlotter Koordinatensystem
 *
 * Units are taken from drawing in mm straight into pixels
 */


float xRight = 0;
float yRight = 0;
float radiusRight = 95.5;

float xLeft = 71.5;
float yLeft = 81;
float radiusLeft = 211.5;

float radiusSchwenk = 108;

float postcardLength = 148;
float postcardHeight = 105;

void setup() {
  size(1080, 720);
  pixelDensity(2);
  noFill();
  stroke(255);
  ellipseMode(CENTER);
  rectMode(CENTER);
  strokeWeight(0.2);
}

void draw() {

  background(0);

  // Translate the origin point
  translate(width/2+100, height/2+50);
  
  // Scale up entire canvas
  scale(3);
  
  strokeWeight(.2);
  stroke(255);
  
  // draw postcard and round table
  rect(0, 0, postcardLength, postcardHeight);
  circle(xRight, yRight, radiusRight * 2);
  
  // draw circles on polar system (stepperRight)
  for (int i = 0; i< 182; i+= 5) {
    circle(0, 0, i);
  }
  
  // draw lines for polar system (stepperLeft)
  for (int i = 0; i< 360; i+= 10) {
    pushMatrix();
    // kreise vom schwenkarm
    translate(radiusSchwenk * cos(radians(i)), radiusSchwenk * sin(radians(i)));
    rotate(radians(i));
    arc(0, 0, radiusSchwenk * 2, radiusSchwenk * 2, PI, PI+PI*.28);
    popMatrix();
  }


 // draw helpers
  stroke(255, 0, 0);
  arc(xLeft, yLeft, radiusLeft * 2, radiusLeft * 2, PI, PI+PI*.5);
  
  stroke(0, 255, 0);
  strokeWeight(3);
  point (xRight, yRight);
  point (xLeft, yLeft);
}
