% Sistemas LTI
% b) Representa la respuesta al impulso 

clear
close all

n=0:100;

% Implementamos el sistema 
a=[1 -1/5 -1/25];
b=[1 1/3];


% Apartado 1.b)

d=zeros(size(n));
d(1)=1;
h=filter(b,a,d);

% Representación gráfica
figure
subplot(2,1,1)
stem(n,d),xlabel('n'),ylabel('\delta[n]')
subplot(2,1,2)
stem(n,h),xlabel('n'),ylabel('h_{LTI}[n]')