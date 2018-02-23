clear all
clf;
fs=8000;
Ts=1/fs;
td=1.25e-5;
f0=10000/(2*pi);
t=[0:td:100*td];
y=sin(2*pi*f0*t);
subplot(3,1,1), plot(t,y,'b');      %input signal(message)
xlabel('Time(s)');
ylabel('Amplitude')
hold;
t2=[0:Ts:100*td];
y2=sin(2*pi*f0*t2);
plot(t2,y2,'g*');                   %sampled at 8kHz
y3=zeros(1,length(t));

       
m=1;
for n=1:101;
               
         if t(n)== t2(m);
        m=m+1;     
        y3(n)=y2(m-1);
         else
        y3(n)=y2(m-1);
        
end
end
plot (t,y3,'m');                  %sample and hold

z=ones(1,length(t2));
%-----------------------------Getting Pulse signal at sampling frequency8 khz------------------------------------
c=1;
for  n=1:101;
    
    if t(n)==t2(c);
       z2(n)=z(c);
      c=c+1;
    
else
    z2(n)=0;
end
end
%plot (t,z2)

st=z2.*y;       % resultant of input signal and sampled pulse signal
%plot(t,st)
%------------------------------Procedure to get better graphics of a Flattop Pam Signal-------------------------
 for k=1:101;
      if st(k)~=0&k<101
         st2(k-1)=st(k);
         st2(k)=st(k);
         st2(k+1)=st(k);
    else 
        st2(100)=st(101);
        st2(101)=st(101);
     end
 end

subplot(3,1,2),    
plot (t,st2)            % Pam signal
xlabel('Time(s)');
ylabel('Amplitude');
Sf= fft (st2,512);      % in frequency domain 
mag= abs(Sf);           % magnitude of Sf
f = (0:511)*fs/length(Sf);

subplot(3,1,3),
plot(f,mag);
%-------------------------------------disregard-----------------------------------------------
%plot (t,y6)

%y9=(y6.*y);
%plot (t,y9)
%Y=fft (y3,101);             %S(f)
%mag= abs (Y);               %magnitude of S(f)
%f = (0:100)*fs/length(Y);
%plot(f,mag)                 %magnitude spectrum 



%y4=(square(2*pi*8000*t));
%y5=ones(1,length(t));
%y6=(y5+y4)/2; %pulse sampling at 8000hz
%plot(t,y,'b');




%powerdB=20*log10(mag);
%plot (t,abs(hilbert(y)))

%stem(t2,y2)

%plot (abs(fft(y)))
%plot(linspace(-5*1e9,5*1e9,512),fftshift(abs(fft(Pulse,512))))