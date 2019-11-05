clear;
close all;
%muestra
n = 0:100;
%inicializacion

a = [1 -1/5 -1/25];
b = [1 1/3];
d = zeros(size(n));
d(1) = 1;

%filtramos la señal
h = filter(b, a, d);
%representamos los graficos
figure;
subplot(2,1,1);
stem(n,d);
xlabel('n');
ylabel('\delta[n]');
title('Funcion de excitacion x[n]');
subplot(2,1,2);
stem(n,h);
xlabel('n');
ylabel('h_(LTI)[n]');

