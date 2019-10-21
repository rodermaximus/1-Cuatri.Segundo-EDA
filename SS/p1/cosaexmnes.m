hold off;
t=0:0.001:1;
x=cos(2*pi*10*t);
plot(t,x);
hold on;
plot(t(1:10:1000),x(1:10:1000),'ro');
