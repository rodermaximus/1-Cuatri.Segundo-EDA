clear;
close all;
%muestra
n = 0:100;
%inicializacion
pulso = zeros(size(n));
pulso(11:11+50-1) = 1;
x = 3*cos(0.05*pi*n).*pulso;
a = [1 -1/5 -1/25];
b = [1 1/3];
%filtramos la señal
y = filter(b, a, x);
%representamos los graficos
subplot(2,1,1);
stem(n,x);
xlabel('n');
ylabel('x[n]');
title('Funcion de excitacion x[n]');
subplot(2,1,2);
stem(n,y);
xlabel('n');
ylabel('y_(LTI)[n]');
title('Respuesta del sistema LTI a x[n]');
