PImage img;
int x;
int y;
color c;
float r;
float g;
float b;



void setup() {
  size(1000, 1000);
  img = loadImage("atlantagreen.jpg"); // Load image
  img.loadPixels(); // Load the pixel data of the image
  loadPixels(); // Load the pixel data of the display window

  // Display the image
  image(img, 0, 0);

  x = 500; // X coordinate of the pixel
  y = 570; // Y coordinate of the pixel

  c = img.get(x, y); // Get the color of the pixel at (x, y)
  r = red(c); // Extract the red component
  g = green(c); // Extract the green component
  b = blue(c); // Extract the blue component

  // Print the RGB values
  println("Pixel at (" + x + ", " + y + ") - R: " + r + " G: " + g + " B: " + b);
}

void draw() {
  if ((g-b)>30) {
    PImage sass = loadImage("sass.png"); // Load image
    imageMode(CENTER);
    image(sass, x, y,100,150);
  }
}
