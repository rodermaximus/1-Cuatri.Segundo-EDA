% Subplot divide la ventana gr�fica en pariciciones

x = 0:pi / 25:6 * pi
y = sin(x); 
z = cos(x); 
w = exp(-x*.1).*y; v = y.*z;

subplot(2,2,1), plot(x,y)

hold on % congela el gr�fico, para no borrar

subplot(2,2,2), plot(x,z)

pause %para la ejecuci�n hasta que se pulsa INTRO desde la ventana de comandos

subplot(2,2,3), plot(x,w)

pause

subplot(2,2,4), plot(x,v)
