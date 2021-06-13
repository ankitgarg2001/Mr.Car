int count = 0;

void call_location_single()
{
  if (z4 == 0 && enemy_1y == -180)
  {
    z4 = 1;
  }
}

void collision_single() //Checks collision
{
  float d5 = dist(enemy_location1[0] + 45, enemy_1y + 180/2, car_1x + 45, car_1y); 
  float d6 = dist(enemy_location1[1] + 45, enemy_1y + 180/2, car_1x + 45, car_1y);
  float d7 = dist(enemy_location1[0] + 45, enemy_1y, car_1x + 45, car_1y + 90); 
  float d8 = dist(enemy_location1[1] + 45, enemy_1y, car_1x + 45, car_1y + 90);
  if (d5 <= 45*1.5 || d6 <= 45*1.5 || d7 <= 45*1.5 || d8 <= 45*1.5)
  {
    stage = 5;
    hit3 = 1;
  }
}

void gameover_single()
{
  if (hit3 == 1)
  {
    image(end[3], 0, 0);
    textSize(70);
    textAlign(CENTER);
    text(count, width/2 + 290, height/2 - 15);
    textAlign(LEFT);
    String q = str(count);
    myPort.write(q);
  }
  int val = myPort.read();
  if (val == '6')
  {
    enemy_1y = -180;
    stage = 4;
    count = 0;
    hit3 = 0;
    rPressed = false;
  }
}

void display_single() //Displays enemy
{
  if (z4 == 1)
  {
    enemy_location1[0] = select_location1();
    enemy_location1[1] = select_location1();
    z4 = 0;
  }
  if (enemy_1y <= 864)
  {
    image(img_enemy1, enemy_location1[0], enemy_1y);
    image(img_enemy3, enemy_location1[1], enemy_1y);
    enemy_1y += enemy_speed; //enemy's speed
    textSize(50);
    textAlign(LEFT);
    text("Your Score : " + count, width/2 + 80, 60);
  } else
  {
    count += 1; //Score incremented 
    enemy_1y = -180;
  }
}
