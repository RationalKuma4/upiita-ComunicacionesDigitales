clc;
clear all;
close all;

ts=1/100;
Tb=1;
N=1000;
t=0:ts:N*Tb-ts;
s1=ones(1,100);
fs=1;

bitsu=randi([0 1],1,1000);
bitsp=bitsu;
bitsp(bitsp==0)=-1;
bitsg=bitsp;
bitsg(bitsg==-1)=0;

%% U-NRZ
unrz=[];
for n=1:length(bitsp)
    unrz=[unrz s1*bitsp(n)];
end

[pyy,fy]=pwelch(unrz,5000,4000,1e3,1e10,'centered','psd');
figure(1);
plotHandle=plot(fy,10*log10((pyy)));
set(plotHandle);
title('Codigo U-NRZ');
axis([-1e9, 1e9 -110 -70]);
xlabel('Frecuencia (Hz)')
ylabel('dB')
grid on;

%% U-RZ
urz=[];
for n=1:length(bitsu)
    if(bitsu(n)==1)
        urz=[urz s1(1:50)*bitsu(n)];
        urz=[urz s1(51:100)*0];
    else
        urz=[urz s1(1:50)*bitsu(n)];
        urz=[urz s1(51:100)*bitsu(n)];
    end
end

[pyy,fy]=pwelch(urz,5000,4000,1e3,1e10,'centered','psd');
figure(2);
plotHandle=plot(fy,10*log10((pyy)));
set(plotHandle);
title('Codigo U-NRZ');
axis([-1e9, 1e9 -110 -70]);
xlabel('Frecuencia (Hz)')
ylabel('dB')
grid on;

%% P-NRZ
pnrz=[];
for n=1:length(bitsu)
    pnrz=[pnrz s1*bitsp(n)];
end

[pyy,fy]=pwelch(pnrz,5000,4000,1e3,1e10,'centered','psd');
figure(3);
plotHandle=plot(fy,10*log10((pyy)));
set(plotHandle);
title('Codigo P-NRZ');
axis([-1e9, 1e9 -110 -70]);
xlabel('Frecuencia (Hz)')
ylabel('dB')
grid on;

%% P-RZ
prz=[];
for n=1:length(bitsu)
    if(bitsp(n)==1)
        prz=[prz s1(1:50)*bitsp(n)];
        prz=[prz s1(51:100)*0];
    else
        prz=[prz s1(1:50)*bitsp(n)];
        prz=[prz s1(51:100)*0];
    end
end

[pyy,fy]=pwelch(pnrz,5000,4000,1e3,1e10,'centered','psd');
figure(4);
plotHandle=plot(fy,10*log10((pyy)));
set(plotHandle);
title('Codigo P-RZ');
axis([-1e9, 1e9 -110 -70]);
xlabel('Frecuencia (Hz)')
ylabel('dB')
grid on;

%% NRZ-M
nrzm=[];
marca=bitsp(1);
for n=1:length(bitsu)
    if(bitsp(n)==1)
        marca=-1*marca;
    end
    nrzm=[nrzm s1*marca];
end

[pyy,fy]=pwelch(nrzm,5000,4000,1e3,1e10,'centered','psd');
figure(5);
plotHandle=plot(fy,10*log10((pyy)));
set(plotHandle);
title('Codigo NRZ-M');
axis([-1e9, 1e9 -110 -70]);
xlabel('Frecuencia (Hz)')
ylabel('dB')
grid on;

%% NRZ-S
nrzs=[];
marca=bitsp(1);
for n=1:length(bitsu)
    if(bitsp(n)==-1)
        marca=-1*marca;
    end
    nrzs=[nrzs s1*marca];
end

[pyy,fy]=pwelch(nrzs,5000,4000,1e3,1e10,'centered','psd');
figure(6);
plotHandle=plot(fy,10*log10((pyy)));
set(plotHandle);
title('Codigo NRZ-S');
axis([-1e9, 1e9 -110 -70]);
xlabel('Frecuencia (Hz)')
ylabel('dB')
grid on;

%% AMI NRZ
anrz=[];
factor=-1;
for n=1:length(bitsu)
    if(bitsp(n)==1)
        factor=factor*-1;
        anrz=[anrz s1*bitsp(n)*factor];
    else
        anrz=[anrz s1*bitsp(n)*0];
    end
end

[pyy,fy]=pwelch(anrz,5000,4000,1e3,1e10,'centered','psd');
figure(7);
plotHandle=plot(fy,10*log10((pyy)));
set(plotHandle);
title('Codigo AMI NRZ');
axis([-1e9, 1e9 -110 -70]);
xlabel('Frecuencia (Hz)')
ylabel('dB')
grid on;

%% AMI RZ
arz=[];
factor=-1;
for n=1:length(bitsu)
    if(bitsp(n)==1)
        factor=factor*-1;
        arz=[arz s1(1:50)*bitsp(n)*factor];
        arz=[arz s1(51:100)*0];
    else
        arz=[arz s1*bitsp(n)*0];
    end
end

[pyy,fy]=pwelch(arz,5000,4000,1e3,1e10,'centered','psd');
figure(8);
plotHandle=plot(fy,10*log10((pyy)));
set(plotHandle);
title('Codigo AMI RZ');
axis([-1e9, 1e9 -110 -70]);
xlabel('Frecuencia (Hz)')
ylabel('dB')
grid on;

%% Bi Fase M
s1=[ones(1,50) -1*ones(1,50)];
s2=ones(1,100);
bfm=[];
marca=bitsp(1);
for n=1:length(bitsu)
    marca=-1*marca;
    if(bitsp(n)==1)
        bfm=[bfm s1*bitsp(n)*marca];
        marca=-1*marca;
    else
        bfm=[bfm s2*marca];
    end
end

[pyy,fy]=pwelch(bfm,5000,4000,1e3,1e10,'centered','psd');
figure(9);
plotHandle=plot(fy,10*log10((pyy)));
set(plotHandle);
title('Codigo Bi Fase M');
axis([-1e9, 1e9 -110 -70]);
xlabel('Frecuencia (Hz)')
ylabel('dB')
grid on;

%% Bi Fase S
s1=[-1*ones(1,50) ones(1,50)];
s2=ones(1,100);
bfs=[];
marca=bitsp(1);
for n=1:length(bitsu)
    marca=-1*marca;
    if(bitsp(n)==-1)
        bfs=[bfs s1*bitsp(n)*marca];
        marca=-1*marca;
    else
        bfs=[bfs s2*marca];
    end
end

[pyy,fy]=pwelch(bfs,5000,4000,1e3,1e10,'centered','psd');
figure(10);
plotHandle=plot(fy,10*log10((pyy)));
set(plotHandle);
title('Codigo Bi Fase M');
axis([-1e9, 1e9 -110 -70]);
xlabel('Frecuencia (Hz)')
ylabel('dB')
grid on;

%% Manchester Dif
s1=[-1*ones(1,50) ones(1,50)];
s2=ones(1,100);
bfs=[];
marca=bitsp(1);
for n=1:length(bitsu)
    marca=-1*marca;
    if(bitsp(n)==-1)
        bfs=[bfs s1*bitsp(n)*marca];
        marca=-1*marca;
    else
        bfs=[bfs s2*marca];
    end
end

[pyy,fy]=pwelch(bfs,5000,4000,1e3,1e10,'centered','psd');
figure(11);
plotHandle=plot(fy,10*log10((pyy)));
set(plotHandle);
title('Codigo Bi Fase M');
axis([-1e9, 1e9 -110 -70]);
xlabel('Frecuencia (Hz)')
ylabel('dB')
grid on;

