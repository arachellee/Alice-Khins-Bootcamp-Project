//Title Font = https://www.dafont.com/04b-30.font
//General Font = https://www.dafont.com/8bit-wonder.font
//Slime Sprite = https://pixelfrog-assets.itch.io/pixel-adventure-2
//Game Over Sound Effect = https://www.storyblocks.com/audio/stock/game-over-bwrxv_xkdlk8p0znn6.html
//Switch Lane Sound Effect = https://www.storyblocks.com/audio/stock/8-bit-pong-sound-rx9hv9c3idrk0wy4wj5.html

float gradient = 100, textX = width + 1270, doreamuX = 60, doreamuY = 372, slimeX = 2000, slimeY = 389, slime2X = 3200, slime2Y = 389;
PImage img, starS, starM, doreamu1, doreamu2;
PFont title;
boolean start = false, lose = false;
int score, i = 0, initialTime, interval = 100;
Cloud cloud1, cloud2, cloud3, cloud4, cloud5;

import processing.sound.*;
SoundFile switchlane, main, gameover;
import gifAnimation.*;
Gif slime, slime2;

class Cloud {
  float cloudX, cloudY, cloudWidth, cloudHeight, cloudSpeed, cloudAcceleration;

  Cloud()
  {
    cloudX = random(-100, width+100);
    cloudY = random(0, 70);
    cloudWidth = random(50, 200);
    cloudHeight = random(30, 60);
    cloudSpeed = 0.8;
    cloudAcceleration = 1;
  }

