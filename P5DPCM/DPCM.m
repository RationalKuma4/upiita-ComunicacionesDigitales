clear all;
close all;
close all hidden;
clc;

% Abrir archivo
fid = fopen ('comus.m4a','r');
audioinfo('comus.m4a')

%Generar la señal leyendo en 16 bits
[m,count] = fread (fid,'int16');
count = 15000;
Fs = 8000;
Ts = 1;
muestras = (2*Fs)+Ts;
% Vector de tiempo
tiempo = [1:Fs/64];
% valor maximo de la funcion
Mp = max (m);
bits = 6;
niveles = 2^bits;
bit_rate = Fs*bits;

alpha = 0.45;

% Valor de inicio
dif_sig(1) = m(1);

% Calculo de los coeficientes
for k = 2:count,
    dif_sig(k) = m(k) - alpha*m(k-1);
end

% Valor maximo de la señal de entrada
Dp = max (dif_sig);
% Paso de cuantizacion
step_size = (2*Mp)/niveles;

% Cuantizacion
for k = 1:muestras,
    samp_in(k) = m(k*Ts);
    quant_in(k) = samp_in(k)/step_size;
    error(k) = (samp_in(k) - quant_in(k))/muestras;
end

% quant_in = diff_sig/step_size;
% Calculo de señal cuantizada
signS = sign (m);
quant_out = quant_in;
for i = 1:count,
    S(i) = abs (quant_in(i)) + 0.5;
    quant_out(i) = signS(i)*round(S(i))*step_size;
end

% decodificacion
s_out = quant_out;
s_out(1) = quant_out(1);
for k = 2:count,
    s_out(k) = quant_out(k) + alpha*s_out(k-1);
end

% ruido de cuantizacion
Nq = (((step_size)^2)/12)*((Mp/Dp)^2);

% relacion señal a ruido
SNR = 1.5*(niveles^2);
SNR_db = 10*log10(SNR);

% Señal original
figure(1);
plot(tiempo,m(tiempo));
title('Señal de entrada');
xlabel('t');
ylabel('m(t)');
grid on;

% Cuantizacion
figure(2);
stem(tiempo,quant_in(tiempo),'fill','^');
title('Señal cuantizada');
xlabel('t');
ylabel('Niveles');
grid on;

% Señal DPCM
figure(3);
plot(tiempo,s_out(tiempo));
title('Señal codificada');
xlabel('t');
ylabel('dq(t)');
grid on;

% Error
figure(4);
plot(tiempo,error(tiempo));
title('Error de señal');
xlabel('t');
ylabel('e(t)');
grid on;

figure(5);
plot(tiempo,m(tiempo),tiempo,s_out(tiempo),'r');
title('Comparacion de señales');
xlabel('t');
ylabel('m(t)');
grid on;


predictor = [0 1]; % y(k)=x(k-1)
partition = [-1:.1:.9];
codebook = [-1:.1:1];
x = m(tiempo); % Original signal
% Quantize x using DPCM.
encodedx = dpcmenco(x,codebook,partition,predictor);
audiowrite('test.flac',encodedx,48000,'BitsPerSample',24,...
'Comment','This is my new audio file.');
audioinfo('test.flac')

% Try to recover x from the modulated signal.
decodedx = dpcmdeco(encodedx,codebook,predictor);
audiowrite('test.flac',encodedx,48000,'BitsPerSample',24,...
'Comment','This is my new audio file.');
audioinfo('test2.flac')


clear all