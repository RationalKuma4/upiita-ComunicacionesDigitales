d=[0:0.05:0.5];
y=pulstran(t,d,'rectpuls',0.01);
r=zeros(size(y));
aux=0;
for i=1:length(y)
    if(aux==0 && y(i)==1 )
        r(i)=x(t(i));
        aux=x(t(i));
    elseif(aux~=0 && y(i)==1 )
        r(i)=aux;
    elseif(aux~=0 && y(i)==0)
        r(i)=0;
        aux=0;
    end  
end
figure(7)
hold on
title('Muestreo de cresta plana en el dominio del tiempo')
xlabel('t');
ylabel('x_s(t)');
plot(t,r,'Linewidth',2);

figure(8)
hold on
f=fftshift(fft(r,100));
w=-100:2:100-1;
title('Muestreo de cresta plana en el dominio de la frecuencia')
xlabel('w')
ylabel('F(w)')
stem(w,abs(f),'fill','^');