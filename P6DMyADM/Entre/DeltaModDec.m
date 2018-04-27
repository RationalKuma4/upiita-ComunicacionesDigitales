function [sn]=DeltaModDec(paso,fs,cn)
    xlen = length(cn);
    Ts=1/fs;
    n=0:Ts:Ts*(xlen-1);
    xlen = length(cn);
    acum(1) = 0;
    for i=1:xlen
        if(cn(i)==0)
            acum(i+1) = acum(i)+paso;
        else
            acum(i+1) = acum(i)-paso;
        end
    end
    sn=acum;
end