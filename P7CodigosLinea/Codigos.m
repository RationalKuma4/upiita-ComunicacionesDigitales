clc;
clear all;
close all;

ts=1/100;
Tb=1;
N=10;
t=0:ts:N*Tb-ts;
s1=ones(1,100);

%% U-NRZ
bits=randi([0 1], 1,10);
unrz=[];
for n=1:N
    unrz=[unrz s1*bits(n)];
end
figure(1);
plot(t, unrz);
title('Codigo U-NRZ');
axis([0, N -.5 1.5]);
set(gca,'xticklabel',bits.')
grid on;

%% U-RZ
bits=randi([0 1], 1,10);
urz=[];
for n=1:N
    if(bits(n)==1)
        urz=[urz s1(1:50)*bits(n)];
        urz=[urz s1(51:100)*0];
    else
        urz=[urz s1(1:50)*bits(n)];
        urz=[urz s1(51:100)*bits(n)];
    end
end
figure(2);
plot(t, urz);
title('Codigo U-RZ');
axis([0, N -.5 1.5]);
set(gca,'xticklabel',bits.')
grid on;

%% P-NRZ
%bits=randi([-1 1], 1,10);
bits=randint(1,N)*2-1;
pnrz=[];
for n=1:N
    pnrz=[pnrz s1*bits(n)];
end
figure(3);
plot(t, pnrz);
title('Codigo P-NRZ');
axis([0, N -1.5 1.5]);
bits(bits==-1)=0;
set(gca,'xticklabel',bits.')
grid on;

%% P-RZ
bits=randint(1,N)*2-1;
prz=[];
for n=1:N
    if(bits(n)==1)
        prz=[prz s1(1:50)*bits(n)];
        prz=[prz s1(51:100)*0];
    else
        prz=[prz s1(1:50)*bits(n)];
        prz=[prz s1(51:100)*0];
    end
end
figure(4);
plot(t, prz);
title('Codigo P-RZ');
axis([0, N -1.5 1.5]);
bits(bits==-1)=0;
set(gca,'xticklabel',bits.')
grid on;

%% NRZ-M
bits=randint(1,N)*2-1;
nrzm=[];
marca=bits(1);
for n=1:N
    if(bits(n)==1)
        marca=-1*marca;
    end
    nrzm=[nrzm s1*marca];
end
figure(5);
plot(t, nrzm);
title('Codigo NRZ-M');
axis([0, N -1.5 1.5]);
bits(bits==-1)=0;
set(gca,'xticklabel',bits.')
grid on;

%% NRZ-S
bits=randint(1,N)*2-1;
nrzs=[];
marca=bits(1);
for n=1:N
    if(bits(n)==-1)
        marca=-1*marca;
    end
    nrzs=[nrzs s1*marca];
end
figure(6);
plot(t, nrzs);
title('Codigo NRZ-S');
axis([0, N -1.5 1.5]);
bits(bits==-1)=0;
set(gca,'xticklabel',bits.')
grid on;

%% AMI NRZ
bits=randint(1,N)*2-1;
pnrz=[];
for n=1:N
    pnrz=[pnrz s1*bits(n)];
end
figure(3);
plot(t, pnrz);
title('Codigo P-NRZ');
axis([0, N -1.5 1.5]);
bits(bits==-1)=0;
set(gca,'xticklabel',bits.')
grid on;

%% AMI RZ


%% Bi Fase M


%% Bi Fase S


%% Manchester Dif



