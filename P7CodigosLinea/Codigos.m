clc;
clear all;
close all;

ts=1/100;
Tb=1;
N=10;
t=0:ts:N*Tb-ts;
s1=ones(1,100);
td=[];
for nn=1:length(t)
    if(mod(nn,33)==0)
        td(nn)=t(nn);
    else
        td(nn)=0;
    end
end

bitsu=randi([0 1], 1,10);
bitsp=bitsu;
bitsp(bitsp==0)=-1;
bitsg=bitsp;
bitsg(bitsg==-1)=0;

%% U-NRZ
unrz=[];
for n=1:length(bitsu)
    unrz=[unrz s1*bitsu(n)];
end
figure(1);
plot(t, unrz);
% hold on;
% stem(td, unrz);
title('Codigo U-NRZ');
axis([0, N -.5 1.5]);
set(gca,'YTick', [0 1])
set(gca,'xticklabel',bitsu.')
grid on;

%% U-RZ
urz=[];
for n=1:N
    if(bitsu(n)==1)
        urz=[urz s1(1:50)*bitsu(n)];
        urz=[urz s1(51:100)*0];
    else
        urz=[urz s1(1:50)*bitsu(n)];
        urz=[urz s1(51:100)*bitsu(n)];
    end
end
figure(2);
plot(t, urz);
title('Codigo U-RZ');
axis([0, N -.5 1.5]);
set(gca,'YTick', [0 1])
set(gca,'xticklabel',bitsu.')
grid on;

%% P-NRZ
pnrz=[];
for n=1:N
    pnrz=[pnrz s1*bitsp(n)];
end
figure(3);
plot(t, pnrz);
title('Codigo P-NRZ');
axis([0, N -1.5 1.5]);
set(gca,'YTick', [-1 0 1])
set(gca,'xticklabel',bitsg.')
grid on;

%% P-RZ
prz=[];
for n=1:N
    if(bitsp(n)==1)
        prz=[prz s1(1:50)*bitsp(n)];
        prz=[prz s1(51:100)*0];
    else
        prz=[prz s1(1:50)*bitsp(n)];
        prz=[prz s1(51:100)*0];
    end
end
figure(4);
plot(t, prz);
title('Codigo P-RZ');
axis([0, N -1.5 1.5]);
set(gca,'YTick', [-1 0 1])
set(gca,'xticklabel',bitsg.')
grid on;

%% NRZ-M
nrzm=[];
marca=bitsp(1);
for n=1:N
    if(bitsp(n)==1)
        marca=-1*marca;
    end
    nrzm=[nrzm s1*marca];
end
figure(5);
plot(t, (nrzm+1)/2);
title('Codigo NRZ-M');
axis([0, N -.5 1.5]);
set(gca,'YTick', [0 1])
set(gca,'xticklabel',bitsg.')
grid on;

%% NRZ-S
nrzs=[];
marca=bitsp(1);
for n=1:N
    if(bitsp(n)==-1)
        marca=-1*marca;
    end
    nrzs=[nrzs s1*marca];
end
figure(6);
plot(t, (nrzs+1)/2);
title('Codigo NRZ-S');
axis([0, N -.5 1.5]);
set(gca,'YTick', [0 1])
set(gca,'xticklabel',bitsg.')
grid on;

%% AMI NRZ
anrz=[];
factor=-1;
for n=1:N
    if(bitsp(n)==1)
        factor=factor*-1;
        anrz=[anrz s1*bitsp(n)*factor];
    else
        anrz=[anrz s1*bitsp(n)*0];
    end
end
figure(7);
plot(t, anrz);
title('Codigo AMI-NRZ');
axis([0, N -1.5 1.5]);
set(gca,'YTick', [-1 0 1])
set(gca,'xticklabel',bitsg.')
grid on;

%% AMI RZ
arz=[];
factor=-1;
for n=1:N
    if(bitsp(n)==1)
        factor=factor*-1;
        arz=[arz s1(1:50)*bitsp(n)*factor];
        arz=[arz s1(51:100)*0];
    else
        arz=[arz s1*bitsp(n)*0];
    end
end
figure(8);
plot(t, arz);
title('Codigo AMI-RZ');
axis([0, N -1.5 1.5]);
set(gca,'YTick', [-1 0 1])
set(gca,'xticklabel',bitsg.')
grid on;


%% Bi Fase M
s1=[ones(1,50) -1*ones(1,50)];
s2=ones(1,100);
bfm=[];
marca=bitsp(1);
for n=1:N
    marca=-1*marca;
    if(bitsp(n)==1)
        bfm=[bfm s1*bitsp(n)*marca];
        marca=-1*marca;
    else
        bfm=[bfm s2*marca];
    end
end
figure(9);
plot(t, bfm);
title('Codigo Bifase Marca');
axis([0, N -1.5 1.5]);
set(gca,'YTick', [-1 0 1])
set(gca,'xticklabel',bitsg.')
grid on;

%% Bi Fase S
s1=[-1*ones(1,50) ones(1,50)];
s2=ones(1,100);
bfs=[];
marca=bitsp(1);
for n=1:N
    marca=-1*marca;
    if(bitsp(n)==-1)
        bfs=[bfs s1*bitsp(n)*marca];
        marca=-1*marca;
    else
        bfs=[bfs s2*marca];
    end
end
figure(10);
plot(t, bfs);
title('Codigo Bifase Espacio');
axis([0, N -1.5 1.5]);
set(gca,'YTick', [-1 0 1])
set(gca,'xticklabel',bitsg.')
grid on;

%% Manchester Dif
s1=[-1*ones(1,50) ones(1,50)];
s2=ones(1,100);
bfs=[];
marca=bitsp(1);
for n=1:N
    marca=-1*marca;
    if(bitsp(n)==-1)
        bfs=[bfs s1*bitsp(n)*marca];
        marca=-1*marca;
    else
        bfs=[bfs s2*marca];
    end
end
figure(11);
plot(t-.5, bfs);
title('Macnhester Diferencial');
axis([0, N -1.5 1.5]);
set(gca,'YTick', [-1 0 1])
set(gca,'xticklabel',bitsg.')
grid on;


