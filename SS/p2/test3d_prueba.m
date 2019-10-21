x=[-3:0.4:3]; y=x;
close
subplot(2,2,1)
figure(gcf), fi=[0:pi/20:6*pi];
plot3(cos(fi),sin(fi),fi,'r'), title ('PLOT3')
[X,Y]=meshgrid(x,y);
Z=test3d(X,Y);
subplot(2,2,2)
figure(gcf), mesh(Z), title ('MESH')
subplot(2,2,3)
figure(gcf), surf(Z), title ('SURF')
subplot(2,2,4)
figure(gcf), contour3(Z,16), title ('CONTOUR3')


