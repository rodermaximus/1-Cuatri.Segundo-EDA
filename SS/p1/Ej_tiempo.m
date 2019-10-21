% CONTROL DEL TIEMPO
% Calcula el tiempo en resolver un sistema. Corregir los apuntes por este:

A=rand(100,1); b=rand(100,1); x=zeros(100,1);
tiempo=clock; x=A\b; tiempo=etime(clock, tiempo)
time=cputime; x=A\b; time =cputime-time
tic; x=A\b; toc