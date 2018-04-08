clear all;
close all;
close all hidden;
clc;

%%
mp3_content = uint16( fileread('comus.m4a') );
niario=dec2bin(mp3_content);

%%
predictor = [0 1]; % y(k)=x(k-1)
partition = [-1:.1:.9];
codebook = [-1:.1:1];
t = [0:pi/50:2*pi];
x = sawtooth(3*t); % Original signal
% Quantize x using DPCM.
encodedx = dpcmenco(x,codebook,partition,predictor);


% Try to recover x from the modulated signal.
decodedx = dpcmdeco(encodedx,codebook,predictor);
plot(t,x,t,decodedx,'--')
legend('Original signal','Decoded signal','Location','NorthOutside');
distor = sum((x-decodedx).^2)/length(x) % Mean square error

%%
[x,fs] = audioread('comus.mp3');
t = 0:1/fs:length(x)/16;
plot(t,x./16);

%%
fid=fopen('comus.m4a', 'r')
y=fread(fid, 'int16');
fclose(fid)
plot(y)
%soundsc(y, 48000);
specgram(y)