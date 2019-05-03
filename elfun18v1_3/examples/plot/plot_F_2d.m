% Plot F
%============================


figure(1)
clf
hold on
m = [-2,-1,0,0.5,1,2];
x = -1:0.0001:1;
clg={};
for n = 1:length(m)
    clg{n} = num2str(m(n));
    plot(x,mEllipticF(x,m(n)),'LineWidth',2)
end
hlg = legend(clg,'Location','best');
title(hlg, 'm','FontWeight','normal')
title('Elliptic integral of the 1st kind')
xlabel('x')
ylabel(strcat('\bfF\rm(x,m)'));
ylim([-2,2])
grid on
hold off


figure(2)
clf
hold on
m = [-2,-1,0,0.5,0.95,1,1.2];
x = -3:0.0001:3;
clg={};
for n = 1:length(m)
    clg{n} = num2str(m(n));
    plot(x,mpEllipticF(x*pi,m(n)),'LineWidth',2)
end
hlg = legend(clg,'Location','best');
title(hlg, 'm','FontWeight','normal')
title('Elliptic integral of the 1st kind')
xlabel('\phi/\pi')
ylabel(strcat('K(\phi,m)'));
ylim([-5,5])
grid on
hold off


fa = 0.8;
m = -2:0.005:2;
x = -1:0.005:1;
[X,M] = meshgrid(x,m);
figure(4)
clf
hold on
title('Elliptic integral of the 1st kind')
hs = surfc(X,M,mEllipticF(X,M),'EdgeColor','none','FaceAlpha',fa);
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
zlabel('F(x,m)')
% add slice
xlimv = get(gca,'XLim');
ylimv = get(gca,'YLim');
xa = m; xa(:) = 0.5;
plot3(xa,m,mEllipticF(xa,m),'LineWidth',2)
ma = x; ma(:) = 0.5;
plot3(x,ma,mEllipticF(x,ma),'LineWidth',2)
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
title('Elliptic integral of the 1st kind')
hs = surfc(X,M,mpEllipticF(X*pi,M),'EdgeColor','none','FaceAlpha',fa);
hc = hs(2);
hc.ContourZLevel = -3;
hc.LineWidth = 1;
hc.LevelList = -3:0.25:3;
caxis([-3 3])
xlim([-1.5 1.5])
zlim([-3 3])
view(3);
xlabel('\phi/\pi');
ylabel('m');
zlabel('F(\phi,m)')
% add slice
xlimv = get(gca,'XLim');
ylimv = get(gca,'YLim');
ma = x; ma(:) = 0.5;
plot3(x,ma,mpEllipticF(x*pi,ma),'LineWidth',2)
xa = m; xa(:) = -0.5;
plot3(xa,m,mpEllipticF(xa*pi,m),'LineWidth',2)

set(gca,'XLim',xlimv)
set(gca,'YLim',ylimv)
grid on
hold off

