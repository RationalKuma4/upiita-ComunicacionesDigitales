close all;
clear all;

dt=0.005;
t=0:dt:1;
x=inline('sin(2*pi.*t)');
xt=x(t);
Ts=0.1;
tren=[]
for i=1:length(t)
    
        if mod(t(i),Ts)==0
           tren(i)=1;
        else
            tren(i)=0;
        end
end

mideal=xt.*tren;
fs=10;
T = 1/fs;
ts = 0 : T : 1;
xn = sin(2*pi*ts);

%===================== Interpolador de orden cero =======================%

%En tiempo 
hcero=rectangularPulse((-1:dt:1)*fs);
zoh=conv(mideal,hcero,'same');

figure(6)
interpolated1 = 0;
for n = 1 : length(ts)
    interpolated1 = interpolated1 + xn(n) * pulstran((t - (n - 1)*T)/T, 0.01, 'rectpuls');
    hold on;
    h1=plot(t, interpolated1, 'm--')
end

h2=plot(t,zoh,'g','LineWidth',2)
hold on
h3=plot(t,xt,'b','LineWidth',2)
title('Señal recuperada por ZOH')
xlabel('t')
ylabel('x_r(t)')
legend([h1 h2 h3],{'Interpolación','Recuperada','Original'})
