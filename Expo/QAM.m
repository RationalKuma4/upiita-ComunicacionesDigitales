clear all;
close all;
clc;

M = 16;                         % Modulation order
x = (0:15)';                    % Integer input
k = log2(M);
y1 = qammod(x,M,'bin');        % 16-QAM output
numSamplesPerSymbol = 1;

% awgn 
EbNo = 10;
snr = EbNo + 10*log10(k) - 10*log10(numSamplesPerSymbol);
receivedSignal = awgn(y1,snr,'measured');

sPlotFig = scatterplot(receivedSignal,1,0,'g.');
hold on
scatterplot(y1,1,0,'k*',sPlotFig)


scatterplot(y1);
text(real(y1)+0.1, imag(y1), dec2bin(x));
title('16-QAM');
axis([-4 4 -4 4]);
xlabel('Fase');ylabel('Cuadratura');
grid on;


M = 64;                         % Modulation order
x = (0:M-1)';                    % Integer input
y1 = qammod(x,M,'bin');        % 16-QAM output



sPlotFig = scatterplot(receivedSignal,1,0,'g.');
hold on
scatterplot(dataMod,1,0,'k*',sPlotFig)

scatterplot(y1);
text(real(y1)+0.1, imag(y1), dec2bin(x));
title('64-QAM');
axis([-8 8 -8 8]);
xlabel('Fase');ylabel('Cuadratura');
grid on;


