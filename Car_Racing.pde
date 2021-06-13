import processing.serial.*;
Serial myPort;

PImage backg, end_backg, backgs;
PImage img_car1;
PImage img_car2;
PImage img_enemy1;
PImage img_enemy2;
PImage img_enemy3;
PImage img_enemy4;
PImage img_enemy5;
PImage title;
PImage[] end = new PImage[4];
int stage;
PFont font;

void setup()
{
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
  stage =1;
  size(1075, 864);
  backg = loadImage("New Roads.png");
  backgs = loadImage("New Roads Singleplayer.png");
  end_backg = loadImage("New Roads Final.png");
  img_enemy1 = loadImage("Enemy.png");
  img_enemy2 = loadImage("Enemy.png");
  img_enemy3 = loadImage("Enemy.png");
  img_enemy4 = loadImage("Enemy.png");
  img_enemy5 = loadImage("Enemy.png");
  title = loadImage("Title.png");
  end[0] = loadImage("End1.png");
  end[1] = loadImage("End2.png");
  end[2] = loadImage("End3.png");
  end[3] = loadImage("End4.png");
  car_select1(car_selection_1);
  car_select2(car_selection_2);
  font = loadFont("ComicSansMS-30.vlw");
  textFont(font);
}

void draw()
{
  if (stage == 1) //homescreen
  {
    int y = frameCount*5 % backg.height;
    for (int i = -y; i < height; i += backg.height)
    {
      copy(end_backg, 0, 0, width, backg.height, 0, -i, width, backg.height);
    }   
    image(title, 0, 0);
    textAlign(CENTER);
    textSize(60);
    text("PRESS >>S<< FOR SINGLEPLAYER", width/2, height/2 - 45 + 250);
    text("PRESS >>M<< FOR MULTIPLAYER", width/2, height/2 + 45 + 250);
    int val = myPort.read();
    if (val == 'e')
    {
      stage = 6;
    }
    if (val == 'r')
    {
      stage = 6;
    }
  }

  if (stage == 2) //multiplayer
  {
    int y = frameCount*5 % backg.height;
    for (int i = -y; i < height; i += backg.height)
    {
      copy(backg, 0, 0, width, backg.height, 0, -i, width, backg.height);
    }  
    image(img_car1, car_1x, car_1y, 90, 180);
    image(img_car2, car_2x, car_2y, 90, 180);
    control();
    walls();
    call_location();
    display();
    collision();
  }

  if (stage == 3) //multiplayer ending
  {
    int y = frameCount*5 % backg.height;
    for (int i = -y; i < height; i += backg.height)
    {
      copy(end_backg, 0, 0, width, backg.height, 0, -i, width, backg.height);
    } 
    gameover();
  }

  if (stage == 4) //singleplayer
  {
    int y = frameCount*5 % backg.height;
    for (int i = -y; i < height; i += backg.height)
    {
      copy(backgs, 0, 0, width, backg.height, 0, -i, width, backg.height);
    }  
    image(img_car1, car_1x, car_1y, 90, 180);
    control();
    walls();
    call_location_single();
    display_single();
    collision_single();
  }

  if (stage == 5) //singleplayer ending
  {
    int y = frameCount*5 % backg.height;
    for (int i = -y; i < height; i += backg.height)
    {
      copy(end_backg, 0, 0, width, backg.height, 0, -i, width, backg.height);
    } 
    gameover_single();
  }

  if (stage == 6)
  {
    myPort.write('c');
    int y = frameCount*5 % backg.height;
    for (int i = -y; i < height; i += backg.height)
    {
      copy(end_backg, 0, 0, width, backg.height, 0, -i, width, backg.height);
    }   
    textSize(60);
    textAlign(CENTER);
    text("------------------------------------", width/2, height/2 - 185);
    text(":: SELEECT THE DIFFICULTY ::", width/2, height/2 - 135);
    text("------------------------------------", width/2, height/2 - 95);
    text("Press >>1<< for EASY", width/2, height/2 - 45 + 40);
    text("Press >>2<< for MEDIUM", width/2, height/2 + 85);
    text("Press >>3<< for HARD", width/2, height/2 + 175);
    int val = myPort.read();
    if (val == 'p')
    {
      enemy_speed = 8;
      selector();
    }
    if (val == 'o')
    {
      enemy_speed = 13;
      selector();
    }
    if (val == 'i')
    {
      enemy_speed = 17;
      selector();
    }
  }
}

void selector()
{
  int val = myPort.read();
  if (val == 'e')
  {
    stage = 2;
  }
  if (val == 'r')
  {
    stage = 4;
  }
}
