function y=ecoinfinito(x,fs,alfa,t0)

% ECOINF: Implementación de un eco infinito

% USO:
% [x,fs]=wavread('nombre_fichero.wav')
% s=ecoinf(x,fs,alfa,t0)
% sound(s,11025,8)

% X vector de muestras originales
% FS frecuencia de muestreo en Hz
% ALFA factor de ganancia (será mayor que 0 y menor que 1) PPT
% T0 retardo en segundos

n0=fix(t0*fs);
% asegura que vector x sea fila
x=x(:).'; 
% se alarga x para 4 ecos
x=[x, zeros(1,4*n0)]; 
% vector de coeficientes b
b=[1]; 
% vector de coeficientes a
a=[1 zeros(1,n0-1) -alfa];
% implementa la funcion filter
y=filter(b,a,x);

end