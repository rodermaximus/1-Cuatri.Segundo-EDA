% Dibujas lineas y marcas de distintos estilos
% Si vamos ejecutándolo sucesivas veces, va cambiando los colores

x1 =[ 1   2   3   2   1]
x2 = [ 2   3   4   3   2]
x3 = [ 3   4   5   4   3]

plot (x1,'-.')
hold on
plot (x2,'-')
plot (x3,'--')

plot (x1,'*')

