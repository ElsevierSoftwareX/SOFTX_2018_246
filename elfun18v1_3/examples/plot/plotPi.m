% Plot Pi
%============================
fa = 0.8;
m = -2:0.005:2;
x = -1:0.005:1;
[X,M] = meshgrid(x,m);
n = 0.5;
figure(1)
clf
hold on
title('Jacobi form of elliptic integral of the 3rd kind')
hs = surfc(X,M,mEllipticPi(X,M,n),'EdgeColor','none','FaceAlpha',fa);
hc = hs(2);
hc.ContourZLevel = -3;
hc.LineWidth = 1;
hc.LevelList = -2:0.2:2;
caxis([-3 3])
zlim([-3 3])
view(3);
xlabel('x');
ylabel('\nu');
zlabel(strcat(strcat('\Pi(x,',strcat('\nu,',num2str(n))),')'))
% add slice
xlimv = get(gca,'XLim');
ylimv = get(gca,'YLim');
ma = x; ma(:) = 0.5;
plot3(x,ma,mEllipticPi(x,ma,n),'LineWidth',2)
xa = m; xa(:) = 0.75;
plot3(xa,m,mEllipticPi(xa,m,n),'LineWidth',2)
set(gca,'XLim',xlimv)
set(gca,'YLim',ylimv)
grid on
hold off


m = -2:0.005:2;
x = -1:0.005:1;
[X,M] = meshgrid(x,m);
nu = 0.5;
figure(2)
clf
hold on
title('Jacobi form of elliptic integral of the 3rd kind')
hs = surfc(X,M,mEllipticPi(X,nu,M),'EdgeColor','none','FaceAlpha',fa);
hc = hs(2);
hc.ContourZLevel = -3;
hc.LineWidth = 1;
hc.LevelList = -2:0.2:2;
caxis([-3 3])
zlim([-3 3])
view(3);
xlabel('x');
ylabel('m');
zlabel(strcat(strcat('\Pi(x,',strcat(num2str(n))),',m)'))
% add slice
xlimv = get(gca,'XLim');
ylimv = get(gca,'YLim');
ma = x; ma(:) = 0.5;
plot3(x,ma,mEllipticPi(x,nu,ma),'LineWidth',2)
xa = m; xa(:) = 0.75;
plot3(xa,m,mEllipticPi(xa,nu,m),'LineWidth',2)
set(gca,'XLim',xlimv)
set(gca,'YLim',ylimv)
grid on
hold off

m = -2:0.005:2;
nu = -2:0.005:2;
[NU,M] = meshgrid(nu,m);
x = 0.75;
figure(3)
clf
hold on
title('Jacobi form of elliptic integral of the 3rd kind')
%hs = surfc(NU,M,mEllipticPi(-x,NU,M),'EdgeColor','none','FaceAlpha',fa);
hs = surfc(NU,M,mEllipticPi(x,NU,M),'EdgeColor','none','FaceAlpha',fa);
hc = hs(2);
hc.ContourZLevel = 0.5;
hc.LineWidth = 1;
hc.LevelList = 0.5:0.05:1;
caxis([0.5 1])
zlim([0.5 1])
view(3);
xlabel('\nu');
ylabel('m');
zlabel(strcat('\Pi(',strcat(num2str(x)),',\nu,m)'))
% add slice
xlimv = get(gca,'XLim');
ylimv = get(gca,'YLim');
nua = m; nua(:) = 0.5;
plot3(nua,m,mEllipticPi(x,nua,m),'LineWidth',2)
ma = nu; ma(:) = 0.75;
plot3(nu,ma,mEllipticPi(x,nu,ma),'LineWidth',2)
set(gca,'XLim',xlimv)
set(gca,'YLim',ylimv)
grid on
hold off
return

figure(3)
clf
hold on
hs = surfc(X,M,mEllipticPi(X,n,M),'EdgeColor','none');
hc = hs(2);
hc.ContourZLevel = -2;
hc.LineWidth = 1;
hc.LevelList = -2:0.2:2;
caxis([-2 2])
zlim([-2 2])
view(3);
xlabel('x');
ylabel('m');
zlabel(strcat(strcat('\Pi(x,',strcat('',num2str(n))),',m)'))
grid on
hold off
return

figure(1)
clf
hold on
k = -4:0.005:4;
nu = [-2,-1,0,1, 2];
clg={};
for n = 1:length(nu)
      clg{n} = num2str(nu(n));
plot(k,EllipticPi(nu(n),k),'LineWidth',2)
end
hlg = legend(clg,'Location','best');
title(hlg, 'n','FontWeight','normal')
title('Elliptic Integral \Pi')
xlabel('k')
ylabel('\Pi(x,n,k)');
ylim([-2,3])
grid on
hold off

figure(3)
clf
hold on
nu = [-10,-3,-1,0,0.5];
title('Complete elliptic integral of 3rd kind')
for n = 1:length(nu)
    plot(k,EllipticPi(nu(n),k),'LineWidth',2)
end    
xlabel('k')
ylabel('\Pi(\nu,k)')
ylim([0,6])
hlg = legend({'-10','-3','-1','0','0.5'},'Location','best');
title(hlg, '\nu','FontWeight','normal')
grid on
hold off

