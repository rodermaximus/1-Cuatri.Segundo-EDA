function [xs] = muestreo(f0,Ts)
 
T0=1/f0;
t = [0:2*T0/10000:2*T0]; 
xa = cos(2*pi*f0*t); 
subplot(2,1,1);
plot(t, xa);
grid;
xlabel('Tiempo (s)','Fontsize',8); 
ylabel('Amplitud','Fontsize',8); 
title('Señal continua x_{a}(t)'); 
axis([0 2*T0 -1.5 1.5]);
nTs = [0:Ts:2*T0];
xs = cos(2*pi*f0*nTs); 
n = 0:length(nTs)-1; 
subplot(2,1,2);
stem(n, xs);
grid;
xlabel('Índice de muestreo, n. T_s=0.1 ms','Fontsize',8);
ylabel('Amplitud','Fontsize',8); 
title('Señal discreta x[n]'); 
axis([0 2*T0/Ts -1.5 1.5]);
 
end