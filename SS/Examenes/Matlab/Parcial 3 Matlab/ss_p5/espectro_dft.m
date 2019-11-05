% Apartado 2.4. Llama a la funci�n programada en el apartado 2.1
% Calcula y representa el espectro de una secuencia con DFT

% Secuencia

x=[0 0 1 zeros(1,5)];

% N�mero de muestas
N=length(x);

% Llamada a la funci�n dft
X=dft(x,N);

% Valor de la pulsaci�n discreta 
N1=length(X);
w=0:2*pi/N1:2*pi/N1*(N1-1);


% Representaci�n gr�fica
subplot(2,1,1)
plot(w,abs(X),'o-')
title('Espectro de amplitud - con dft')
xlabel('\omega')
subplot(2,1,2)
plot(w,unwrap(angle(X)),'o-');
title('Espectro de fase - con dft')
xlabel('\omega')
%w se mide en radianes