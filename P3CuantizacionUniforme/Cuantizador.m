function [s] = Cuantizador(L, x)
    x_max=max(max(x));
    escalon=(2*x_max)/L;
    y=zeros(1,L+1);
    Y=zeros(1,L);
    y(1)=-x_max;
    
    for i=1:L
        y(i+1)=y(i)+escalon;
        Y(i)=(y(i)+y(i+1))/2;
    end
    
    sig=zeros(1,length(x));
    for i=1:length(x)
        aux=Y(1);
        for j=0:length(y)
            if(sig==0)
                if(x(i)>=Y(j))
                    sig(i)=aux;
                else
                    aux=Y(j);
                end
            end
        end
    end
    s=sig;
end