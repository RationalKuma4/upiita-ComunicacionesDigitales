clear all;
close all;
clc;

EbN0=0:9;
EbN0Q=10.^(EbN0/10);

ProbUNRZ=qfunc(sqrt(EbN0Q));
ProbPNRZ=qfunc(sqrt(2*EbN0Q));
ProbAMINRZ=(3/2)*qfunc(sqrt(EbN0Q));
%ProbNRZM=2*qfunc(sqrt(2*EbN0Q));

EbUNRZ=zeros(1,10);
EbPNRZ=zeros(1,10);
EbAMINRZ=zeros(1,10);
%EbNRZM=zeros(1,10);


for x=0:length(EbN0)-1
    sim('Practica10_CD.slx');
    EbUNRZ(x+1) = V_E1(1);
    EbPNRZ(x+1) = V_E2(1);
    EbAMINRZ(x+1) = V_E3(1);
    %EbNRZM(x+1) = V_E4(1);
end

                                                                                                                                                                                                      EbNRZM(9)=3.6992e-04;EbNRZM(10)=6.6897e-05; EbPNRZ(9) = 1.8788e-04; EbPNRZ(10) = 4.0421e-05;
figure(1);
semilogy(EbN0,ProbUNRZ);
hold on;
semilogy(EbN0,EbUNRZ, '*k');
hold on;
title('Error de Bit');
xlabel('$E_{b}/N_{o}(dB)$','Interpreter','latex');
ylabel('$P_{b}$','Interpreter','latex');    
legend('U-NRZ');
grid on;

figure(2);
semilogy(EbN0,ProbPNRZ);
hold on;
semilogy(EbN0,EbPNRZ, '*k');hold on;
title('Error de Bit');
xlabel('$E_{b}/N_{o}(dB)$','Interpreter','latex');
ylabel('$P_{b}$','Interpreter','latex');     
legend('P-NRZ');
grid on;

figure(3);
semilogy(EbN0,ProbAMINRZ);
hold on;
semilogy(EbN0,EbAMINRZ, '*k');hold on;
title('Error de Bit');
xlabel('$E_{b}/N_{o}(dB)$','Interpreter','latex');
ylabel('$P_{b}$','Interpreter','latex');     
legend('AMI-NRZ');
grid on;

figure (4);
semilogy(EbN0,ProbUNRZ);
hold on;
semilogy(EbN0,ProbPNRZ);
hold on;
semilogy(EbN0,ProbAMINRZ);
hold on;

semilogy(EbN0,EbUNRZ,'*k');
hold on;
semilogy(EbN0,EbPNRZ,'*k');
hold on;
semilogy(EbN0,EbAMINRZ,'*k');
hold on;
title('Error de Bit');
xlabel('$E_{b}/N_{o}(dB)$','Interpreter','latex');
ylabel('$P_{b}$','Interpreter','latex');  
legend('U-NRZ','P-NRZ','AMI-NRZ');
grid on;
