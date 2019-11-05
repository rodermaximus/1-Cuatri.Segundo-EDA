%Sistemas LTI
% d) Calcula la respuesta al impulso equivlente con convolución

clear
close all
n=0:100;

% Implementamos el sistema 
a=[1 -1/5 -1/25];
b=[1 1/3];

d=zeros(size(n));
d(1)=1;
h=filter(b,a,d);

hFIR=zeros(size(n));
hFIR(1)=1;
hFIR(10+1)=0.8;
hFIR(20+1)=0.64;

% Apartado 1.d)

heq=conv(h,hFIR)

figure
stem(n,heq(1:101)),xlabel('n'),ylabel('ht[n]')
title('h total equivalente mediante convolución')
