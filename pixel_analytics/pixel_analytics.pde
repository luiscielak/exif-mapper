
/*
 Image Grid
 fstraat@gmail.com
 2011-03-31 
 */

import processing.pdf.*;
import processing.opengl.*;

PImage myImage;
ArrayList<ColorBlock> blocks = new ArrayList();      // ArrayList<type_object> *classes only

boolean recording = false;

int plotX1, plotY1, plotX2, plotY2;

float maxcol = 0;
float mincol = 0;


void setup() {
  //  size(screenWidth-screenWidth/7, screenHeight - screenHeight/7, OPENGL);
  size(800, 800, OPENGL);

  background(250);
  smooth();

  randomSeed(1);


  //load the image
  myImage = loadImage("img00.jpg");

  //make grid
  makeGrid(30,30);

  // set colors
  setColors(myImage);
}


void draw() {
  if (recording) beginRecord(PDF, "output_"+year()+"_"+month()+"_"+day()+"_"+hour()+"_"+minute()+"_"+second()+".pdf");
  background(250);
//    lights();
  
  translate(width/2,height/2);
  rotateX( map(mouseY, 0, height, 0, PI/2));
//  rotateZ( map(mouseX, 0, width, 0, PI * 2));
  translate(-width/2, -height/2);



  for (int i = 0; i < blocks.size(); i++) {                // go through the block and render them
//    blocks.get(i).update();      // .add, .get, .size
    blocks.get(i).render();      // .add, .get, .size
  }

  if (recording) {
    endRecord();
    recording = false;
  }
}


void sortColors() {
  background(0);
  for (int i = 0; i < blocks.size(); i++) {
    ColorBlock b = blocks.get(i);

    //    b.position.y = map(saturation(b.col), 0, 255, 0, height);        //     b.dimensions.z = random(10,100);    
    //    b.position.x = map(brightness(b.col), 0, 255, 0, width);        //     b.dimensions.z = random(10,100);

    b.position.y = map(i, 0, blocks.size(), 0, height);

    b.position.x = width/2;
  }
}

void sortColorsS() {
  for (int i = 0; i < blocks.size(); i++) {
    ColorBlock b = blocks.get(i);
    b.position.x = map(red(b.col), 0, 255, 0, width);        //     b.dimensions.z = random(10,100);    
    b.position.y = map(blue(b.col), 0, 255, 0, height);        //     b.dimensions.z = random(10,100);
  }
}

void sortColorsR() {
  for (int i = 0; i < blocks.size(); i++) {
    ColorBlock b = blocks.get(i);
    b.position.y = map(red(b.col), 0, 255, 0, height);        //     b.dimensions.z = random(10,100);    
    //    b.position.x = map(hue(b.col), 0, 255, 0, width);        //     b.dimensions.z = random(10,100);
  }
}

void sortColorsG() {
  for (int i = 0; i < blocks.size(); i++) {
    ColorBlock b = blocks.get(i);
    b.position.y = map(green(b.col), 0, 255, 0, height);        //     b.dimensions.z = random(10,100);    
    //    b.position.x = map(brightness(b.col), 0, 255, 0, width);        //     b.dimensions.z = random(10,100);
  }
}
void sortColorsB() {
  for (int i = 0; i < blocks.size(); i++) {
    ColorBlock b = blocks.get(i);
    b.position.y = map(blue(b.col), 0, 255, 0, height);        //     b.dimensions.z = random(10,100);    
    //    b.position.x = map(brightness(b.col), 0, 255, 0, width);        //     b.dimensions.z = random(10,100);
  }
}


void makeGrid(int cols, int rows) {
  // create a set of color blocks and size and position to fit grid
  float colWidth = (float) width/cols;
  float rowHeight = (float) height/rows;

  for (int i = 0; i < cols; i++) {

    for (int j = 0; j < rows; j++) {
      // make a new block
      ColorBlock b = new ColorBlock();
      // set its position
      b.position.x = i * colWidth;
      b.position.y = j * rowHeight;
      //set its size
      b.dimensions.x = colWidth;
      b.dimensions.y = rowHeight;

      // Add it to the arrayList
      blocks.add(b);        //ArrayList.add(object)
    }
  }
}

void setColors(PImage img) {
  //go through each block and set its color from the image
  for (int i = 0; i < blocks.size(); i++) {
    ColorBlock b = blocks.get(i);
    float mx = map(b.position.x + (b.dimensions.x/2),0,width,0,img.width);        //    float mx = map(b.position.x,0,width,0,img.width);
    float my = map(b.position.y + (b.dimensions.y/2),0,height,0,img.height);      //     float my = map(b.position.y + (b.dimensions.y/2),0,height,0,img.height);
    b.col = img.get(round(mx),round(my));
    b.dimensions.z = map(brightness(b.col),0,255,100,1);        //     b.dimensions.z = random(10,100);

  }
}


void keyPressed() {
  if (key == '1') sortColors(); 
  if (key == '2') sortColorsS(); 
  if (key == '3') sortColorsR(); 
  if (key == '4') sortColorsG(); 
  if (key == '5') sortColorsB();

  if (key == 'p') {
    println("Print PDF");
    recording = true;
  }
}


// ------ print frames ------

void keyReleased() {
//  if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.png");
}

//String timestamp() {
//  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
//} 


