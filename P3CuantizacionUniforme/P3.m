%% Práctica 3: Cuantización Uniforme
close all;
clear all;
%% 1
% Escriba una funcion en matlab que determine los niveles de representacion
% y los umbrales de descicion de un cuantizador uniforme a partir del rango
% dinamico de la señal de entrada y el numero de niveles de representacion.
t=0:.001:2;
x=sin(2*pi*t);

figure(1);
plot(t, x);
title('$x=\sin(2 \pi t)$','Interpreter','Latex');
xlabel('$t$','Interpreter','Latex');
ylabel('$x(t)$','Interpreter','Latex');
grid on;


%% 2
% Utilice matlab y la funcion del primer inciso para graficar la
% caracteristica de entrada/salida de:
% a. Un cuantizador uniforme de 8 niveles de representacion y un rango
% dinamico de -1 a 1
nivelCuantizacion=8;
rangoDinamicoMax=1;
rangoDinamicoMin=-1;
[x,xc]=Nrud(nivelCuantizacion,rangoDinamicoMax,rangoDinamicoMin);
xc2=[xc xc(nivelCuantizacion)];
figure(2);
stairs(x,xc2);
title('a. Característica Entrada-Salida');
xlabel('$x$','Interpreter','Latex');
ylabel('$\hat{x}$','Interpreter','Latex');
grid on;

% b. Un cuantizador unifrme de 16 niveles de representacion y un rango
% dianmico de -5 a 5
nivelCuantizacion=16;
rangoDinamicoMax=5;
rangoDinamicoMin=-5;
[x,xc]=Nrud(nivelCuantizacion,rangoDinamicoMax,rangoDinamicoMin);
xc2=[xc xc(nivelCuantizacion)];
figure(3);
stairs(x,xc2);
title('b. Característica Entrada-Salida');
xlabel('$x$','Interpreter','Latex')
ylabel('$\hat{x}$','Interpreter','Latex')
grid on;