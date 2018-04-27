function [k,s,d]=ADeltaModEnc(ent)
    % Encoder
    max=0;
    % Encontramos la razon de cambio
    for i=2:length(ent)
        if max<(ent(i)-ent(i-1))
            max=(ent(i)-ent(i-1));
        end
    end
    
    delta=.0001*(max);
    k=delta;
    
    for i=1:length(ent)
        if i~=1
            e(i)=ent(i)-vq(i-1);
            if e(i)*e(i-1)>0
                delta=2*delta;
                d(i)=1;
            else
                delta=.5*delta;
                d(i)=0;
            end
            eq(i)=delta.*sign(e(i));
            vq(i)=eq(i)+vq(i-1);
        else
            e(1)=ent(1);
            eq(1)=delta.*sign(e(i));
            vq(1)=eq(1);
            d(1)=0;
        end
    end
    s=round((1.+sign(e))./2);
end

    
    
    
    
    
    
    
