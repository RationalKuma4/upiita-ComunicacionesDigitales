function [ cn ] = adm_enc( signal )
    delta_min = 0.6250/5; % minimum step size
    k=1.5; 
    m = 0.85
    % scaling constant
    L = length(signal);    % length of input signal
    Mq = zeros(1,L);   %aproximated or quintized signal     
    dq = zeros(1,L);   %quantized error or difference between original signal and aproximated signal 
    cn = zeros(1,L);   %encoded output as a binary signal
    delta=ones(1,L);   
    for n=2:L
        d = signal(n) - Mq(n-1); % error or difference between input (original) signal and approximation
        if d>0  % if error is greater than 0
            dq(n)=delta_min; % equate output to delta_min
        else
            dq(n)=-1.*delta_min; % equate output to -delta_min
        end

        if dq(n)==dq(n-1) && dq(n-1) == dq(n-2) % if two previous outputs are equal
            delta(n)=k.*delta(n-1); % scale step size
        else
            delta(n)=delta_min; % otherwise equate output to min step size
        end
         Mq(n) = Mq(n-1) + delta(n).*dq(n); % calculate approximation signal
    end
    
    for i=1:length(cn) % encode the output as a binary signal
        if dq(i)==delta_min
            cn(i)=1;
        else
            cn(i)=0;
        end
    end
end