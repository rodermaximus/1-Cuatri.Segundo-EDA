%Sistemas LTI
% c) Calcula la respuesta en cascada de un filtro FIR

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
y=filter(b,a,x);

%Apartado 1.c)
hFIR=zeros(size(n));
hFIR(1)=1;
hFIR(10+1)=0.8;
hFIR(20+1)=0.64;

bb=[1 zeros(1,9) 0.8 zeros(1,9) 0.64];
aa=[1]
yc1=filter(bb,aa,y)

% Representación gráfica
figure
subplot(2,1,1)
stem(n,x),xlabel('n'),ylabel('x[n]')
subplot(2,1,2)
stem(n,yc1),xlabel('n'),ylabel('y[n]')
title('Sistemas IIR-FIR en cascada mediante filter')
