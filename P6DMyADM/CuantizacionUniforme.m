%quantizing a sound signal
function []=CuantizacionUniforme(inname,outname, N)
    if nargin < 3
        disp('Usage: sampl_quant(inname,outname, N)');
        disp('inname: input .wav file name');
        disp('outname: output .wav file name');
        disp('N: quantization level, N>1');
        return;
    end;
    
    %read in input signal
    %[x,fs,N0]=wavread(inname);
    [x,fs]=audioread(inname);
    xmin=min(x); 
    xmax=max(x);
    Q=(xmax-xmin)/N;
    disp('xmin,xmax,N,Q');
    disp([xmin,xmax,N,Q]); 
    
    signo=sign(x);
    ff=floor((abs(x)+Q./2)./Q);
    redd=floor((abs(x)+Q/2)/Q);
    %apply uniform quantization on each sample
    xq=sign(x).*(floor((abs(x)+Q/2)/Q)*Q);
    
    %compare sound quality
    audiowrite(xq,fs,outname);
    sound(x,fs);
    pause;
    sound(xq,fs);
    
    %plot waveforms over the entire period
    t=1:length(x);
    figure; 
    plot(t,x,'r:');
    hold on; 
    plot(t,xq,'b-');
    axis tight; 
    grid on;
    
    %plot waveform over a selected period
    t=5000:5100;
    figure; plot(t,x(5000:5100),'r:');
    hold on; plot(t,xq(5000:5100),'b-');
    axis tight; grid on; 
end