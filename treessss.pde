PImage img;
int x=0;
int y=0;
color c;
float r;
float g;
float b;
int o=0;
PImage[] trees = new PImage[3]; //my sketches
//PImage[] backgrounds = new PImage[2]; //backgrounds


void setup() {
  size(800, 800);
  frameRate(3);
  
  //// Load backgrounds into the array
  //backgrounds[0] = loadImage("atlantagreen.jpg"); 
  //backgrounds[1] = loadImage("sass.png"); //Sassafras albidum
  //backgrounds[2] = loadImage("sass.png"); //Sassafras albidum
  //backgrounds[3] = loadImage("sass.png"); //Sassafras albidum
  //backgrounds[4] = loadImage("sass.png"); //Sassafras albidum
  
  img = loadImage("atlantagreen.jpg"); // load background image
  img.loadPixels(); // load pixel data of background image
  
  // Display the image
  image(img, 0, 0);
  

  // Load trees into the array
  trees[0] = loadImage("sass.png"); //Sassafras albidum
  trees[1] = loadImage("betula.png"); //Betula nigra
  trees[2] = loadImage("pinus.png"); //Pinus rigida
}

void draw() {
  //fill(255);
  fill(255, o);
  o+=5; //fade in white background
  noStroke();
  rect(0, 0, width, height);
  
  trees(); //draw trees
}


void trees(){
for (y=0; y<height; y+=20) {
  for (x=0; x<width; x+=20) {
    c = img.get(x, y); // get color of the pixel at (x, y)
    r = red(c); // extract red component
    g = green(c); // extract green component
    b = blue(c); // extract blue component
    if ((r<100) && (g>75) && (b<100)) {
      tint(255, int(random(50,128)));
      imageMode(CENTER);
      image(trees[int(random(3))], x, y, 100, 150);
    }
  }
}
}
