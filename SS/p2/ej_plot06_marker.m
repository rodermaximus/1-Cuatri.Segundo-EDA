% Representar n�meros complejos. Distinta forma. igual resultado
z = eig(rand(20,20));
plot (real(z), imag(z), '*')
% Si no a�adimos la "marca" dibuja l�neas
% plot (real(z), imag(z))