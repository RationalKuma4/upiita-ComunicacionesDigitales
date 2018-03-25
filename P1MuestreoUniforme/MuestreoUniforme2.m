Dt = 0.005;
t = 0:Dt:0.5;
xa =  0.5 + sin(4.*pi.*t) - cos(8.*pi.*t) + sin(12.*pi.*t);

% Continuous-time Fourier Transform
Wmax = 2*pi*2000;
K = 500; k = 0:1:K;
W = k*Wmax/K;
Xa = xa * exp(-j*t'*W) * Dt;
Xa = real(Xa);
W = [-fliplr(W), W(2:501)]; % Omega from -Wmax to Wmax
Xa = [fliplr(Xa), Xa(2:501)];
subplot(1,1,1)
subplot(2,1,1);plot(t*1000,xa);
xlabel('t in msec.'); ylabel('xa(t)')
title('Analog Signal')
subplot(2,1,2);plot(W/(2*pi*1000),Xa*1000);
xlabel('Frequency in KHz'); ylabel('Xa(jW)*1000')
title('Continuous-time Fourier Transform')
