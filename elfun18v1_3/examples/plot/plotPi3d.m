% Plot Pi
%============================
fa = 0.8;
m = -1.2:0.005:1.2;
x = -2:0.005:2;
[X,M] = meshgrid(x,m);
n = 0.5;
figure(1)
clf
hold on
title('Legendre elliptic integral of the 3rd kind')
hs = surfc(X,M,mpEllipticPi(X*pi,M,n),'EdgeColor','none','FaceAlpha',fa);
hc = hs(2);
hc.ContourZLevel = -4;
hc.LineWidth = 1;
hc.LevelList = -4:0.2:4;
caxis([-4 4])
zlim([-4 4])
view(3);
xlabel('\phi/\pi');
ylabel('\nu');
zlabel(strcat(strcat('\Pi(\phi,',strcat('\nu,',num2str(n))),')'))
% add slice
xlimv = get(gca,'XLim');
ylimv = get(gca,'YLim');
ma = x; ma(:) = 0.5;
plot3(x,ma,mpEllipticPi(x*pi,ma,n),'LineWidth',2)
xa = m; xa(:) = 0.5;
plot3(xa,m,mpEllipticPi(xa*pi,m,n),'LineWidth',2)
set(gca,'XLim',xlimv)
set(gca,'YLim',ylimv)
grid on
hold off



fa = 0.8;
m = -1.2:0.005:1.2;
x = -2:0.005:2;
[X,M] = meshgrid(x,m);
n = 0.5;
K = melK(n);
figure(2)
clf
hold on
title('Jacobi elliptic integral of the 3rd kind')
hs = surfc(X,M,mJacobiLambda(X*K,M,n),'EdgeColor','none','FaceAlpha',fa);
hc = hs(2);
hc.ContourZLevel = -4;
hc.LineWidth = 1;
hc.LevelList = -4:0.2:4;
caxis([-4 4])
zlim([-4 4])
view(3);
xlabel('u/K');
ylabel('\nu');
zlabel(strcat(strcat('\Lambda(u,',strcat('\nu,',num2str(n))),')'))
% add slice
xlimv = get(gca,'XLim');
ylimv = get(gca,'YLim');
ma = x; ma(:) = 0.5;
plot3(x,ma,mJacobiLambda(x*K,ma,n),'LineWidth',2)
xa = m; xa(:) = 0.5;
plot3(xa,m,mJacobiLambda(xa*K,m,n),'LineWidth',2)
set(gca,'XLim',xlimv)
set(gca,'YLim',ylimv)
grid on
hold off


fa = 0.8;
m = -0.5:0.005:1;
x = -1.5:0.005:1.5;
[X,M] = meshgrid(x,m);
n = 0.5;
K = melK(n);
figure(3)
clf
hold on
title('Jacobi elliptic integral of the 3rd kind')
hs = surfc(X,M,mJacobiOmega(X*K,M,n),'EdgeColor','none','FaceAlpha',fa);
hc = hs(2);
hc.ContourZLevel = -1;
hc.LineWidth = 1;
hc.LevelList = -1:0.1:1;
caxis([-1 1])
zlim([-1 1])
view(3);
xlabel('u/K');
ylabel('\nu');
zlabel(strcat(strcat('\Omega(u,',strcat('\nu,',num2str(n))),')'))
% add slice
xlimv = get(gca,'XLim');
ylimv = get(gca,'YLim');
ma = x; ma(:) = 0.5;
plot3(x,ma,mJacobiOmega(x*K,ma,n),'LineWidth',2)
xa = m; xa(:) = 0.5;
plot3(xa,m,mJacobiOmega(xa*K,m,n),'LineWidth',2)
set(gca,'XLim',xlimv)
set(gca,'YLim',ylimv)
grid on
hold off
return