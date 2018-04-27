function [sn]=ADeltaModDec(k,s,d)
    % Decoder
    a(1)=k;
    for i=2:(length(d)-1)
        if d(i)>0
            a(i)=2*a(i-1);
        else
            a(i)=.5*a(i-1);
        end
    end
    
    s1=s;
    for i=2:(length(s)-1)
        if s(i)==0
            s1(i)=-1;
        end
    end
    
    vopq(1)=k;
    for i=2:(length(s1)-1)
        vopq(i)=vopq(i-1)+s1(i)*a(i);
    end
    ans=sort(vopq, 'descend');
    vopqmax=ans(1);
    vopq1=vopq./vopqmax;
    
    sn=vopq1;
    
    %y=1/3.*([0 0 vopq1]+[0 vopq1 0]+[vopq1 0 0]);
    %y1=y(2:110000);
    %sn=y1;
    %y2=1/3.*([0 0 vopq1]+[0 vopq1 0]+[vopq1 0 0]);
    %y3=y2(3:(length(s)-2));
    %sn=y3;
end