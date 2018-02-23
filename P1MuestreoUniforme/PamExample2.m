% this file generates PAM signal
% 
% Created By: JCBRO Labs
% Date: 29/04/2017
% website: www.jcbrolabs.org
% mail: jcbrolabs@gmail.com
close all; clear all;

fc = 20;    %carrier frequency
fm = 2;     % message frequency
fs = 1000;  % sampling frequency
t = 1;  
n = [0:1/fs:t];
n = n(1:end - 1);
duty = 20;
s = square(2*pi*fc*n,duty);
s(find(s<0)) = 0;
m = sin(2*pi*fm*n);
period_samp = length(n)/fc;
ind = [1:period_samp:length(n)];
on_samp = ceil(period_samp * duty/100);
pam = zeros(1,length(n));
for i = 1 : length(ind)
   pam(ind(i):ind(i) + on_samp) = m(ind(i));
end

subplot(3,1,1);plot(n,s);ylim([-0.2 1.2]);
subplot(3,1,2);plot(n,m);ylim([-1.2 1.2]);
subplot(3,1,3);plot(n,pam);ylim([-1.2 1.2]);