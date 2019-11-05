% Apartado 2.9.b
% Calcula la DFT de N=256 valores y L=256
% se�al sinusoidal x[n] de valor real, 
% de amplitud A=1 fase 0 y frecuencia discreta 0.1

% Definiciones
A=1;
fase=0;

n=0:255;
fd=0.1;

% N�mero de muestras
%N=32; - Se sustituye
N=256

% Valor de la pulsaci�n discreta
w=0:2*pi/N:2*pi/N*(N-1);

% Se�al sinusoidal
x1=A*cos(2*pi*fd*n+fase);

% Llamada a la funci�n  dft
x=dft(x1,N);

% Se rellena con ceros el vector hasta L=256
L=1:256;

% Se�al sinusoidal nueva
x2=A*cos(2*pi*fd*L+fase);
X=dft(x2,N);

% Representaci�n gr�fica
subplot(2,1,1)
plot(w,abs(X),'o-')
title('Espectro de amplitud - con DFT N256 L256')
xlabel('\omega')
subplot(2,1,2)
plot(w,unwrap(angle(X)),'o-')
title('Espectro de fase - con DFT N256 L256')
xlabel('\omega')