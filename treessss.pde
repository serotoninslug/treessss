PImage img;
int x=0;
int y=0;
color c;
float r;
float g;
float b;
int o=0;
PImage[] trees = new PImage[3]; //my sketches
PImage[] backgrounds = new PImage[7]; // array to hold background images
int bgIndex = 0; // index to keep track of the current background image
boolean loopRunning = true; // variable to track loop state


void setup() {
  size(800, 800);
  frameRate(25);

  // load background images
  backgrounds[0] = loadImage("vienna.jpg");
  backgrounds[1] = loadImage("mq.png");
  backgrounds[2] = loadImage("cage.png");
  backgrounds[3] = loadImage("bench.png");
  backgrounds[4] = loadImage("koi.png");
  backgrounds[5] = loadImage("kiss.png");
  backgrounds[6] = loadImage("soph.jpg");

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
  fadeToWhite();


  //draw trees
  drawTrees();

  //show background behind if key pressed (not space bar)
  if (keyPressed && key != ' ') {
    image(img, width/2, height/2, width, height);
  }
}




void mousePressed() {
  // cycle through background images left v right
  if (mouseX > width / 2) {
    bgIndex = (bgIndex + 1) % backgrounds.length;
  } else {
    bgIndex = (bgIndex - 1 + backgrounds.length) % backgrounds.length;
  }

  //redraw background fading to white
  fill(255);
  rect(0, 0, width, height);
  img = backgrounds[bgIndex];
  image(img, width/2, height/2, width, height);
  o=0;
}

void keyPressed() {
  if (key == ' ') { // toggle loop on space key press
    loopRunning = !loopRunning;
    if (loopRunning) {
      loop();
    } else {
      noLoop();
    }
  }
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
