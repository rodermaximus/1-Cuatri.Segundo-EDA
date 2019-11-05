% Función que permite "alisar" datos ruidosos 
% para una ventana determinada de valores
% compara el numerador y el denominador 
% y calcula los promedios

% Se generan 100 valore entre -pi y pi
t = linspace(-pi,pi,100);

% Se le introduce un ruido aleatorio
x = sin(t) + 0.25*rand(size(t));

% Se define el tamaño de la ventana
windowSize = 5; 
b = (1/windowSize)*ones(1,windowSize);
a = 1;
y = filter(b,a,x);

plot(t,x)
hold on
plot(t,y)
legend('Datos de entrada','Datos filtrados')
