% Muestreo 3. Señales con diferentes frecuencias
% f02= f01+k*fs (vamos a tomar k como 1)
 
function [xs] = muestreo3(f0,Ts)
T0=1/f0;
fs=1/Ts;
f1=f0+fs;
t = [0:2*T0/10000:2*T0];
xa = cos(2*pi*f0*t); xb = cos(2*pi*f1*t); subplot(2,2,1); plot(t, xa);
grid;
xlabel('Tiempo (s)','Fontsize',8); ylabel('Amplitud','Fontsize',8); title('Señal continua x_{a}(t)'); axis([0 2*T0 -1.5 1.5]); subplot(2,2,2);
plot(t, xb);
grid;
xlabel('Tiempo (s)','Fontsize',8); ylabel('Amplitud','Fontsize',8); title('Señal continua x_{a}(t)'); axis([0 2*T0 -1.5 1.5]);
nTs = [0:Ts:2*T0];
as = cos(2*pi*f0*nTs);
bs = cos(2*pi*f1*nTs);
n = 0:length(nTs)-1; subplot(2,2,3); stem(n, as);
grid;
xlabel('Índice de muestreo, n. T_s=0.1 ms','Fontsize',8);
ylabel('Amplitud','Fontsize',8); title('Señal discreta x[n]'); axis([0 2*T0/Ts -1.5 1.5]); subplot(2,2,4);
stem(n, bs);
grid;
xlabel('Índice de muestreo, n. T_s=0.1 ms','Fontsize',8);
ylabel('Amplitud','Fontsize',8); title('Señal discreta x[n]'); axis([0 2*T0/Ts -1.5 1.5]);
end