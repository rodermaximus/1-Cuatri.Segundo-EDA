function reconstructor (f0, Ts);
 
% f0 = 9;
% Ts = 0.1;
 
ta = [0:0.0001:1];
xa = cos(2*pi*f0*ta);
nTs = (0:Ts:1).';
xd = cos(2*pi*f0*nTs);
xr = zeros(size(ta));
for m=1:length(nTs)
xr = xr + xd(m).*sinc((ta-nTs(m))/Ts);
end
plot(ta,xa,'.-g',nTs,xd,'or',ta,xr,'b');
grid;
legend('Original','Muestras','Reconstruida');
xlabel('Tiempo (s)');
ylabel('Amplitud');
axis([0 1 -1.9 1.9]);
 
end