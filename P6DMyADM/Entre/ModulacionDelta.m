%% Abrimos el archivo, vemos info y grafica
close all;
clear all;
clc;

nombreArvhivo='prueba.wav';
%audioinfo(nombreArvhivo)
[s,fs]=audioread(nombreArvhivo); 
figure(1);
plot(s);
grid on;
% s=s(:,1);
% dt = 1/fs;
% t = 0:dt:(length(s)*dt)-dt;
% figure(1);
% plot(t,s);
% grid on;

%% Modulacion delta
paso=4;
% encoder
cn=DeltaModEnc(s,paso);
% decoder
sn=DeltaModDec(paso,fs,cn);
audiowrite('pruebaDm.wav',sn,fs);
[ds,dfs]=audioread('pruebaDm.wav'); 
figure(3);
plot(ds);
grid on;
% 
% %% modulación delta adaptativa
% [acod,del]=AdDeltaModEnc(s,fs);
% asn=AdDeltaDec(acod,del,s);
% audiowrite('pruebaADm.wav',asn,fs);
% [ads,adfs]=audioread('pruebaADm.wav'); 
% figure(1);
% plot(ads);
% grid on;
%%

cn=adm_enc(s);
si=adm_dec(cn);
audiowrite('pruebaADm.wav',si,fs);
figure(2);
plot(si);
grid on;

