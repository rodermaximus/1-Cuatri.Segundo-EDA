% Apartado 2.9.a
% Calcula la DFT de N=32 valores y L=256
% señal sinusoidal x[n] de valor real, 
% de amplitud A=1 fase 0 y frecuencia discreta 0.1

% Definiciones
A=1;
fase=0;
n=0:31;
fd=0.1;

% Número de muestras
N=32;

% Valor de la pulsación discreta
w=0:2*pi/N:2*pi/N*(N-1);

% Señal sinusoidal
%x1=A*cos(2*pi*fd*n+fase); -Se sustituye

% Llamada a la función  dft
%x=dft(x1,N); - Se sustituye

% Se rellena con ceros el vector hasta L=256
L=1:256;
ceros=zeros(size(L));
n1=[n ceros(1,:)];

% Señal sinusoidal nueva
x2=A*cos(2*pi*fd*n1+fase);
x=dft(x2,N);

% Representación gráfica
subplot(2,1,1)
plot(w,abs(x),'o-')
title('Espectro de amplitud - con DFT N32 L256')
xlabel('\omega')
subplot(2,1,2)
plot(w,unwrap(angle(x)),'o-')
title('Espectro de fase - con DFT N32 L256')
xlabel('\omega')