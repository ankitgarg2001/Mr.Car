int car_1x = 92; //Car 1 x location
int car_1y = 660; //Car 1 y location
int car_2x = 591; //Car 2 x location
int car_2y = 660; //Car 2 y location
int car_xspeed = 6; //Car's speed on x axis
int car_selection_1 = int(random(10));
int car_selection_2 = int(random(10));

boolean leftPressed = false;
boolean rightPressed = false;
boolean aPressed = false;
boolean dPressed = false;
boolean mPressed = false;
boolean sPressed = false;
boolean onePressed = false;
boolean twoPressed = false;
boolean threePressed = false;

void car_select1(int car_number) //function to select the player's car
{
  if (car_number == 0)
  {
    img_car1 = loadImage("CarRed.png");
  }
  if (car_number == 1)
  {
    img_car1 = loadImage("CarOrange.png");
  }
  if (car_number == 2)
  {
    img_car1 = loadImage("CarPink.png");
  }
  if (car_number == 3)
  {
    img_car1 = loadImage("CarYellow.png");
  }
  if (car_number == 4)
  {
    img_car1 = loadImage("CarLightGreen.png");
  }
  if (car_number == 5)
  {
    img_car1 = loadImage("CarGreen.png");
  }
  if (car_number == 6)
  {
    img_car1 = loadImage("CarBlue.png");
  }
  if (car_number == 7)
  {
    img_car1 = loadImage("CarLightBlue.png");
  }
  if (car_number == 8)
  {
    img_car1 = loadImage("CarWhite.png");
  }
  if (car_number == 9)
  {
    img_car1 = loadImage("CarBlack.png");
  }
}

void car_select2(int car_number) //function to select the player's car
{
  if (car_number == 0)
  {
    img_car2 = loadImage("CarRed.png");
  }
  if (car_number == 1)
  {
    img_car2 = loadImage("CarOrange.png");
  }
  if (car_number == 2)
  {
    img_car2 = loadImage("CarPink.png");
  }
  if (car_number == 3)
  {
    img_car2 = loadImage("CarYellow.png");
  }
  if (car_number == 4)
  {
    img_car2 = loadImage("CarLightGreen.png");
  }
  if (car_number == 5)
  {
    img_car2 = loadImage("CarGreen.png");
  }
  if (car_number == 6)
  {
    img_car2 = loadImage("CarBlue.png");
  }
  if (car_number == 7)
  {
    img_car2 = loadImage("CarLightBlue.png");
  }
  if (car_number == 8)
  {
    img_car2 = loadImage("CarWhite.png");
  }
  if (car_number == 9)
  {
    img_car2 = loadImage("CarBlack.png");
  }
}

void control() //controls the movement of the car in the x direction
{
  int val = myPort.read();
  if (val == 'q')
  {
    car_1x += 20;//car_xspeed;
  }
  if (val == 'w')
  {
    car_1x += -20;//-car_xspeed;
  }
  if (aPressed)
  {
    car_2x += -car_xspeed;
  }
  if (dPressed)
  {
    car_2x += +car_xspeed;
  }
}

void keyPressed()  
{
  if (keyCode == RIGHT)
  {
    rightPressed = true;
  }
  if (keyCode == LEFT)
  {
    leftPressed = true;
  }
  if (key == 'a' || key == 'A')
  {
    aPressed = true;
  }
  if (key == 'd' || key == 'D')
  {
    dPressed = true;
  }
  if (key == 'r' || key == 'R')
  {
    rPressed = true;
  }
  if (key == 'm' || key == 'M')
  {
    mPressed = true;
  }
  if (key == 's' || key == 'S')
  {
    sPressed = true;
  }
  if (key == '1')
  {
    onePressed = true;
  }
  if (key == '2')
  {
    twoPressed = true;
  }
  if (key == '3')
  {
    threePressed = true;
  }
}

void keyReleased()
{
  if (keyCode == RIGHT)
  {
    rightPressed = false;
  }
  if (keyCode == LEFT)
  {
    leftPressed = false;
  }
  if (key == 'a' || key == 'A')
  {
    aPressed = false;
  }
  if (key == 'd' || key == 'D')
  {
    dPressed = false;
  }
}

void walls() //restrictions for movement in the x direction
{
  if (car_1x < 92)
  {
    car_1x = 91;
  }
  if (car_1x > 395)
  {
    car_1x = 395;
  }
  if (car_2x < 591)
  {
    car_2x = 591;
  }
  if (car_2x > 894)
  {
    car_2x = 894;
  }
}
