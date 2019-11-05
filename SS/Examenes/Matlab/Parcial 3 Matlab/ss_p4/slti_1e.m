%Sistemas LTI
% e)  Calcula la respuesta al impulso equivlente con filter

clear
close all
n=0:100;

% Implementamos el sistema 
a=[1 -1/5 -1/25];
b=[1 1/3];

d=zeros(size(n));
d(1)=1;
h=filter(b,a,d);

% Apartado 1.e)
bb=[1 zeros(1,9) 0.8 zeros(1,9) 0.64];
aa=[1];
heq2=filter(bb,aa,h);

figure
stem(n,heq2),xlabel('n'),ylabel('ht[n]')
title('h total equivalente mediante filter')


