function d = kD(t)
    a = rem(t,0.05);
    b = rem(t,0.05)~=0;
    t(rem(t,0.05)~=0)=0;
    t(t~=0)=1;
    d=t;
end