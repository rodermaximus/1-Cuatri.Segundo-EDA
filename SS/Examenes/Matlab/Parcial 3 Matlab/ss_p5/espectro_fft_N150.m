% Apartado 2.6. Aumentando la resoluci�n espectral
% Calcula y representa el espectro de una secuencia con FFT

% Secuencia
x=[0 0 1 zeros(1,147)];

% Llamada a la funci�n fft
X=fft(x);

% N�mero de muestas
N=length(X);

% Valor de la pulsaci�n discreta 
% Secuencia impulso unidad retardada dos unidades de tiempo discreto
w=[0:2*pi/N:2*pi/N*(N-1)];


% Representaci�n gr�fica
subplot(2,1,1);
plot(w, abs(X),'o-');
title('Espectro de amplitud - con fft');
xlabel('\omega');
subplot(2,1,2);
plot(w, unwrap(angle(X)),'o-');
title('Espectro de fase - con fft');
xlabel('\omega');
