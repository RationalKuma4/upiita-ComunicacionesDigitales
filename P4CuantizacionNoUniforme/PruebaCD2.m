%Prácttica No.2 Reconstrucción de señales
%Delgado Gallardo Antonio Alam 
clear all

%Señal original en dominio del tiempo
dt=0.005;
t=0:dt:0.5;
x=inline('0.5+sin((4*pi.*t)+pi/4)-cos(8*pi.*t)+sin(12*pi.*t)');
xt=x(t);
figure(1)
plot(t,xt)
title('Señal original en dominio del tiempo');
xlabel('t');
ylabel('x(t)');

%Señal original en el dominio de la frecuencia 
transformada=fftshift(fft(xt,100));
vector=-100:2:100-1;
figure(2)
stem(vector,abs(transformada./200),'fill','^'); %Division par altura real.
title('Señal original en el dominio de la frecuencia')
xlabel('f')
ylabel('X(f)')


%Obetenemos el muestreo ideal de la señal original

Ts=0.05;
tren=[]
for i=1:length(t)
        if mod(t(i),Ts)==0
           tren(i)=1;
        else
            tren(i)=0;
        end
end
mideal=xt.*tren;
figure(3)
stem(t,mideal,'fill','^','Color','b')
title('Muestreo ideal de la señal original')
xlabel('t')
ylabel('X_s(t)')

%===================== Interpolación ideal ==============================%
%En tiempo 

fs=20;
hideal=sinc((-0.5:dt:0.5)*fs);
ideal=conv(mideal,hideal,'same');

T = 1/fs;
ts = 0 : T : 0.5;
xn = 0.5 + sin(4*pi*ts + pi/4) - cos(8*pi*ts) + sin(12*pi*ts);

figure(4)

interpolated = 0;
for n = 1 : length(ts)
    interpolated = interpolated + xn(n) * sinc((t - (n - 1)*T)/T);
    hold on;
    h1=plot(t, interpolated, 'm--')
end

h2=plot(t,ideal,'g','LineWidth',2)
hold on
h3=plot(t,xt,'b','LineWidth',2)
title('Señal recuperada por interpolación ideal')
xlabel('t')
ylabel('x_r(t)')
legend([h1 h2 h3],{'Interpolación','Recuperada','Original'})


%En frecuencia 
transformada1=fftshift(fft(ideal,100));

for n=1:length(transformada1)

    if abs(transformada1(n)) <= 8
        transformada1(n)=0;
    end
end

figure(5)
stem(vector,abs(transformada1./200),'fill','^'); %Division par altura real.
title('Señal en dominio de la frecuencia (Ideal)')
xlabel('f')
ylabel('X_r(f)')


%===================== Interpolador de orden cero =======================%

%En tiempo 
hcero=rectangularPulse((-0.5:dt:0.5)*fs);
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

%En frecuencia 
trans2=fftshift(fft(zoh,100));

%Filtro igualador 
test = T*(trans2).*(sinc(vector*T).^2);

figure(7)
% stem(vector,abs(test*0.1),'fill','^'); %Division par altura real.
% title('Señal en dominio de la frecuencia (ZOH)')
% xlabel('f')
% ylabel('X_r(f)')
stem(vector,abs(trans2./200),'fill','^'); %Division par altura real.
title('Señal en dominio de la frecuencia (ZOH)')
xlabel('f')
ylabel('X_r(f)')


recuperada1=ifft(test*0.1,100);
% plot(recuperada1)

[a,b]=envelope(recuperada1,9,'peak');


t2=0:(101/20000):0.5;
figure(8)
plot(t2,a.*250)
title('Final recuperada (ZOH)')
xlabel('f')
ylabel('X_r(t)')




%===================== Interpolador de orden uno =======================%

%En tiempo 
huno=triangularPulse((-0.5:dt:0.5)*fs);
foh=conv(mideal,huno,'same');

figure(9)
interpolated3 = 0;
for n = 1 : length(ts)
    interpolated3 = interpolated3 + xn(n) * pulstran((t - (n - 1)*T)/T,0.01,'tripuls');
    hold on;
    h1=plot(t, interpolated3, 'm--')
end


h2=plot(t,foh,'g','LineWidth',2)
hold on
h3=plot(t,xt,'b','LineWidth',2)
title('Señal recuperada por FOH')
xlabel('t')
ylabel('x_r(t)')
legend([h1 h2 h3],{'Interpolación','Recuperada','Original'})


%En frecuencia 
trans3=fftshift(fft(foh,100));

%Filtro igualador 
test2 = T*(trans3).*(sinc(vector*T).^2);

figure(10)
% stem(vector,abs(test2*0.1),'fill','^'); %Division par altura real.
% title('Señal en dominio de la frecuencia (FOH)')
% xlabel('f')
% ylabel('X_r(f)')
stem(vector,abs(trans3./200),'fill','^'); %Division par altura real.
title('Señal en dominio de la frecuencia (FOH)')
xlabel('f')
ylabel('X_r(f)')


recuperada2=ifft(test2*0.1,100);
% plot(recuperada2)

[c,d]=envelope(recuperada1,9,'peak');

figure(11)
plot(t2,abs(c.*250))
title('Final recuperada (FOH)')
xlabel('t')
ylabel('X_r(t)')











