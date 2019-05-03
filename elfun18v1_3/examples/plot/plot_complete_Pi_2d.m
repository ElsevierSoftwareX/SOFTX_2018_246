% Plot complete Pi - 2d
%============================

figure(1)
clf
hold on
nu = [-2,-1,0,0.5,1];
m = -2:0.0001:1;
clg={};
for n = 1:length(nu)
    clg{n} = num2str(nu(n));
    plot(m,mEllipticPi(nu(n),m),'LineWidth',2)
end
hlg = legend(clg,'Location','best');
title(hlg, '\nu','FontWeight','normal')
title('Complete elliptic integral of the 3rd kind')
xlabel('m')
ylabel(strcat('\Pi(\nu,m)'));
ylim([0,3])
grid on
hold off

figure(2)
clf
hold on
m = [-2,-1,0,0.5,1];
nu = -2:0.0001:1;
clg={};
for n = 1:length(m)
    clg{n} = num2str(m(n));
    plot(nu,mEllipticPi(nu,m(n)),'LineWidth',2)
end
hlg = legend(clg,'Location','best');
title(hlg, 'm','FontWeight','normal')
title('Complete elliptic integral of the 3rd kind')
xlabel('\nu')
ylabel(strcat('\Pi(\nu,m)'));
ylim([0,3])
grid on
hold off

fa = 0.8;
m = -2:0.005:1;
nu = -2:0.005:1;
[NU,M] = meshgrid(nu,m);
figure(3)
clf
hold on
title('Complete elliptic integral of the 3rd kind')
hs = surfc(NU,M,mEllipticPi(NU,M),'EdgeColor','none','FaceAlpha',fa);
hc = hs(2);
hc.ContourZLevel = 0;
hc.LineWidth = 1;
hc.LevelList = 0:0.2:4;
caxis([0 4])
zlim([0 4])
view(3);
xlabel('\nu');
ylabel('m');
zlabel('\Pi(\nu,m)')
% add slice
xlimv = get(gca,'XLim');
ylimv = get(gca,'YLim');
ma = nu; ma(:) = 0.5;
plot3(nu,ma,mpEllipticPi(nu,ma),'LineWidth',2)
nua = m; nua(:) = 0.5;
plot3(nua,m,mpEllipticPi(nua,m),'LineWidth',2)
set(gca,'XLim',xlimv)
set(gca,'YLim',ylimv)
grid on
hold off
