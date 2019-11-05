function y=ecofinito(x,fs,alfa,t0)

% ECOFIN: Implementación de un eco finito

% USO:
% [x,fs]=wavread('nombre_fichero.wav')
% s=ecoinf(x,fs,alfa,t0)
% sound(s,11025,8)

% X vector de muestras originales
% FS frecuencia de muestreo en Hz
% ALFA factor de ganancia (será menor que 1) PPT
% T0 retardo en segundos

n0=fix(t0*fs);
% asegura que vector x sea fila
x=x(:).'; 
% se alarga x para 4 ecos
x=[x, zeros(1,4*n0)]; 
% vector de coeficientes b
b=[1 zeros(1,n0-1) alfa zeros(1,n0-1) alfa^2];
% vector de coeficientes a, va a valer 1

% implementa la funcion filter
y=filter(b,1,x);

end

