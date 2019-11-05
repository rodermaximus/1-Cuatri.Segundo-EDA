% Apartado 2.1
% Funcion DFT
% Calcula la transformada discreta de Fourier de una secuencia

function [X] = dft(x,N)
 L=length(x);
 for k=1:N
  X(k)=0;
  for n=1:L
   X(k)=X(k)+(x(n)*exp(-j*2*pi/N*k*n));
 end

end