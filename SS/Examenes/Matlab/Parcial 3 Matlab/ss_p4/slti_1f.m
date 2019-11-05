%Sistemas LTI
% f) Calcula la respuesta en cascada de sistemas FIR-IIR invertido con filter

clear
close all
n=0:100;

% Implementamos la señal de excitación x[x]
pulso=zeros(size(n));
pulso(11:11+50-1)=1;
x=3*cos(0.05*pi*n).*pulso;

% Implementamos el sistema 
a=[1 -1/5 -1/25];
b=[1 1/3];

bb=[1 zeros(1,9) 0.8 zeros(1,9) 0.64];
aa=[1];


% Apartadao 1.f)

yinv1=filter(bb,aa,x)
yinvtot=filter(b,a,yinv1)
figure
subplot(2,1,1)
stem(n,x),xlabel('n'),ylabel('x[n]')
title('Función de excitación x[n]')
subplot(2,1,2)
stem(n,yinvtot),xlabel('n'),ylabel('y[n]')
title('Sistemas FIR-IIR (invertido) en cascada mediante filter ')