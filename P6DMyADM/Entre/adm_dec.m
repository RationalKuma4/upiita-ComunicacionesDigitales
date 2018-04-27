function [ signal ] = adm_dec( cn )
delta_min = 0.6250/5;   % minimum step size
L = length(cn);     % length of input signal
k=1.5;        % scaling constant

signal = zeros(1,L);  % initializations
delta=ones(1,L);
for i=1:length(cn) % decode binary input as output of adm
    if cn(i)==1
        Mq(i)=delta_min;
    else
        Mq(i)=-1.*delta_min;
    end
end
for n=2:L
    if Mq(n)==Mq(n-1) % if two sequential input values are equal
        delta(n)=k.*delta(n-1); % scale step size
    else
        delta(n)=delta_min; % otherwise equate step size to min step size
    end
 signal(n) = signal(n-1) + delta(n).*Mq(n); % calculate output of adm
end
end