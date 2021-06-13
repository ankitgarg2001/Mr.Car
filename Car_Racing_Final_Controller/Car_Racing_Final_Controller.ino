int ledPin13 = 13;
int ledPin12 = 12;
long duration;
int distance;
const int trigPin = 9;
const int echoPin = 10;
const int buttonPinOne = 3;
const int buttonPinTwo = 2;
const int buttonPinThree = 4;
const int buttonPinFour = 5;
int buttonStateOne = 0;
int buttonStateTwo = 0;
int buttonStateThree = 0;
int buttonStateFour = 0;
#include <Wire.h>
#include <LiquidCrystal_I2C.h>

LiquidCrystal_I2C lcd(0x27, 2, 1, 0, 4, 5, 6, 7, 3, POSITIVE);

void setup()
{
  digitalWrite(ledPin13, HIGH);
  delay(5);
  digitalWrite(ledPin13, LOW);
  delay(5);
  digitalWrite(ledPin12, HIGH);
  delay(5);
  digitalWrite(ledPin12, LOW);
  delay(5);
  digitalWrite(ledPin13, HIGH);
  delay(1);
  digitalWrite(ledPin13, LOW);
  delay(1);
  digitalWrite(ledPin12, HIGH);
  delay(1);
  digitalWrite(ledPin12, LOW);
  delay(1);
  Serial.begin(9600);
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);
  pinMode(ledPin13, OUTPUT);
  pinMode(ledPin12, OUTPUT);
  pinMode(buttonPinOne, INPUT);
  pinMode(buttonPinTwo, INPUT);
  pinMode(buttonPinThree, INPUT);
  pinMode(buttonPinFour, INPUT);
  pinMode(6, INPUT);
  lcd.begin(16, 2);
  lcd.clear();
  lcd.print("YOUR SCORE : ");
}

void loop()
{
  lcd.setCursor(13, 0);
  char str = Serial.read();
  lcd.print(str);
  buttonStateOne = digitalRead(buttonPinOne);
  buttonStateTwo = digitalRead(buttonPinTwo);
  buttonStateThree = digitalRead(buttonPinThree);
  buttonStateFour = digitalRead(buttonPinFour);
  if (digitalRead(6) == HIGH)
  {
    Serial.write('6');
  }
  if (buttonStateOne == HIGH)
  {
    Serial.write('q');
  }
  if (buttonStateThree == HIGH)
  {
    Serial.write('e');
  }
  if (buttonStateTwo == HIGH)
  {
    Serial.write('w');
  }
  if (buttonStateFour == HIGH)
  {
    Serial.write('r');
  }
  if (buttonStateOne == LOW)
  {
    Serial.write('0');
    delay(100);
  }
  if (buttonStateFour == LOW)
  {
    Serial.write('0');
    delay(100);
  }
  if (Serial.read() == 'c')
  {
    digitalWrite(trigPin, LOW);
    delayMicroseconds(2);

    digitalWrite(trigPin, HIGH);
    delayMicroseconds(10);
    digitalWrite(trigPin, LOW);

    duration = pulseIn(echoPin, HIGH);
    distance = duration * 0.034 / 2;
    Serial.println(distance);
    if (distance >= 0 && distance <= 6)
    {
      Serial.write('p');
    }
    else if (distance >= 10 && distance <= 16)
    {
      Serial.write('o');
    }
    else if (distance >=  17 && distance <= 22)
    {
      Serial.write('i');
    }
    delay(1);
  }
}
