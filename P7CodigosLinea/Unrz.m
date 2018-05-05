function [unrz] = Unrz(x, N)
    % Codigo de linea U-NRZ
    % x = Secuencia de bits
    % N = Numero de muestras
    s1=ones(1,100);
    unrz=[];
    for n=1:N
        unrz=[unrz s1*x(n)];
    end
end

