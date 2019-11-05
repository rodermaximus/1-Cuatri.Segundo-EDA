% Apartado 2.8
% Clacula la DFT de 32 valores
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
x=A*cos(2*pi*fd*n+fase);

% Llamada a la función  dft
X=dft(x,N);

% Representación gráfica
subplot(2,1,1)
plot(w,abs(X),'o-')
title('Espectro de amplitud - con DFT 32')
xlabel('\omega')
subplot(2,1,2)
plot(w,unwrap(angle(X)),'o-')
title('Espectro de fase - con DFT 32')
xlabel('\omega')