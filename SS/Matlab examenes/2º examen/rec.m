function rec(fs, f)
Ts=1/fs;
tc=0.001*Ts;
xc=cos(2*pi*f*(0:tc:1));
xd=cos(2*pi*f*(0:Ts:1));
stem(0:Ts:1,xd);
hold on;
xrec=[0 xd];
plot(0:tc:1,xc,'g',Ts:Ts:1,xrec(2:end-1),'k');
grid;
hold off;
end