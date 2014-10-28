class ColorBlock {

  color col = 120;

  PVector position = new PVector();
  PVector dimensions = new PVector();

  float life = 120;

  ColorBlock() {
  }

  void update() {

    //   col = color(col);

    //   life += random(-10,10);






//    dimensions.x += random(1);
//   dimensions.y += random(-1,1);
//    dimensions.z += random(-10,10);
  }

  void render() {

    pushMatrix();

    translate(position.x, position.y, dimensions.z/2);
    fill(col);
    noStroke();
    //    stroke(120,0);
//    rect(position.x, position.y, dimensions.x, dimensions.y);
    box(dimensions.x, dimensions.y, dimensions.z);
    //    box(dimensions.x, dimensions.y, 0);
    popMatrix();
  }
}

