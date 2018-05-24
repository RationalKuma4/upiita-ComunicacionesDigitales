#include <VirtualWire.h>
#define dataPin 9
 
void setup()
{
    Serial.begin(9600);
    Serial.println("Inicio");
    
    vw_setup(2000);
    vw_set_rx_pin(dataPin);
    vw_rx_start();
}
 
void loop()
{
  uint8_t buf[VW_MAX_MESSAGE_LEN];
  uint8_t buflen = VW_MAX_MESSAGE_LEN;
 
  // Recibir dato
  if (vw_get_message((uint8_t *)buf,&buflen))
  {
    String dataString;
    if((char)buf[0]=='a')
    {
        for (int i = 1; i < buflen; i++)
        {
          dataString.concat((char)buf[i]);
        }
        int dataInt = dataString.toInt();  // Convertir a int
        Serial.print("Int: ");
        Serial.println(dataInt);
    }
    else if((char)buf[0]=='b')
    {
        for (int i = 1; i < buflen; i++)
        {
          dataString.concat((char)buf[i]);
        }
        float dataFloat = dataString.toInt();  // Convertir a float
        Serial.print("Float: ");
        Serial.println(dataFloat);
    }
    else if((char)buf[0]=='c')
    {
        for (int i = 1; i < buflen; i++)
        {
          dataString.concat((char)buf[i]);
        }
        float dataFloat = dataString.toInt();  // Convertir a float
        Serial.print("Float: ");
        Serial.println(dataFloat);
    }
  }
}
