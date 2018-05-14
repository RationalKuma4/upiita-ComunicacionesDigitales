clc;
clear all;
close all;

% inputBits=randi([0 1],1,10); 
% Rb=2e6;  % Bit Rate
% amplitude=1; % Peak-Peak Amplitude
% [time,xiPolar,Fs]=NRZ_Encoder(inputBits,Rb,amplitude,'polar');
% 
% h=spectrum.welch; %Welch spectrum estimator
% Hpsd = psd(h,xiPolar,'Fs',Fs);
% figure(1);
% plotHandle=plot(fy*Fs/2,10*log10(Hpsd));
% set(plotHandle);
% hold on;

% h=spectrum.welch; %Welch spectrum estimator
% Hpsd = psd(h,xiPolar,'Fs',Fs);
% Hpsd=pwelch(xiPolar);
% plot(Hpsd);
% title('PSD of BPSK modulated Data')

% [pxx,f] = pwelch(xiPolar,[],[],[],Fs,'centered','psd');
% plot(f,10*log10(pxx))
% xlabel('Frequency (Hz)')
% ylabel('PSD (dB/Hz)')


inputBits=randi([0 1],1,10000);  % R2008a syntax =&gt; randsrc(1,10000,[0 1]);
Rb=2;  % Bit Rate
amplitude=1; % Peak-Peak Amplitude
[time,xiPolar,Fs]=NRZ_Encoder(inputBits,Rb,amplitude,'manchester');
[pyy,fy]=pwelch(xiPolar,[],[],[],Fs,'centered','psd');
figure(1);
plotHandle=plot(fy*Fs/2,10*log10((pyy)));
set(plotHandle);