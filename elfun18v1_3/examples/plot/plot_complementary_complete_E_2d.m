% Plot complementary complete E
%============================


figure(1)
clf
hold on
m = -2:0.0001:4;
plot(m,mEllipticCE(m),'LineWidth',2)
title('Complementary complete elliptic integral of the 2nd kind')
xlabel('m')
ylabel(strcat('E''(m)'));
ylim([0,2.5])
grid on
hold off
figure(2)
clf
hold on
m = -2:0.0001:2;
plot(m,EllipticCE(m),'LineWidth',2)
title('Complementary complete elliptic integral of the 2nd kind')
xlabel('k')
ylabel(strcat('\bfE''\rm(k)'));
ylim([0,2.5])
grid on
hold off
return

figure(2)
clf
hold on
m = [-2,-1,0,0.5,0.95,1,1.2];
x = -3:0.0001:3;
clg={};
for n = 1:length(m)
    clg{n} = num2str(m(n));
    plot(x,mpEllipticE(x*pi,m(n)),'LineWidth',2)
end
hlg = legend(clg,'Location','best');
title(hlg, 'm','FontWeight','normal')
title('Elliptic integral of the 2nd kind')
xlabel('\phi/\pi')
ylabel(strcat('E(\phi,m)'));
ylim([-3,3])
grid on
hold off

figure(3)
clf
hold on
m = [-2,-1,0,0.5,0.95,1,1.2];
x = -3:0.0001:3;
clg={};
for n = 1:length(m)
    clg{n} = num2str(m(n));
    plot(x,mJacobiEps(x*pi,m(n)),'LineWidth',2)
end
hlg = legend(clg,'Location','best');
title(hlg, 'm','FontWeight','normal')
title('Elliptic integral of the 2nd kind')
xlabel('u/\pi')
ylabel(strcat('\fontsize{19}\epsilon\fontsize{11}(u,m)'));
ylim([-4,4])
grid on
hold off

fa = 0.8;
m = -2:0.005:2;
x = -1:0.005:1;
[X,M] = meshgrid(x,m);
figure(4)
clf
hold on
title('Elliptic integral of the 2nd kind')
hs = surfc(X,M,mEllipticE(X,M),'EdgeColor','none','FaceAlpha',fa);
hc = hs(2);
hc.ContourZLevel = -2;
hc.LineWidth = 1;
hc.LevelList = 0:0.2:4;
caxis([-2 2])
xlim([-1 1])
zlim([-2 2])
view(3);
xlabel('x');
ylabel('m');
zlabel('E(x,m)')
% add slice
xlimv = get(gca,'XLim');
ylimv = get(gca,'YLim');
xa = m; xa(:) = 0.5;
plot3(xa,m,mEllipticE(xa,m),'LineWidth',2)
ma = x; ma(:) = 0.5;
plot3(x,ma,mEllipticE(x,ma),'LineWidth',2)
set(gca,'XLim',xlimv)
set(gca,'YLim',ylimv)
grid on
hold off

fa = 0.8;
m = -2:0.005:2;
x = -3:0.005:3;
[X,M] = meshgrid(x,m);
figure(5)
clf
hold on
title('Elliptic integral of the 2nd kind')
hs = surfc(X,M,mpEllipticE(X*pi,M),'EdgeColor','none','FaceAlpha',fa);
hc = hs(2);
hc.ContourZLevel = -5;
hc.LineWidth = 1;
hc.LevelList = -5:0.5:5;
caxis([-5 5])

zlim([-5 5])
view(3);
xlabel('x');
ylabel('m');
zlabel('E(x,m)')
% add slice
xlimv = get(gca,'XLim');
ylimv = get(gca,'YLim');
ma = x; ma(:) = 0.5;
plot3(x,ma,mpEllipticE(x*pi,ma),'LineWidth',2)
xa = m; xa(:) = -0.5;
plot3(xa,m,mpEllipticE(xa*pi,m),'LineWidth',2)

set(gca,'XLim',xlimv)
set(gca,'YLim',ylimv)
grid on
hold off

fa = 0.8;
m = -2:0.005:2;
x = -3:0.005:3;
[X,M] = meshgrid(x,m);
figure(6)
clf
hold on
title('Elliptic integral of the 2nd kind')
hs = surfc(X,M,mJacobiEps(X*pi,M),'EdgeColor','none','FaceAlpha',fa);
hc = hs(2);
hc.ContourZLevel = -4;
hc.LineWidth = 1;
hc.LevelList = -4:0.5:4;
caxis([-4 4])

zlim([-4 4])
view(3);
xlabel('x');
ylabel('m');
zlabel('E(x,m)')
% add slice
xlimv = get(gca,'XLim');
ylimv = get(gca,'YLim');
ma = x; ma(:) = -1;
plot3(x,ma,mJacobiEps(x*pi,ma),'LineWidth',2)
xa = m; xa(:) = -0.75;
plot3(xa,m,mJacobiEps(xa*pi,m),'LineWidth',2)

set(gca,'XLim',xlimv)
set(gca,'YLim',ylimv)
grid on
hold off


