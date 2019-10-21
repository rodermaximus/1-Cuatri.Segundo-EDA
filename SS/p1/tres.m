% Problema "3n+1" clásico de teoría de números
% Cualquier número entero positivo; si es par, se divide por dos
% si es impar, se multiplica por 3 y se le suma 1 al resultado
% Se repite hasta llegara a uno
% Probar con 4 y 5 para seguimiento
  
  while 1
  n=input ('Introduzca numero, si es negativo, finaliza:  ');
  if n<=0
    break;
  end;
  while n>1
    if rem(n,2)==0
      n=n/2;
    else 
      n=3*n+1;
    end;
  n %permite ver el valor de n
  end;
end;


