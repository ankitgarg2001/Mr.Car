int enemy = 1; //number of enemies //<>//
int [] enemy_location1 = new int[3];
int [] enemy_location2 = new int[3];
int enemy_1y = -180; //Enemy's y location (Starting Point)
int z1, z2, z3, z4; // check whether it is required to call the enemy
int sy = -180; //Surprise Car y location (Starting Point)
int enemy_speed = 10;

void call_location()
{
  if (z1 == 0 && z2 == 0 && enemy_1y == -180)
  {
    z1 = 1;
    z2 = 1;
  }
}

int select_location1() //Selects enemy's x location
{
  int number = int(random(5));
  int location = 92;
  if (number == 0)
  {
    location = 92;
  }
  if (number == 1)
  {
    location = 191;
  }
  if (number == 2)
  {
    location = 296;
  }
  if (number == 3)
  {
    location = 395;
  }
  return location;
}

int select_location2() //Selects enemy's x location
{
  int number = int(random(5));
  int location = 591;
  if (number == 0)
  {
    location = 591;
  }
  if (number == 1)
  {
    location = 690;
  }
  if (number == 2)
  {
    location = 795;
  }
  if (number == 3)
  {
    location = 894;
  }
  return location;
}

void display() //Displays enemy
{
  if (z1 == 1 && z2 == 1)
  {
    enemy_location1[0] = select_location1();
    enemy_location2[0] = select_location2();
    enemy_location1[1] = select_location1();
    enemy_location2[1] = select_location2();
    z1 = 0;
    z2 = 0;
  }
  
  if (enemy_1y <= 864) //If Enemy doesn't exit the canvas
  {
    image(img_enemy1, enemy_location1[0], enemy_1y);
    image(img_enemy2, enemy_location2[0], enemy_1y);
    image(img_enemy3, enemy_location1[1], enemy_1y);
    image(img_enemy4, enemy_location2[1], enemy_1y);
    enemy_1y += enemy_speed; //enemy's speed
  } else
  {
    enemy_1y = -180;
  }
}
