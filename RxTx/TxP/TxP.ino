#include <VirtualWire.h>
#define P1 A2
#define P2 A1
#define P3 A0
#define dataPin 9

int sensorValue1 = 0, sensorValue2 = 0, sensorValue3 = 0;

void setup() 
{
  Serial.begin(9600);
  vw_set_tx_pin(dataPin);
  vw_setup(2000);
}

void loop() 
{
  delay(1000);
  LeerPotenciometros();
  TransmitirValores(sensorValue1, sensorValue2, sensorValue3);
}

void LeerPotenciometros()
{
  sensorValue1 = analogRead(P1);
  sensorValue2 = analogRead(P2);
  sensorValue3 = analogRead(P3); 
  Serial.println(String(sensorValue1)+","+String(sensorValue2)+","+String(sensorValue3));
}

void TransmitirValores(int sensorValue1, int sensorValue2, int sensorValue3)
{
  String str;  
  char buf[VW_MAX_MESSAGE_LEN];

  delay(10);
  // Envio P1
  str = "a" + String(sensorValue1); /// Convertir a string
  str.toCharArray(buf,sizeof(buf)); // Convertir a char array
  vw_send((uint8_t *)buf, strlen(buf)); // Enviar array
  vw_wait_tx(); // Esperar envio

  
  // Envio P2
  str = "b" + String(sensorValue2); /// Convertir a string
  str.toCharArray(buf,sizeof(buf)); // Convertir a char array
  vw_send((uint8_t *)buf, strlen(buf)); // Enviar array
  vw_wait_tx(); // Esperar envio

  
  // Envio P3
  str = "c" + String(sensorValue3); /// Convertir a string
  str.toCharArray(buf,sizeof(buf)); // Convertir a char array
  vw_send((uint8_t *)buf, strlen(buf)); // Enviar array
  vw_wait_tx(); // Esperar envio
}


