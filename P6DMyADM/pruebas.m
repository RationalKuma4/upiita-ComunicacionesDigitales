
f = 50;
ts=1/(f*300);  %secuencia finita de muestras espaciadas Ts: periodo de muestreo
fs=1/ts;       %frecuencia de muestreo
tfinal=0.125;
t=0:ts:tfinal;
m = (exp(-2*pi*5*t).*sin(2*pi*50*t)) + sin(2*pi*4*t); %m es la seal mensaje

%___________________Proceso modulacion de ADM_____________________%
% Para encontrar el tamao de paso(delta) optimo es necesario obtener
% el maximo valor de la razon de velocidad de cambio de la seal mensaje
% la razon de velocidad se obtiene derivando la seal mensaje.
% realizando la derivada
derm = (2*pi)*exp(-2*pi*5*t).*(50*cos(2*pi*50*t) - 5*sin(2*pi*50*t)) + 8*pi*cos(2*pi*4*t);

% calculando el modulo del vector derivada
for i = 1:length(derm),
    if derm(i) < 0
        modderm(i) = -derm(i);
    else
        modderm(i) = derm(i);
    end
end

% calculando la maxima razon de cambio, el tamao de paso optimo inicial
delta(1) = ts*(max(modderm));
       
time = [1:fs/128];

% Seal a cuantizar 
% e[n] = m[n] - mq[n-1] luego la cuantizacion de e[n] se obtiene
% eq[n] = delta(i)*sign(e[n])
% mq(n)= sumatoria de los eq, ademas de ser la salida cuantizada es el
% acumulador
% inicializando
e(1) = m(1);
eq(1)= delta(1)*sign(e(1));
mq(1)=eq(1);

% calculando el resto de diferencias entre la seal mensaje y la seal a la
% salida del acumulador.
for k = 2:length(m),
   e(k) = m(k)-mq(k-1);
   eq(k)= sign(e(k));
   delta(k) = delta(k-1)*(1.5^(eq(k)*eq(k-1))); %me permite encontrar el delta(k) optimo
   eq2(k) = delta(k)*eq(k);                     %se realiza operacion de delta(k)con la cuantizacion
   mq(k) = mq(k-1)+eq2(k);
end

%Modulo de codificacion de linea NRZ unipolar
A = 5;
for j = 1:length(mq),
    if eq(j) == 1
        codi(j) = A;
        bitsTx(j) = 1;
    elseif eq(j) == -1
        codi(j) = 0;
        bitsTx(j) = 0;
    else
        codi(j) = 0;
        bitsTx(j) = 0;
    end         
end

% ________________Seal pasando a traves de un Canal AWGN____________%
scanal = awgn(codi,snr);

%____________________Proceso de Demodulacion de ADM__________________%
% Codigo necesario para Regenerar o no regenerar la seal Tx una vez Rx.
popup_sel_index = get(handles.popregen, 'Value');
switch popup_sel_index
    case 1  
        scanal = scanal;
    case 2
        for i=1:length(scanal),
            if (scanal(i)>=-2.4) & (scanal(i)<=0.8)
                scanal(i) = 0;
            elseif (scanal(i)>=2.4) & (scanal(i)<=7.4)
                scanal(i) = A;
            else
                scanal(i) = A;
            end
        end
end

%Estableciendo los bits en el receptor a partir de la seal Rx scanal
%a partir de los umbrales TTL de (0-0.4)0 logico de (2.4-5) 1 logico

for i=1:length(scanal),
    if (scanal(i)>=-0.4) & (scanal(i)<=0.4)
        bitsRx(i) = 0;
    elseif (scanal(i)>=2.4) & (scanal(i)<=5)
        bitsRx(i) = 1;
    else
        bitsRx(i) = 1;
    end
end

% Decodificar la seal Recibida Scanal
mqrecibida = scanal/5;

% multiplicando la seal por los deltas(i)
Yn = mqrecibida.*delta;

% sumando para acumular y formar la seal mensaje
Xn(1) = Yn(1);
for k=2:length(m),
    Xn(k) = Yn(k)+Xn(k-1);
end

% Filtrando la seal para recuperacion
[b,a] = butter(4,[200/(fs/2)],'low');
Xnfiltrada = filter(b,a,Xn);

axes(handles.grafico1)
cla;
plot(t,m);  title('Seal Original y M Cuantizada'); hold on; plot(t,mq,'m'); grid on;

axes(handles.grafico2)
cla;
plot(time,codi(time),'r');  title('Seal Codificada y luego enviada por un canal AWGN'); hold on; plot(time,scanal(time)); grid on;

[Num,Rat] = biterr(bitsTx,bitsRx);
set(handles.cantidad, 'String', Num);
set(handles.razon, 'String', Rat);

