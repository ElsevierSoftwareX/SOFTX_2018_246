% Gauss
%============
close all

figure(1)
clf
hold on
x = 0:0.1:10;
plot(x,GaussSL(x),x,GaussCL(x),'LineWidth',2)
xlabel('x')
title('Lemniscate functions')
legend('sl(x)','cl(x)')
grid on
hold off

figure(2)
clf
hold on
x = 0:0.1:10;
plot(GaussCL(x),GaussSL(x),'LineWidth',2)
axis equal
xlabel('x')
ylabel('y')
title('Lemniscate functions <cl,sl>')
grid on
hold off

figure(3)
clf
hold on
x = -2.5:0.005:2.5;
y = x;
[X,Y] = meshgrid(x,y);
surface(X,Y,GaussAGM(X,Y),'EdgeColor','none')
view(3)
axis equal
xlabel('x')
ylabel('y')
title('Gauss AGM')
grid on
hold off
