#define S13 23
#define S12 25
#define S11 27
#define S10 29
#define S9 31
#define S8 33
#define S7 35
#define S6 37
#define S5 39
#define S4 41
#define S3 43
#define S2 45

#define LED1 38
#define LED2 40
#define LED3 42
#define LED4 44
#define LED5 46
#define LED6 48
#define LED7 50

int b13;
int b12;
int b11;
int b10;
int b9;
int b8;
int b7;
int b6;
int b5;
int b4;
int b3;
int b2;
int b1;


void setup() {
  pinMode(S13, INPUT);
  pinMode(S12, INPUT);
  pinMode(S11, INPUT);
  pinMode(S10, INPUT);
  pinMode(S9, INPUT);
  pinMode(S8, INPUT);
  pinMode(S7, INPUT);
  pinMode(S6, INPUT);
  pinMode(S5, INPUT);
  pinMode(S4, INPUT);
  pinMode(S3, INPUT);
  pinMode(S2, INPUT);

  pinMode(LED1, OUTPUT);
  pinMode(LED2, OUTPUT);
  pinMode(LED3, OUTPUT);
  pinMode(LED4, OUTPUT);
  pinMode(LED5, OUTPUT);
  pinMode(LED6, OUTPUT);
  pinMode(LED7, OUTPUT);
  Serial.begin(9600);
  Serial.println("Serial port open");
}

void loop() 
{
  delay(2000);
  int ceros=0, segmentos=7;
  String codigoOchoBits[8] = {"000","001","010","011","100","101","110","111"};
  String abcd="", segmento="", codigo="";
  
  b13 = digitalRead(S13);
  b12 = digitalRead(S12);
  b11 = digitalRead(S11);
  b10 = digitalRead(S10);
  b9 = digitalRead(S9);
  b8 = digitalRead(S8);
  b7 = digitalRead(S7);
  b6 = digitalRead(S6);
  b5 = digitalRead(S5);
  b4 = digitalRead(S4);
  b3 = digitalRead(S3);
  b2 = digitalRead(S2);
  
  String cadenaEntrada = String(b13)+String(b12)+String(b11)+String(b10)+String(b9)+String(b8)+String(b7)
  +String(b6)+String(b5)+String(b4)+String(b3)+String(b2);
  
  ceros=DevuelveCeros(cadenaEntrada);
  segmentos-=ceros;
  abcd=cadenaEntrada;

  if(ceros>=7)
  {
    abcd.remove(ceros+4);
    abcd.remove(0,ceros);
  }
  else
  {
    abcd.remove(ceros+5);
    abcd.remove(0,ceros);
    abcd.remove(0,1);
  }
  
  switch(ceros)
  {
    case 7:
      segmento=codigoOchoBits[0];
    break;
    case 6:
      segmento=codigoOchoBits[1];
    break;
    case 5:
      segmento=codigoOchoBits[2];
    break;
    case 4:
      segmento=codigoOchoBits[3];
    break;
    case 3:
      segmento=codigoOchoBits[4];
    break;
    case 2:
      segmento=codigoOchoBits[5];
    break;
    case 1:
      segmento=codigoOchoBits[6];
    break;
    case 0:
      segmento=codigoOchoBits[7];
    break;
  }
  codigo=segmento+abcd;
  MuestraCodigo(codigo);
}

int DevuelveCeros(String cadenaEntrada)
{
  int ceros=0;
  for(int i=0; i<cadenaEntrada.length()-5; i++)
  {
    if(String(cadenaEntrada.charAt(i))=="0")
    {
      ceros++;
    }
    else
    {
      break;
    }
  }
  return ceros;
}

void MuestraCodigo(String codigo)
{
  digitalWrite(LED1, String(codigo.charAt(0)).toInt());
  digitalWrite(LED2, String(codigo.charAt(1)).toInt());
  digitalWrite(LED3, String(codigo.charAt(2)).toInt());
  digitalWrite(LED4, String(codigo.charAt(3)).toInt());
  digitalWrite(LED5, String(codigo.charAt(4)).toInt());
  digitalWrite(LED6, String(codigo.charAt(5)).toInt());
  digitalWrite(LED7, String(codigo.charAt(6)).toInt());
}


