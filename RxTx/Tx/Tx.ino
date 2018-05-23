/* 
  RF Blink - Transmit sketch 
     Written by ScottC 17 Jun 2014
     Arduino IDE version 1.0.5
     Website: http://arduinobasics.blogspot.com
     Transmitter: FS1000A/XY-FST
     Description: A simple sketch used to test RF transmission.          
 ------------------------------------------------------------- */

 #define rfTransmitPin 4  //RF Transmitter pin = digital pin 4
 #define ledPin 13        //Onboard LED = digital pin 13

 void setup(){
   pinMode(rfTransmitPin, OUTPUT);     
   pinMode(ledPin, OUTPUT);    
 }

 void loop(){
   for(int i=4000; i>5; i=i-(i/3)){
     digitalWrite(rfTransmitPin, HIGH);     //Transmit a HIGH signal
     digitalWrite(ledPin, HIGH);            //Turn the LED on
     delay(2000);                           //Wait for 1 second
     
     digitalWrite(rfTransmitPin,LOW);      //Transmit a LOW signal
     digitalWrite(ledPin, LOW);            //Turn the LED off
     delay(i);                            //Variable delay
   }
 }

/*
  433 MHz RF Module Transmitter Demonstration 1
  RF-Xmit-Demo-1.ino
  Demonstrates 433 MHz RF Transmitter Module
  Use with Receiver Demonstration 1
 
  DroneBot Workshop 2018
  https://dronebotworkshop.com

 
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
}
 
void loop()
{
    const char *msg = "Welcome to the Workshop!";
    rf_driver.send((uint8_t *)msg, strlen(msg));
    rf_driver.waitPacketSent();
    delay(1000);
}

*/


/*#include <VirtualWire.h>

void setup()
{
    Serial.begin(9600);    // Debugging only
    Serial.println("setup");

    // Se inicializa el RF
    vw_setup(2000); // velocidad: Bits per segundo
    vw_set_tx_pin(12); //Pin 2 como salida para el RF 
}

void loop()
{
    char buf[VW_MAX_MESSAGE_LEN]; // Cadena para enviar
    int dato1=millis()/1000; //variable con el tiempo en segundos
    float dato2=3.14;   //segundo dato para enviar
    String str="";  
    
    str="i"+String(dato1); //convertimos el entero a String y agramos un inicio de trama
    str.toCharArray(buf,sizeof(buf)); //convertimos el String en un array
    vw_send((uint8_t *)buf, strlen(buf)); //Enviamos el array
    vw_wait_tx(); //Esperamos hasta que el mensaje se envie
    Serial.println(buf);
    
    
    str="f"+String(dato2); //convertimos el float a String y agramos un inicio de trama
    str.toCharArray(buf,sizeof(buf)); //convertimos el String en un array
    vw_send((uint8_t *)buf, strlen(buf)); ////Enviamos el array
    vw_wait_tx(); //Esperamos hasta que el mensaje se envie


    Serial.println(buf);
    delay(200);
}*/




/*#include <VirtualWire.h>

#define P1 A0
#define P2 A1
#define P3 A2
#define Tx 12

int pval1=0, pval2=0, pval3=0;
 
void setup() 
{
  Serial.begin(9600);
  Serial.println("Inicio de sketch - valores del potenciometro");
  pinMode(P1, INPUT);
  pinMode(P2, INPUT);
  pinMode(P3, INPUT);
  pinMode(Tx, OUTPUT); 

  vw_setup(2000);
  vw_set_tx_pin(Tx);
}
 
void loop() 
{
  delay(1000);
  
  pval1=analogRead(P1);
  Serial.print("El valor es de 1 es = ");
  Serial.println(pval1);

  pval2=analogRead(P2);
  Serial.print("El valor es de 2 es = ");
  Serial.println(pval2);

  pval3=analogRead(P3);
  Serial.print("El valor es de 3 es = ");
  Serial.println(pval3);
  
  char buf[VW_MAX_MESSAGE_LEN]; // Cadena para enviar
  String str="";  
  
  str="a"+String(pval1); //convertimos el entero a String y agramos un inicio de trama
  str.toCharArray(buf,sizeof(buf)); //convertimos el String en un array
  vw_send((uint8_t *)buf, strlen(buf)); //Enviamos el array
  vw_wait_tx(); //Esperamos hasta que el mensaje se envie
  
  str="b"+String(pval2); //convertimos el float a String y agramos un inicio de trama
  str.toCharArray(buf,sizeof(buf)); //convertimos el String en un array
  vw_send((uint8_t *)buf, strlen(buf)); ////Enviamos el array
  vw_wait_tx(); //Esperamos hasta que el mensaje se envie

  str="c"+String(pval3); //convertimos el float a String y agramos un inicio de trama
  str.toCharArray(buf,sizeof(buf)); //convertimos el String en un array
  vw_send((uint8_t *)buf, strlen(buf)); ////Enviamos el array
  vw_wait_tx(); //Esperamos hasta que el mensaje se envie
}*/
