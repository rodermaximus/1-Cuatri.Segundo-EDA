% Representar números complejos. Distinta forma. igual resultado
z = eig(rand(20,20));
plot (real(z), imag(z), '*')
% Si no añadimos la "marca" dibuja líneas
% plot (real(z), imag(z))