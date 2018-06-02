#include <VirtualWire.h>
#define dataPin 9
int pot1,pot2,pot3;
 
void setup()
{
    Serial.begin(9600);
    vw_set_rx_pin(dataPin);
    vw_setup(2000);
    vw_rx_start();
}
 
void loop()
{
  uint8_t buf[VW_MAX_MESSAGE_LEN];
  uint8_t buflen = VW_MAX_MESSAGE_LEN;
  String dataString;
  if (vw_get_message((uint8_t *)buf,&buflen))
  {
    for (int i = 1; i < buflen; i++)
    {
      dataString.concat((char)buf[i]);
    }
    Serial.println(dataString);
    /*if((char)buf[0]=='a')
    {
        for (int i = 1; i < buflen; i++)
        {
          dataString.concat((char)buf[i]);
        }
        pot1 = dataString.toInt(); 
        Serial.println(String(pot1)+","+String(pot2)+","+String(pot3));
    }
    else if((char)buf[0]=='b')
    {
        for (int i = 1; i < buflen; i++)
        {
          dataString.concat((char)buf[i]);
        }
        pot2 = dataString.toInt();
        Serial.println(String(pot1)+","+String(pot2)+","+String(pot3));
    }
    else if((char)buf[0]=='c')
    {
        for (int i = 1; i < buflen; i++)
        {
          dataString.concat((char)buf[i]);
        }
        pot3 = dataString.toInt();
        Serial.println(String(pot1)+","+String(pot2)+","+String(pot3));
    }*/
  }
}
