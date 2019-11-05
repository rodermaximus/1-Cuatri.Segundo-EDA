%Sistemas LTI
% a) Calcula la respuesta de un sistema y[n] a una excitaci�n x[n]

clear
close all

% Apartado 1.a)
n=0:100;

% Implementamos la se�al de excitaci�n x[x]
pulso=zeros(size(n));
pulso(11:11+50-1)=1;
x=3*cos(0.05*pi*n).*pulso;

% Implementamos el sistema 
a=[1 -1/5 -1/25];
b=[1 1/3];
y=filter(b,a,x);


% Representaci�n gr�fica
subplot(2,1,1)
stem(n,x),xlabel('n'),ylabel('x[n]')
title('Funci�n de excitaci�n x[n]')
subplot(2,1,2)
stem(n,y),xlabel('n'),ylabel('y_{LTI}[n]')
title('Respuesta del sistema LTI a x[n]')
