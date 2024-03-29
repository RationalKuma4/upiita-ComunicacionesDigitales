close all;
clear all;

t=0:.001:2;
x=sin(pi*t);

%% Muestreo
figure(1);
plot(t,x);
title('Se�al original en dominio del tiempo');
xlabel('$t$','Interpreter','Latex');
ylabel('$x(t)$','Interpreter','Latex');
grid on;

Ts=0.1;
trenPulsos=[];
for i=1:length(t)
    if (mod(t(i),Ts)==0)
        trenPulsos(i)=1;
    else
        trenPulsos(i)=0;
    end
end

muestreoIdeal=x.*trenPulsos;
figure(2);
stem(t,muestreoIdeal,'fill','^');
title('Muestreo ideal de la se�al original');
xlabel('$t$','Interpreter','Latex');
ylabel('$x_s(t)$','Interpreter','Latex');
grid on;

%% Cuantizacion
nivelCuantizacion=8192;
rangoDinamicoMax=1;
rangoDinamicoMin=-1;
[x,xc]=Nrud(nivelCuantizacion,rangoDinamicoMax,rangoDinamicoMin);
xc2=[xc xc(nivelCuantizacion)];

figure(3);
stairs(x,xc2);
title('Caracter�stica Entrada-Salida');
xlabel('$x$','Interpreter','Latex');
ylabel('$\hat{x}$','Interpreter','Latex');
grid on;

%% Codificacion
Cod1=['0',num2str(dec2bin(4095*sin(pi*0.1)))];
Cod2=['0',num2str(dec2bin(4095*sin(pi*0.2)))];
Cod3=['1',num2str(dec2bin(4095*sin(pi*0.1)))];
Cod4=['1',num2str(dec2bin(4095*sin(pi*0.2)))];

num1=str2num(Cod1);
format longG;
num2=str2num(Cod2);
format longG;
num3=str2num(Cod3);
format longG;
num4=str2num(Cod4);
format longG;
%num3=num2str(zeros(1,12));
% Cod1
% Cod2
% Cod3
% Cod4

m1 = cellstr(sprintf('%013d',num1));
m2 = cellstr(sprintf('%013d',num2));
m3 = cellstr(sprintf('%013d',num2));
m4 = cellstr(sprintf('%013d',num1));
m5 = cellstr(sprintf('%013d',0));
m6 = cellstr(sprintf('%013d',num3));
m7 = cellstr(sprintf('%09d',num4));
m8 = cellstr(sprintf('%09d',num4));
m9 = cellstr(sprintf('%013d',num3));
m10 = cellstr(sprintf('%013d',0));

Muestra={'Muestra 1';'Muestra 2';'Muestra 3';'Muestra 4';'Muestra 5';...
    'Muestra 6';'Muestra 7';'Muestra 8';'Muestra 9';'Muestra 10'};
%Codigo=[num1;num2;num2;num1;0;num3;num4;num4;num3;0];
Codigo=[m1;m2;m3;m4;m5;m6;Cod4;Cod4;m9;m10]
%Tab=table(Muestra,Codigo)

%% Compresion Digital
Comp1=['0111',Cod1(3),Cod1(4),Cod1(5),Cod1(6)];
Comp2=['0111',Cod2(3),Cod2(4),Cod2(5),Cod2(6)];
Comp3=['1111',Cod3(3),Cod3(4),Cod3(5),Cod3(6)];
Comp4=['1111',Cod4(3),Cod4(4),Cod4(5),Cod4(6)];

Co1=str2num(Comp1);
format longG;
Co2=str2num(Comp2);
format longG;
Co3=str2num(Comp3);
format longG;
Co4=str2num(Comp4);
format longG;

m1 = cellstr(sprintf('%08d',Co1));
m2 = cellstr(sprintf('%08d',Co2));
m3 = cellstr(sprintf('%08d',Co2));
m4 = cellstr(sprintf('%08d',Co1));
m5 = cellstr(sprintf('%08d',0));
m6 = cellstr(sprintf('%08d',Co3));
m7 = cellstr(sprintf('%08d',Co4));
m8 = cellstr(sprintf('%08d',Co4));
m9 = cellstr(sprintf('%08d',Co3));
m10 = cellstr(sprintf('%08d',0));

Muestra1 ={'Muestra 1';'Muestra 2';'Muestra 3';'Muestra 4';'Muestra 5';'Muestra 6';'Muestra 7';'Muestra 8';'Muestra 9';'Muestra 10'};
%Compresion =[Co1;Co2;Co2;Co1;0;Co3;Co4;Co4;Co3;0];
Compresion=[m1;m2;m3;m4;m5;m6;Cod4;Cod4;m9;m10]
%Tab1=table(Muestra1,Compresion)


%% Expansion Digital
Exp1=['01',Comp1(5),Comp1(6),Comp1(7),Comp1(8),'1000000'];
Exp2=['01',Comp2(5),Comp2(6),Comp2(7),Comp2(8),'1000000'];
Exp3=['11',Comp3(5),Comp3(6),Comp3(7),Comp3(8),'1000000'];
Exp4=['11',Comp4(5),Comp4(6),Comp4(7),Comp4(8),'1000000'];

Ex1=str2num(Exp1);
format longG;
Ex2=str2num(Exp2);
format longG;
Ex3=str2num(Exp3);
format longG;
Ex4=str2num(Exp4);
format longG;

%% Decodififcador
m1 = cellstr(sprintf('%013d',Ex1));
m2 = cellstr(sprintf('%013d',Ex2));
m3 = cellstr(sprintf('%013d',Ex2));
m4 = cellstr(sprintf('%013d',Ex1));
m5 = cellstr(sprintf('%013d',0));
m6 = cellstr(sprintf('%013d',Ex3));
m7 = cellstr(sprintf('%09d',Ex4));
m8 = cellstr(sprintf('%09d',Ex4));
m9 = cellstr(sprintf('%013d',Ex3));
m10 = cellstr(sprintf('%013d',0));

Muestra2 ={'Muestra 1';'Muestra 2';'Muestra 3';'Muestra 4';'Muestra 5';'Muestra 6';'Muestra 7';'Muestra 8';'Muestra 9';'Muestra 10'};
Expansion=[m1;m2;m3;m4;m5;m6;Cod4;Cod4;m9;m10]
%Expansion =[Ex1;Ex2;Ex2;Ex1;0;Ex3;Ex4;Ex4;Ex3;0];
%Tab2=table(Muestra2,Expansion)


%% Interpolador
dt=0.001;
x=inline('sin(pi.*t)');
xt=x(t);

fs=10;
T=1/fs;
ts=0:T:2;
xn=sin(pi*ts);
hcero=rectangularPulse((-1:dt:1)*fs);
zoh=conv(muestreoIdeal,hcero,'same');

figure(6)
interpolated1 = 0;
for n = 1 : length(ts)
    interpolated1=interpolated1+xn(n)*pulstran((t-(n-1)*T)/T,0.01,'rectpuls');
    hold on;
    h1=plot(t, interpolated1, 'r--');
    axis([0 2 -1.01 1.01])
end

h2=plot(t,zoh,'m');
hold on;
h3=plot(t,xt,'b');
title('Se�al recuperada');
xlabel('$t$','Interpreter','Latex');
ylabel('$x_r(t)$','Interpreter','Latex');
legend([h3 h1 h2],{'Original','Interpolaci�n','Recuperada'});
grid on;
