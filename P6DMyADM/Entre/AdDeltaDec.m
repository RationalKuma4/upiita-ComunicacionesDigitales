function [xn]=AdDeltaDec(mqrecibida,delta,m)
    Yn = mqrecibida.*delta;
    Xn(1) = Yn(1);
    for k=2:length(m)
        Xn(k) = Yn(k)+Xn(k-1);
    end
    xn=Yn;
end

