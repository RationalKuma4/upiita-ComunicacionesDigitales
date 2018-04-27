clc;
clear all; 
close all;

[y, fs] = audioread('prueba.wav'); 
T=1/fs;
nmax=length(y); 
t=[0:nmax-1]*T; 
%Initialize delta steps 
delta_min = 1; 
delta_max = 16; 
delta_DM = 4; 
delta(1) = delta_min; 
yAdj=(128*y)+127; 

for n=1:nmax 
    if n==1 
        salidaADM(1) = round(yAdj(1)); 
        salidaDM(1) = salidaADM(1);  
        dirADM(1) = 1; 
        dirDM(1) = 1; 
    else
        dirDM(n) = sign(yAdj(n)-salidaDM(n-1)); 
        dirADM(n) = sign(yAdj(n)-salidaADM(n-1)); 
        
        delta(n) = delta(n-1)*2^(dirADM(n-1)*dirADM(n));
        if delta(n) < delta_min 
            delta(n) = delta_min; 
        elseif delta(n) > delta_max 
            delta(n) = delta_max; 
        end
        
        salidaDM(n) = salidaDM(n-1)+dirDM(n)*delta_DM;
        salidaADM(n)=salidaADM(n-1) + dirADM(n)*delta(n); 
    end 
end

sDM = (salidaDM - 127.0)/128.0; 
sADM = (salidaADM - 127.0)/128.0; 

figure('Name','Quantized signal','NumberTitle','off'); 
subplot(1,1,1);
stairs(t,sADM);
title('Quantized WAV file');

figure(2);
plot(t,sDM);

% Remove granular noise and play audio input 
% [B,A] = firl(48,10000/(Fs/2),'low'); 
% lowpass = @(s) filter(B,A,s);
% = lowpass(y); %sound(Y, Fs); 
% 
% Adjust bits back to WAV format for matlab 
% outAdipm = (salidaDM - 127.0)/128.0; 
% koutAdiAADm = (outsigAADm - 127.0)/128.0; 
% outAdjmADm = (outsigMADM - 127.0)/128.0; 
% figure('Name,'Quantized signal','NumberTitle','off'); 
% subplot(1,1,1), stairs(t,outsigmADm,ik-')
% title('Quantized WAV file') ylim([0,256]) ;




