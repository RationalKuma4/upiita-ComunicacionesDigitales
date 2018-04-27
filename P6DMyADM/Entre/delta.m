function snr=delta(s,paso,fs)
    %encodes and decodes delta
    % input: signal, step for delta, sampling frequency for the decoder
    dmSig = DeltaModEnc(s,paso);
    dmSigDecoded= DeltaModDec(paso,fs,dmSig);
    
    error = s;
    snr=calcSnr(s,error);
    % nice plot
    lenSig=1:length(s);
    lenDm=1:length(lenSig);
    lenErr=1:length(error);
    figure;
    plot(lenSig,s,'r',lenErr,error,'b');
end