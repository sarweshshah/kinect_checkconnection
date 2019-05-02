import org.openkinect.processing.*;

// Kinect Library object
Kinect2 kinect2;
PImage rgbImg, irImg, depthImg, img;

void setup() {
  size(1024, 848);
  kinect2 = new Kinect2(this);
  kinect2.init();
  kinect2.initDevice();
  
  img = createImage(kinect2.depthWidth, kinect2.depthHeight, RGB);
  rgbImg = createImage(kinect2.depthWidth, kinect2.depthHeight, RGB);
  irImg = createImage(kinect2.depthWidth, kinect2.depthHeight, RGB);
  depthImg = createImage(kinect2.depthWidth, kinect2.depthHeight, RGB);
}


void draw() {
  background(0);

  img = kinect2.getRegisteredImage();  
  irImg = kinect2.getIrImage();
  rgbImg = kinect2.getVideoImage();
  depthImg = kinect2.getDepthImage();
  
  fill(255);
  textSize(12);
  int margin = 25;
  
  image(img, 0, 0);
  text("Registered Image", margin, margin);
  
  image(irImg, width/2 , 0);
  text("IR Image", width/2 + margin, margin);
  
  image(rgbImg, 0 , height/2, 512, 424);
  text("Video Image", margin, height/2 + margin);
  
  image(depthImg, width/2 , height/2);
  text("Depth Image",width/2 + margin, height/2 + margin);
}
