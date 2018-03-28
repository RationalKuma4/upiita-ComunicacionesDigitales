clear all;
close all;

% Configuracion
a=arduino('com4','Mega2560');


    % Leemos dip
    b13=readDigitalPin(a,'D23');
    b12=readDigitalPin(a,'D25');
    b11=readDigitalPin(a,'D27');
    b10=readDigitalPin(a,'D29');
    b9=readDigitalPin(a,'D31');
    b8=readDigitalPin(a,'D33');
    b7=readDigitalPin(a,'D35');
    b6=readDigitalPin(a,'D37');
    b5=readDigitalPin(a,'D39');
    b4=readDigitalPin(a,'D41');
    b3=readDigitalPin(a,'D43');
    b2=readDigitalPin(a,'D45');
    b1=readDigitalPin(a,'D47');
    
    % Leemos leds ?
%     l1=readDigitalPin(a,'D38',0);
%     l2=readDigitalPin(a,'D40',0);
%     l3=readDigitalPin(a,'D42',0);
%     l4=readDigitalPin(a,'D44',0);
%     l5=readDigitalPin(a,'D46',0);
%     l6=readDigitalPin(a,'D48',0);
%     l7=readDigitalPin(a,'D50',0);
%     l8=readDigitalPin(a,'D52',0);
    
    
    bits=strcat(num2str(b13),num2str(b12),num2str(b11),num2str(b10)...
        ,num2str(b9),num2str(b8),num2str(b7),num2str(b6),num2str(b5)...
        ,num2str(b4),num2str(b5),num2str(b4),num2str(b3),num2str(b2)...
        ,num2str(b1));
    bits=strcat(b13,b12,b11,b10,b9,b8,b7,b6,b5,b4,b5,b4,b3,b2,b1);

% while(true)
%     pause(0.5);
%     % Leemos dip
%     b13=readDigitalPin(a,'D23');
%     b12=readDigitalPin(a,'D25');
%     b11=readDigitalPin(a,'D27');
%     b10=readDigitalPin(a,'D29');
%     b9=readDigitalPin(a,'D31');
%     b8=readDigitalPin(a,'D33');
%     b7=readDigitalPin(a,'D35');
%     b6=readDigitalPin(a,'D37');
%     b5=readDigitalPin(a,'D39');
%     b4=readDigitalPin(a,'D41');
%     b3=readDigitalPin(a,'D43');
%     b2=readDigitalPin(a,'D45');
%     b1=readDigitalPin(a,'D47');
%     
%     % Leemos leds ?
% %     l1=readDigitalPin(a,'D38',0);
% %     l2=readDigitalPin(a,'D40',0);
% %     l3=readDigitalPin(a,'D42',0);
% %     l4=readDigitalPin(a,'D44',0);
% %     l5=readDigitalPin(a,'D46',0);
% %     l6=readDigitalPin(a,'D48',0);
% %     l7=readDigitalPin(a,'D50',0);
% %     l8=readDigitalPin(a,'D52',0);
%     
%     
%     bits=strcat(num2str(b13),num2str(b12),num2str(b11),num2str(b10)...
%         ,num2str(b9),num2str(b8),num2str(b7),num2str(b6),num2str(b5)...
%         ,num2str(b4),num2str(b5),num2str(b4),num2str(b3),num2str(b2)...
%         ,num2str(b1));
%     bits=strcat(b13,b12,b11,b10,b9,b8,b7,b6,b5,b4,b5,b4,b3,b2,b1);
% end
