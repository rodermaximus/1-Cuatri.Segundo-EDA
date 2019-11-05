% Apartado 2.9.a
% Calcula la DFT de N=32 valores y L=256
% se�al sinusoidal x[n] de valor real, 
% de amplitud A=1 fase 0 y frecuencia discreta 0.1

% Definiciones
A=1;
fase=0;
n=0:31;
fd=0.1;

% N�mero de muestras
N=32;

% Valor de la pulsaci�n discreta
w=0:2*pi/N:2*pi/N*(N-1);

% Se�al sinusoidal
%x1=A*cos(2*pi*fd*n+fase); -Se sustituye

% Llamada a la funci�n  dft
%x=dft(x1,N); - Se sustituye

% Se rellena con ceros el vector hasta L=256
L=1:256;
ceros=zeros(size(L));
n1=[n ceros(1,:)];

% Se�al sinusoidal nueva
x2=A*cos(2*pi*fd*n1+fase);
x=dft(x2,N);

% Representaci�n gr�fica
subplot(2,1,1)
plot(w,abs(x),'o-')
title('Espectro de amplitud - con DFT N32 L256')
xlabel('\omega')
subplot(2,1,2)
plot(w,unwrap(angle(x)),'o-')
title('Espectro de fase - con DFT N32 L256')
xlabel('\omega')