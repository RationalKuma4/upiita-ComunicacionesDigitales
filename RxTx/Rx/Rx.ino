
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
/*
  433 MHz RF Module Receiver Demonstration 1
  RF-Rcv-Demo-1.ino
  Demonstrates 433 MHz RF Receiver Module
  Use with Transmitter Demonstration 1
 
  DroneBot Workshop 2018
  https://dronebotworkshop.com
*/
 
// Include RadioHead Amplitude Shift Keying Library
#include <RH_ASK.h>
// Include dependant SPI Library 
#include <SPI.h> 
 
// Create Amplitude Shift Keying Object
RH_ASK rf_driver;
 
void setup()
{
    // Initialize ASK Object
    rf_driver.init();
    // Setup Serial Monitor
    Serial.begin(9600);
}
 
void loop()
{
    // Set buffer to size of expected message
    uint8_t buf[24];
    uint8_t buflen = sizeof(buf);
    // Check if received packet is correct size
    if (rf_driver.recv(buf, &buflen))
    {
      
      // Message received with valid checksum
      Serial.print("Message Received: ");
      Serial.println((char*)buf);         
    }
}

/*#include <VirtualWire.h>

void setup()
{
    Serial.begin(9600);  // Debugging only
    Serial.println("Receptor: setup");

    // Se inicializa el RF
    vw_setup(2000);  // velocidad: Bits per segundo
    vw_set_rx_pin(2);    //Pin 2 como entrada del RF
    vw_rx_start();       // Se inicia como receptor
}

void loop()
{
    uint8_t buf[VW_MAX_MESSAGE_LEN];
    uint8_t buflen = VW_MAX_MESSAGE_LEN;
    int dato1=0;
    float dato2=0.0;
    //verificamos si hay un dato valido en el RF
    if (vw_get_message((uint8_t *)buf,&buflen))
    {
  int i;
  String  DatoCadena="";
        if((char)buf[0]=='i') //verificamos el inicio de trama
        {
            for (i = 1; i < buflen; i++)
            {
          DatoCadena.concat((char)buf[i]);
            }
            dato1=DatoCadena.toInt();
            Serial.print("Dato1 recivido: ");
            Serial.println(dato1);
        }
        else if((char)buf[0]=='f') //verificamos el inicio de trama
        {
            for (i = 1; i < buflen; i++)
            {
          DatoCadena.concat((char)buf[i]);
            }
            dato2=DatoCadena.toFloat();
            Serial.print("Dato2 recivido: ");
            Serial.println(dato2);
        }
    }
}*/



/*#include <VirtualWire.h>

#define RX 0
int rval=0;
 
void setup()
{
    Serial.begin(9600);
    Serial.println("Inicio de sketch - valores del potenciometro");
    
    vw_setup(2000);
    
    vw_set_rx_pin(RX);
    vw_rx_start();
}
 
void loop()
{
  uint8_t buf[VW_MAX_MESSAGE_LEN];
  uint8_t buflen = VW_MAX_MESSAGE_LEN;
  int dato1=0, dato2=0, dato3=0;
  //verificamos si hay un dato valido en el RF
  if (vw_get_message((uint8_t *)buf,&buflen))
  {
    int i;
    String  DatoCadena="";
    if((char)buf[0]=='a') //potenciometro 1
    {
        for (i = 1; i < buflen; i++)
        {
          DatoCadena.concat((char)buf[i]);
        }
        dato1=DatoCadena.toInt();
        Serial.print("Potenciometro 1: ");
        Serial.println(dato1);
    }
    else if((char)buf[0]=='b') //verificamos el inicio de trama
    {
        for (i = 1; i < buflen; i++)
        {
          DatoCadena.concat((char)buf[i]);
        }
        dato2=DatoCadena.toFloat();
        Serial.print("Potenciometro 2: ");
        Serial.println(dato2);
    }
    else if((char)buf[0]=='c') //verificamos el inicio de trama
    {
        for (i = 1; i < buflen; i++)
        {
          DatoCadena.concat((char)buf[i]);
        }
        dato2=DatoCadena.toFloat();
        Serial.print("Potenciometro 3: ");
        Serial.println(dato3);
    }
  }
}
*/
