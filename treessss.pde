PImage img;
int x=0;
int y=0;
color c;
float r;
float g;
float b;
int o=0;
PImage[] trees;


void setup() {
  size(800, 800);
  img = loadImage("atlantagreen.jpg"); // Load image
  img.loadPixels(); // Load the pixel data of the image
  loadPixels(); // Load the pixel data of the display window

  // Display the image
  image(img, 0, 0);
}

void draw() {
  fill(255, o);
  o+=5;
  noStroke();
  rect(0, 0, width, height);
  for (y=0; y<height; y+=20) {
    for (x=0; x<width; x+=20) {
      c = img.get(x, y); // Get the color of the pixel at (x, y)
      r = red(c); // Extract the red component
      g = green(c); // Extract the green component
      b = blue(c); // Extract the blue component
      if ((r<100) && (g>75) && (b<100)) {
        tint(255, int(random(128)));
        PImage sass = loadImage("sass.png"); //Sassafras albidum
        imageMode(CENTER);
        image(sass, x, y, 100, 150);
      }
    }
  }
}
