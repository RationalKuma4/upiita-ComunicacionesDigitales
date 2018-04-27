function [cn,del]=AdDeltaModEnc(ent,fs)
    for i = 1:length(ent)
        if ent(i) < 0
            modderm(i) = -ent(i);
        else
            modderm(i) = ent(i);
        end
    end
    ts=1/fs;
    delta(1) = ts*(max(modderm));
    
    % Seal a cuantizar 
    % e[n] = m[n] - mq[n-1] luego la cuantizacion de e[n] se obtiene
    % eq[n] = delta(i)*sign(e[n])
    % mq(n)= sumatoria de los eq, ademas de ser la salida cuantizada es el
    % acumulador
    % inicializando
    e(1) = ent(1);
    eq(1)= delta(1)*sign(e(1));
    mq(1)=eq(1);
    
    for k = 2:length(ent)
        e(k) = ent(k)-mq(k-1);
        eq(k)= sign(e(k));
        delta(k) = delta(k-1)*(1.5^(eq(k)*eq(k-1)));
        eq2(k) = delta(k)*eq(k);
        mq(k) = mq(k-1)+eq2(k);
    end
    
    for j = 1:length(mq)
        if eq(j) == 1
            bitsTx(j) = 1;
        elseif eq(j) == -1
            bitsTx(j) = 0;
        else
            bitsTx(j) = 0;
        end  
    end
    
    cn=bitsTx;
    del=delta;
end