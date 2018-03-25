close all;
clear all;

t=0:.005:.5;
w=-100:2:100-1;
x = 0.5 + sin(4.*pi.*t) - cos(8.*pi.*t) + sin(12.*pi.*t);
fs=20;
d=0:1/fs:.5;

%% Grafica original
figure(1)
plot(t,x,'LineWidth',1.5);
title('Señal en el dominio del tiempo')
xlabel('$ t $','Interpreter','latex');
ylabel('$ x(t) $','Interpreter','latex');
axis([0 .5 -1.6 2])
grid on;

fx=fftshift(fft(x,100));
figure(2)
stem(w,abs(fx),'fill','^');
title('Señal en el dominio de la frecuencia')
xlabel('$ f $','Interpreter','latex');
ylabel('$ X(f) $','Interpreter','latex');
axis([-100 100 0 52])
grid on;

%% Interpolacion Ideal


%% Interpolacion de Orden Cero

%% Interpolacion de Primer Orden
