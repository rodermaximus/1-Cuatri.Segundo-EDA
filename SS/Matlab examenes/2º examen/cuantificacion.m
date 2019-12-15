% Funci�n CUANTIFICACION
% Realiza la cuantificaci�n uniforme de una se�al.
% Devuelva la se�al cuantificada, 
% la relaci�n se�al a ruido de cuantificaci�n 
% y la funci�n error de cuantificaci�n
 
function [xq, sn] = cuantificacion(x,xmax,xmin,b)
 
 
% En L guardamos el n�mero de niveles que podemos cuantificar con b bits
 
L=2^b;
 
% En D guardamos el escal�n de cuantificaci�n
% como el cociente entre el margen din�mico de cuantifiaci�n (del conversor)
% y el n�mero de niveles
 
D=(xmax-xmin)/L;
 
% Implementamos la funci�n caracter�stica del cuantificador uniforme
% para cuantificar la se�al x
% Utilizamos fix(parte entera), abs(valor absoluto), sign(signo -1 0 1)
 % x la se�al a cuantificar
for i=1:length(x)
 if(abs(x(i))<xmax)
   xq(i)=(fix(abs(x(i))/D)+0.5)*D*sign(x(i));
 else
 xq(i)=((L-1)/2)*D*sign(x(i));
 end
end
 
% Calculamos el error de cuantificaci�n y el ruido
 
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
 
% Representamos las gr�ficas
 
 
subplot(3,1,1); 
stem(n,x); 
title('Se�al de entrada x');
subplot(3,1,2); 
stem(n, xq);
title('Se�al cuantificada xq');
eq=(xq-x); 
subplot(3,1,3); 
stem(n, eq);
title('Funci�n error de cuantificaci�n eq=(xq-x)');
 
end