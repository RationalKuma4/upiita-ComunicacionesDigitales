close all;
clear all;

t=0:.001:2;
x=sin(2*pi*t);

%% Muestreo
figure(1);
plot(t,x);
title('Señal original en dominio del tiempo');
xlabel('$t$','Interpreter','Latex');
ylabel('$x(t)$','Interpreter','Latex');
grid on;

Ts=0.05;
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
title('Muestreo ideal de la señal original');
xlabel('$t$','Interpreter','Latex');
ylabel('$x_s(t)$','Interpreter','Latex');
grid on;

%% Cuantizacion
nivelCuantizacion=2^13;
rangoDinamicoMax=1;
rangoDinamicoMin=-1;
[x,xc]=Nrud(nivelCuantizacion,rangoDinamicoMax,rangoDinamicoMin);
xc2=[xc xc(nivelCuantizacion)];

figure(3);
stairs(x,xc2);
title('a. Característica Entrada-Salida');
xlabel('$x$','Interpreter','Latex');
ylabel('$\hat{x}$','Interpreter','Latex');
grid on;

%% Codificacion


%% Compresion Digital