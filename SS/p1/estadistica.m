% CALCULO DE MEDIA Y DESVIACIÓN
% Probar con x=[4.5 6 7 3 10]
% Y ejecutar tecleando [m,d]=estadistica(x) 

function [mean,stdev] = estadistica(x)
% Declaración de una función
% Esta función calcula la media y la desviación típica
%de todos los elementos de la entrada si
%la variable de entrada es un vector.
%Si la variable de entrada es una matriz,
%obtiene un vector fila con los valores medios
%y las desviaciones típicas de cada columna.
[m,n]=size(x);
if m==1
m=n;
end
mean=sum(x)/m;
stdev=sqrt(sum(x.^2)/m-mean.^2);