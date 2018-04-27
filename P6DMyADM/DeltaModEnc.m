function cn=DeltaModEnc(x, StepSize)
    %DM_encoder constant step size Delta Modulator.
    %function cn=DeltaModulation(x, StepSize)
    %StepSize: Step size for the delta modulator.
    %x: sampled input signal, where fs>=5*Nyquist rate.
    %cn:encoded binary data.
    % __SG 7-30-98
    % Reference[1]: Martin S. Roden, Digital and Data
    % Communication Systems, Prentice-Hall, 1982, pp. 105-110.
    % Reference[2]: L. R. Rabiner, and R. W. Schafer, Digital
    % Processing of Speech Signals, Prentice-Hall, 1978, pp. 216-225.
    %staircase generator and comparator (quantizer)
    xlen = length(x);
    accum(1) = 0;
    for i=1:xlen
        if(x(i)>=accum(i))
            e_tilda_n(i)=1;
            accum(i+1) = accum(i) + e_tilda_n(i) * StepSize;
        else
            e_tilda_n(i)=-1;
            accum(i+1) = accum(i) + e_tilda_n(i) * StepSize;
            tx(i)=0;
        end
    end
    %encoder
    cn = e_tilda_n < 0;
end
