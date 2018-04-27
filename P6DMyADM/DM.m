[s,fs]=audioread('prueba.wav'); %read .wav file
% Delta modulation-demodulation
StepSize=1/15;
%encoder
cn=DeltaModEnc(s, StepSize);
%decoder
Sn=DeltaModDec(StepSize,fs, cn);

audiowrite('pruebaDm.wav',Sn,fs)