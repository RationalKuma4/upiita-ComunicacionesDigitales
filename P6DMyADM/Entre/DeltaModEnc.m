function cn=DeltaModEnc(x,paso)
    xlen = length(x);
    accum(1) = 0;
    for i=1:xlen
        if(x(i)>=accum(i))
            n(i)=1;
            accum(i+1) = accum(i) + n(i) * paso;
        else
            n(i)=-1;
            accum(i+1) = accum(i) + n(i) * paso;
            tx(i)=0;
        end
    end
    cn = n < 0;
end
