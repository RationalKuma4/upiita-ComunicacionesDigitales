clc
clear all
close all 

w = [0:64];
g = [-10:70];
n = length(g);
%Ventana rectangular
r = zeros(1,n);
for k = 1:n
    if g(k)>=0 && g(k)<=64
        r(k)= 1;
    else
        r(k)=0;
    end
end

plot (g,r); title ('1) Ventana rectangular '), xlabel('n'), ylabel('Amplitud'); axis([-10 n 0 1.2])

%Ventana triangular
t = zeros (1,n);
c = 0;
for k =1:n
    if g(k)>=0 && g(k)<=32
       t(k) = (2*c)/64;
        c = c+1;
    elseif g(k)>= 33 && g(k)<=64
        t(k) = 2 - (2*c)/64;
        c = c+1;
    else
        t(k) = 0;
    end
end

figure
plot (g,t); title ('2) Ventana triangular '), xlabel('n'), ylabel('Amplitud'); axis([-10 n 0 1.2])

%Ventanda de Hann
h = zeros (1,n);
c = 0;
for k =1:n
    if g(k)>=0 && g(k)<=64
        h(k) = 0.5 - 0.5*cos(2*pi*c/64);
        c = c+1;
    else
        r(k) = 0;
    end
end

figure
plot (g,h); title ('3) Ventana de Hann '), xlabel('n'), ylabel('Amplitud'); axis([-10 n 0 1.2])

%Ventanda de Hamming
ham = zeros (1,n);
c = 0;
for k =1:n
    if g(k)>=0 && g(k)<=64
        ham(k) = 0.54 - 0.46*cos(2*pi*c/64);
        c = c+1;
    else
        r(k) = 0;
    end
end

figure
plot (g,ham); title ('4) Ventana de Hamming '), xlabel('n'), ylabel('Amplitud'); axis([-10 n 0 1.2])

%Ventanda de Blackman
b = zeros (1,n);
c = 0;
for k =1:n
    if g(k)>=0 && g(k)<=64
        b(k) = 0.42 - 0.5*cos(2*pi*c/64) + 0.08*cos(4*pi*c/64);
        c = c+1;
    else
        r(k) = 0;
    end
end

figure
plot (g,b); title ('5) Ventana de Blackman '), xlabel('n'), ylabel('Amplitud'); axis([-10 n 0 1.2])


%Graficas a 64 muestras 
r64 = zeros(1,64);
t64 = zeros(1,64);
h64 = zeros(1,64);
ham64 = zeros(1,64);
b64 = zeros(1,64);

c = 0;
for k =1:n
    if g(k)>=0 && g(k)<64
        c = c + 1;
        r64(c) = r(k);
        t64(c) = t(k);
        h64(c) = h(k);
        ham64(c) = ham(k);
        b64(c) = b(k);
    end
end

%Calculo de las DFT
tfr = fft(r64,1024);
tft = fft(t64,1024);
tfh = fft(h64,1024);
tfham = fft(ham64,1024);
tfb = fft(b64,1024);

g2 = linspace(-pi, pi, 1024); 
%[-pi:2*pi/1023:pi];

tfr = fftshift(tfr);
tft = fftshift(tft);
tfh = fftshift(tfh);
tfham = fftshift(tfham);
tfb = fftshift(tfb);


figure
plot (g2, 20*log10(abs(tfr))); title ('1)Espectro de la ventana rectangular '), xlabel('f'), ylabel('dB'); 

figure
plot (g2, 20*log10(abs(tft))); title ('2)Espectro de la ventana triangular '), xlabel('f'), ylabel('dB'); 

figure
plot (g2, 20*log10(abs(tfh))); title ('3)Espectro de la ventana de Hann '), xlabel('f'), ylabel('dB'); 

figure
plot (g2, 20*log10(abs(tfham))); title ('4)Espectro de la ventana de Hamming '), xlabel('f'), ylabel('dB'); 

figure
plot (g2, 20*log10(abs(tfb))); title ('5)Espectro de la ventana de Blackman '), xlabel('f'), ylabel('dB'); 


%Vetanas de 32 y 256  
r32 = zeros(1,256);
t32 = zeros(1,256);
h32 = zeros(1,256);
ham32 = zeros(1,256);
b32 = zeros(1,256);
r256 = zeros(1,256);
t256 = zeros(1,256);
h256 = zeros(1,256);
ham256 = zeros(1,256);
b256 = zeros(1,256);

%ventana rectangular
for k = 1:256
    r256(k) = 1;
    if k<=32
        r32(k)= 1;
    end
end


%Ventana triangular
for k =1:256
    if k<=16
       t32(k) = (2*(k-1))/32;
    elseif k>= 17 && k<=32
        t32(k) = 2 - (2*(k-1))/32;
    end
    if k<=128
        t256(k) =  (2*(k-1))/256;
    elseif k>=129 && k<=256;
        t256(k) = 2 - (2*(k-1))/256;
    end
end

%Ventanda de Hann
for k =1:256
    if k<=32
        h32(k) = 0.5 - 0.5*cos(2*pi*(k-1)/32);
    end
    h256(k) = 0.5 - 0.5*cos(2*pi*(k-1)/256);
end


