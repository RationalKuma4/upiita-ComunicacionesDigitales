function [x,xc]=Nrud(nivelCuantizacion, rangoDinamicoMax, rangoDinamicoMin)
    escalon=(abs(rangoDinamicoMax)+abs(rangoDinamicoMin))/nivelCuantizacion;
    x=zeros(1,nivelCuantizacion+1);
    x(1)=rangoDinamicoMin;
    xc=zeros(1,nivelCuantizacion);
    
    for i=1:nivelCuantizacion
        x(i+1)=x(i)+escalon;
        xc(i)=(x(i)+x(i+1))/2;
    end
end