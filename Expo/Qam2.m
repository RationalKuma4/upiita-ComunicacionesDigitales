clear all;
close all;
clc;

M = 16;                     % Size of signal constellation
k = log2(M);                % Number of bits per symbol
n = 30000;                  % Number of bits to process
numSamplesPerSymbol = 1;    % Oversampling factor

rng default                 % Use default random number generator
dataIn = randi([0 1],n,1);  % Generate vector of binary data

dataInMatrix = reshape(dataIn,length(dataIn)/k,k);   % Reshape data into binary k-tuples, k = log2(M)
dataSymbolsIn = bi2de(dataInMatrix);                 % Convert to intege

dataMod = qammod(dataSymbolsIn,M,'bin');         % Binary coding, phase offset = 0
dataModG = qammod(dataSymbolsIn,M); % Gray coding, phase offset = 0

EbNo = 10;
snr = EbNo + 10*log10(k) - 10*log10(numSamplesPerSymbol);

receivedSignal = awgn(dataMod,snr,'measured');
receivedSignalG = awgn(dataModG,snr,'measured');

sPlotFig = scatterplot(receivedSignal,1,0,'g.');
hold on
grid on;
scatterplot(dataMod,1,0,'k*',sPlotFig)
text(real(dataMod)+0.1, imag(dataMod), dec2bin(n))