  void draw() {
    cloudSpeed *= cloudAcceleration;
    cloudX -= cloudSpeed;
    fill(#F2F4FC, 180);
    rect(cloudX, cloudY, cloudWidth, cloudHeight, 40);

    if (cloudX + cloudWidth < 0) {
      cloudX = width + cloudWidth;
    }
  }
}

void setup() {
  size(800, 500);
  
  initialTime = millis();

  cloud1 = new Cloud();
  cloud2 = new Cloud();
  cloud3 = new Cloud();
  cloud4 = new Cloud();
  cloud5 = new Cloud();

  main = new SoundFile(this, "PixelHeart.wav");
  main.play();
  switchlane = new SoundFile(this, "Switch.wav");
  gameover = new SoundFile(this, "GameOver.wav");

  slime = new Gif(this, "Slime.gif");
  slime.play();
  slime2 = new Gif(this, "Slime.gif");
  slime2.play();
}

void draw() {

  int count = (frameCount/25)%2;
  starS = loadImage("StarS.png");
  starM = loadImage("StarM.png");
  doreamu1 = loadImage("doreamu1.png");
  doreamu2 = loadImage("doreamu2.png");

  if (start == false) {

    noStroke();
    for (int y=0; y>-25; y = y-1)
    {
      fill(#F72A76, 50);
      rect(0, y*40, width, height);
    }
    for (int y=0; y<25; y = y+1)
    {
      fill(#FFCD5F, 20);
      rect(0, y*40, width, height);
    }

    fill(#4E7C29, 140);
    rect(0, height-40, width, 100);
    rect(0, height-70, width, 100);
    rect(0, height-100, width, 100);

    fill(#F2F4FC);
    title = createFont("04B_30__.TTF", 40);
    textFont(title);
    textAlign(CENTER);
    text("Pixel Run", width/2, 105);
    title = createFont("8-BIT WONDER.TTF", 18);
    textFont(title);
    textAlign(CENTER);
    text("Switch Lane", (width/2)+35, 228);
    textSize(23);
    fill(#FFB990);
    text("Press Space To", 350, 380);
    fill(#FCF6F2);
    text("Play", 560, 380);

    img = loadImage("ArrowUp.png");
    img.resize(0, 45);
    image(img, (width/3)-10, 170);
    img = loadImage("ArrowDown.png");
    img.resize(0, 45);
    image(img, (width/3)-10, 225);

    starS.resize(0, 55);
    starM.resize(0, 55);
    if (count == 0) {
      image(starS, 50, 50);
    } else {
      image(starM, 50, 50);
    }

    if (count == 0) {
      image(starM, 690, 35);
    } else {
      image(starS, 690, 35);
    }

    starS.resize(0, 45);
    starM.resize(0, 45);
    if (count == 0) {
      image(starM, 100, 75);
    } else {
      image(starS, 100, 75);
    }

    if (count == 0) {
      image(starS, 620, 60);
    } else {
      image(starM, 620, 60);
    }

    starS.resize(0, 30);
    starM.resize(0, 30);
    if (count == 0) {
      image(starS, 160, 50);
    } else {
      image(starM, 160, 50);
    }

    cloud1.draw();
    cloud2.draw();
    cloud3.draw();
    cloud4.draw();
    cloud5.draw();
  } else {
    for (int y=0; y>-25; y = y-1)
    {
      fill(#F72A76, 50);
      rect(0, y*40, width, height);
    }
    for (int y=0; y<25; y = y+1)
    {
      fill(#FFCD5F, 20);
      rect(0, y*40, width, height);
    }
    fill(#4E7C29, 140);
    rect(0, height-40, width, 100);
    rect(0, height-70, width, 100);
    rect(0, height-100, width, 100);

    starS.resize(0, 55);
    starM.resize(0, 55);
    if (count == 0) {
      image(starS, 50, 50);
    } else {
      image(starM, 50, 50);
    }

    if (count == 0) {
      image(starM, 690, 35);
    } else {
      image(starS, 690, 35);
    }

    starS.resize(0, 45);
    starM.resize(0, 45);
    if (count == 0) {
      image(starM, 100, 75);
    } else {
      image(starS, 100, 75);
    }

    if (count == 0) {
      image(starS, 620, 60);
    } else {
      image(starM, 620, 60);
    }

    starS.resize(0, 30);
    starM.resize(0, 30);
    if (count == 0) {
      image(starS, 160, 50);
    } else {
      image(starM, 160, 50);
    }
    cloud1.draw();
    cloud2.draw();
    cloud3.draw();
    cloud4.draw();
    cloud5.draw();
    cloud1.cloudAcceleration = 1.001;
    cloud2.cloudAcceleration = 1.001;
    cloud3.cloudAcceleration = 1.001;
    cloud4.cloudAcceleration = 1.001;
    cloud5.cloudAcceleration = 1.001;
    
    textSize(30);
    text("Avoid the slime for as long as you can", textX, 220);
    if (lose == false){
    textX = textX - 1.5;
    }
    else {
      textX = textX - 0;
    }

    image(slime, slimeX, slimeY);
    slimeX -= cloud1.cloudSpeed*1.3;
    image(slime2, slime2X, slime2Y);
    slime2X -= cloud1.cloudSpeed*1.3;

    doreamu2.resize(0, 50);
    doreamu1.resize(0, 50);
    if (count == 0) {
      image(doreamu2, doreamuX, doreamuY);
    } else {
      image(doreamu1, doreamuX, doreamuY);
    }

    if ((slimeX+50) < 0) {
      slimeX = width + random(50, 1000);
      slimeY = 359 + int(random(1, 4))*30;
    }

    if ((slime2X+50) < 0) {
      slime2X = width + random(50, 1000);
      slime2Y = 359 + int(random(1, 4))*30;
    }

    if (lose == false) {
       if (millis() - initialTime > interval)
  {
    score++;
    initialTime = millis();
  }
    }

    textSize(20);
    text("Score "+score*10, (width/2)+280, 140);

    if ((slimeX < 90 && slimeX>50) && (doreamuY == slimeY-17)) {
      main.pause();
      lose = true;
    }

    if ((slime2X < 90 && slime2X>50) && (doreamuY == slime2Y-17)) {
      main.pause();
      lose = true;
    }

    if (lose == true) {

      while (i < 1)
      {
        gameover.play();
        i++;
      }

      cloud1.cloudAcceleration = 0;
      cloud2.cloudAcceleration = 0;
      cloud3.cloudAcceleration = 0;
      cloud4.cloudAcceleration = 0;
      cloud5.cloudAcceleration = 0;

      fill(0, 150);
      rect(0, 0, width, height);

      fill(#EDEFF5);
      textSize(26);
      text("Final Score", width/2, 175);
      textSize(22);
      text(score*10, width/2, 240);
      textSize(12);
      text("Press Q to exit the game", width/2, 350);
      fill(#888B93);
      textSize(8);
      text("All resources used are released under a Creative Commons license", width/2, 450);
      text("Credit is given in the main source code", width/2, 460);
      text("All other spritework is done by me", width/2, 470);
    }
  }
}

void keyPressed() {
  if (key==' ') {
    start = true;
  }
  if (lose == false) {
    if (doreamuY < 432 && keyCode == DOWN) {
      doreamuY = doreamuY + 30;
      switchlane.play();
    }
    if (doreamuY > 372 && keyCode == UP) {
      doreamuY = doreamuY - 30;
      switchlane.play();
    }
    else {
      doreamuY = doreamuY - 0;
    }
  }
  if (key=='q') {
    exit();
  }
}