%Ventanda de Hamming
for k =1:256
    if k<=32
        ham32(k) = 0.54 - 0.46*cos(2*pi*k/32);
    end
    ham256(k) = 0.54 - 0.46*cos(2*pi*k/256);
end

%Ventanda de Blackman
for k =1:256
    if k<=32
        b32(k) = 0.42 - 0.5*cos(2*pi*(k-1)/32) + 0.08*cos(4*pi*(k-1)/32);
    end
    b256(k) = 0.42 - 0.5*cos(2*pi*(k-1)/256) + 0.08*cos(4*pi*(k-1)/256);
end


%Funcion a la que aplicarle la ventana

l = [0:255];

x = 0.58*cos(2*pi*(0.22)*l) + cos(2*pi*0.26*l);


%Ventaneo a 32 muestras 
xr32 = x.*r32;
xt32 = x.*t32;
xh32 = x.*h32;
xham32 = x.*ham32;
xb32 = x.*b32;

%Ventaneo a 256 muestras
xr256 = x.*r256;
xt256 = x.*t256;
xh256 = x.*h256;
xham256 = x.*ham256;
xb256 = x.*b256;


%Calculo el espectro en frecuencia de las ventanas

tfr32 = fft(xr32,1024);
tft32 = fft(xt32,1024);
tfh32 = fft(xh32,1024);
tfham32 = fft(xham32,1024);
tfb32 = fft(xb32,1024);


tfr256 = fft(xr256,1024);
tft256 = fft(xt256,1024);
tfh256 = fft(xh256,1024);
tfham256 = fft(xham256,1024);
tfb256 = fft(xb256,1024);

g3 = [-pi:2*pi/31:pi];
g4 = [-pi:2*pi/255:pi];

tfr32 = fftshift(tfr32);
tft32 = fftshift(tft32);
tfh32 = fftshift(tfh32);
tfham32 = fftshift(tfham32);
tfb32 = fftshift(tfb32);

tfr256 = fftshift(tfr256);
tft256 = fftshift(tft256);
tfh256 = fftshift(tfh256);
tfham256 = fftshift(tfham256);
tfb256 = fftshift(tfb256);


figure
stem (l, x); title ('Señal original'), xlabel('n'), ylabel('Amplitud'); 


figure
stem (l, xr32); title ('Ventaneo rectangular 32 muestras'), xlabel('n'), ylabel('Amplitud'); 

figure
stem (l, xr256); title ('Ventaneo rectangular 256 muestras'), xlabel('n'), ylabel('Amplitud'); 

figure
stem (l, xt32); title ('Ventaneo triangular 32 muestras'), xlabel('n'), ylabel('Amplitud'); 

figure
stem (l, xt256); title ('Ventaneo triangular 256 muestras'), xlabel('n'), ylabel('Amplitud'); 

figure
stem (l, xh32); title ('Ventaneo Hann 32 muestras'), xlabel('n'), ylabel('Amplitud'); 

figure
stem (l, xh256); title ('Ventaneo Hann 256 muestras'), xlabel('n'), ylabel('Amplitud'); 

figure
stem (l, xham32); title ('Ventaneo Hamming 32 muestras'), xlabel('n'), ylabel('Amplitud'); 

figure
stem (l, xham256); title ('Ventaneo Hamming 256 muestras'), xlabel('n'), ylabel('Amplitud'); 

figure
stem (l, xb32); title ('Ventaneo Blackman 32 muestras'), xlabel('n'), ylabel('Amplitud'); 

figure
stem (l, xb256); title ('Ventaneo Blackman 256 muestras'), xlabel('n'), ylabel('Amplitud'); 

figure
plot (g2, 20*log10(abs(tfr32))); title ('Espectro de la ventana de rectangular 32 muestras '), xlabel('f'), ylabel('dB'); 

figure
plot (g2, 20*log10(abs(tfr256))); title ('Espectro de la ventana de rectangular 256 muestras '), xlabel('f'), ylabel('dB'); 

figure
plot (g2, 20*log10(abs(tft32))); title ('Espectro de la ventana de triangular 32 muestras '), xlabel('f'), ylabel('dB'); 

figure
plot (g2, 20*log10(abs(tft256))); title ('Espectro de la ventana de triangular 256 muestras '), xlabel('f'), ylabel('dB'); 

figure
plot (g2, 20*log10(abs(tfh32))); title ('Espectro de la ventana de Hann 32 muestras '), xlabel('f'), ylabel('dB'); 

figure
plot (g2, 20*log10(abs(tfh256))); title ('Espectro de la ventana de Hann 256 muestras '), xlabel('f'), ylabel('dB'); 

figure
plot (g2, 20*log10(abs(tfham32))); title ('Espectro de la ventana de Hamming 32 muestras '), xlabel('f'), ylabel('dB'); 

figure
plot (g2, 20*log10(abs(tfham256))); title ('Espectro de la ventana de Hamming 256 muestras '), xlabel('f'), ylabel('dB'); 

figure
plot (g2, 20*log10(abs(tfb32))); title ('Espectro de la ventana de Blackman 32 muestras '), xlabel('f'), ylabel('dB'); 

figure
plot (g2, 20*log10(abs(tfb256))); title ('Espectro de la ventana de Blackman 256 muestras '), xlabel('f'), ylabel('dB'); 
