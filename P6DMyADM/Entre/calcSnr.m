function snr=calcSnr(signal,noise)
    % calculates SNR (Signal-To-Noise Ratio)
    % snr = 10 log (sum (signal) ^2 / sum (noise) ^ 2)
    ssignal = sum (signal.^2);
    snoise = sum(noise.^2);
    snr = 10 * log10(ssignal/snoise);
end