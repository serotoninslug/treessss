PImage img;
int x=0;
int y=0;
color c;
float r;
float g;
float b;
int o=0;
PImage[] trees = new PImage[3]; //my sketches
PImage[] backgrounds = new PImage[2]; // array to hold background images
int bgIndex = 0; // index to keep track of the current background image


void setup() {
  size(800, 800);
  frameRate(30);

  // load background images
  backgrounds[0] = loadImage("atlantagreen.jpg");
  backgrounds[1] = loadImage("vienna.jpg");
  //backgrounds[2] = loadImage("vienna.jpg");
  //backgrounds[3] = loadImage("vienna.jpg");
  //backgrounds[4] = loadImage("vienna.jpg");

  // set initial background image
  img = backgrounds[bgIndex];
  img.loadPixels(); // load pixel data of background image
  imageMode(CENTER);
  image(img, width/2, height/2, width, height); // display the image


  // load trees into the array
  trees[0] = loadImage("sass.png"); //Sassafras albidum
  trees[1] = loadImage("betula.png"); //Betula nigra
  trees[2] = loadImage("pinus.png"); //Pinus rigida
}

void draw() {
  // update the background image
  //img = backgrounds[bgIndex];
  //img.loadPixels();
  //image(img, 0, 0);

  fadeToWhite();


  //draw trees
  drawTrees();
}




void mousePressed() {
  // cycle through background images
  bgIndex = (bgIndex + 1);
  if (bgIndex>=backgrounds.length) {
    bgIndex=0;
  }
  
  fill(255);
  rect(0,0,width,height);
  img = backgrounds[bgIndex];
  image(img, width/2, height/2, width, height);
  o=0;
}

void fadeToWhite() {
  //fade in white background
  fill(255, o);
  o+=3;
  noStroke();
  rect(0, 0, width, height);
}

void drawTrees() {
  img = backgrounds[bgIndex];
  img.loadPixels();
  
  for (y=0; y<height; y+=30) {
    for (x=0; x<width; x+=30) {
      c = img.get(x, y); // get color of the pixel at (x, y)
      r = red(c); // extract red component
      g = green(c); // extract green component
      b = blue(c); // extract blue component
      if ((r<150) && (g>70) && (b<150)) {
        tint(255, int(random(50, 128)));
        imageMode(CENTER);
        image(trees[int(random(3))], x, y, 100, 150);
      }
    }
  }
}
