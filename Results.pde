int hit1;
int hit2;
int hit3;
boolean draw = false;
boolean rPressed = false;

void collision() //Checks collision
{
  float d1 = dist(enemy_location1[0] + 45, enemy_1y + 180/2, car_1x + 45, car_1y); 
  float d2 = dist(enemy_location1[1] + 45, enemy_1y + 180/2, car_1x + 45, car_1y);
  float d3 = dist(enemy_location2[0] + 45, enemy_1y + 180/2, car_2x + 45, car_2y); 
  float d4 = dist(enemy_location2[1] + 45, enemy_1y + 180/2, car_2x + 45, car_2y);
  float d9 = dist(enemy_location1[0] + 45, enemy_1y, car_1x + 45, car_1y + 90); 
  float d10 = dist(enemy_location1[1] + 45, enemy_1y, car_1x + 45, car_1y + 90);
  float d11 = dist(enemy_location2[0] + 45, enemy_1y, car_2x + 45, car_2y + 90); 
  float d12 = dist(enemy_location2[1] + 45, enemy_1y, car_2x + 45, car_2y + 90);
  if (d1 <= 45*2 || d2 <= 45*2 || d9 <= 45*2 || d10 <= 45*2)
  {
    stage = 3;
    hit1 = 1;
  }
  if (d3 <= 45*2 || d4 <= 45*2 || d11 <= 45*2 || d12 <= 45*2)
  {
    stage = 3;
    hit2 = 1;
  }
}

void gameover()
{
  if (hit1 == 1 && hit2 == 0)
  {
    image(end[1], 0, 0);
  }
  if (hit2 == 1 && hit1 == 0)
  {
    image(end[0], 0, 0);
  }
  if (hit1 == 1 && hit2 == 1)
  {
    image(end[2], 0, 0);
  }
  int val = myPort.read();
  if (val == '6')
  {
    enemy_1y = -180;
    stage = 2;
    hit1 = 0;
    hit2 = 0;
    rPressed = false;
  }
}
