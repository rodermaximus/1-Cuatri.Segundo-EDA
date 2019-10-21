%EJEMPLO DE FOR
%Genera una matriz de 5 x 5 y la guarda en A
n=5; %Declara el tamaño de la matriz
for i = 1:n %para las filas 1 a la n
for j= 1:n %y para las columnas 1 a la n
A(i,j)=1/(i+j-1) %Crea el elemento (i,j) %de la matriz
A
end
end