% Función CUANTIFICACION
% Realiza la cuantificación uniforme de una señal.
% Devuelva la señal cuantificada, 
% la relación señal a ruido de cuantificación 
% y la función error de cuantificación
 
function [xq, sn] = cuantificacion(x,xmax,xmin,b)
 
 
% En L guardamos el número de niveles que podemos cuantificar con b bits
 
L=2^b;
 
% En D guardamos el escalón de cuantificación
% como el cociente entre el margen dinámico de cuantifiación (del conversor)
% y el número de niveles
 
D=(xmax-xmin)/L;
 
% Implementamos la función característica del cuantificador uniforme
% para cuantificar la señal x
% Utilizamos fix(parte entera), abs(valor absoluto), sign(signo -1 0 1)
 % x la señal a cuantificar
for i=1:length(x)
 if(abs(x(i))<xmax)
   xq(i)=(fix(abs(x(i))/D)+0.5)*D*sign(x(i));
 else
 xq(i)=((L-1)/2)*D*sign(x(i));
 end
end
 
% Calculamos el error de cuantificación y el ruido
 
pq=0;
 
for j=1:(length(x))
 pq=pq+(xq(j)-x(j))^2;
end
pq=pq*(1/length(x)); px=0;
 
 
for k=1:length(x)
px=px+(x(k))^2;
end
 
px=px*(1/length(x)); 
sn=10*log10((px/pq));
n=0:(length(x)-1); 
 
% Representamos las gráficas
 
 
subplot(3,1,1); 
stem(n,x); 
title('Señal de entrada x');
subplot(3,1,2); 
stem(n, xq);
title('Señal cuantificada xq');
eq=(xq-x); 
subplot(3,1,3); 
stem(n, eq);
title('Función error de cuantificación eq=(xq-x)');
 
end