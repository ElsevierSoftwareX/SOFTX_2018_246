fa = 0.75;

figure(1)
set(gcf, 'Position', [488 298 560 560]);
clf
hold on
x = -1:0.005:1;
k = [0, 0.25, 0.5, 0.75, 1];
for n = 1:length(k)
    clg{n} = num2str(k(n));
    plot(x,pHeumanLambda0(pi*x,k(n)),'LineWidth',2)
end
hlg = legend(clg,'Location','southeast');
title(hlg, 'k','FontWeight','normal')
title('Heuman \Lambda_0')
xlabel('\phi/\pi')
ylabel('\Lambda_0(\phi,k)');
%ylim([-0.5,1])
grid on
hold off

figure(2)
set(gcf, 'Position', [488 298 560 560]);
clf
hold on
x = -1:0.005:1;
k = [0, 0.25, 0.5, 0.75, 1];
for n = 1:length(k)
    clg{n} = num2str(k(n));
    plot(x,pJacobiZeta(pi*x,k(n)),'LineWidth',2)
end
hlg = legend(clg,'Location','southeast');
title(hlg, 'k','FontWeight','normal')
title('Jacobi Z')
xlabel('\phi/\pi')
ylabel('Z(\phi,k)');
%ylim([-0.5,1])
grid on
hold off

figure(3)
set(gcf, 'Position', [488 298 560 560]);
clf
hold on
title('Jacobi Z(\phi,k)')
xlabel('\phi/\pi')
ylabel('k')
view(3)
x = -1:0.01:1;
k = -1:0.01:1;
[X,K] = meshgrid(x,k);
hs = surfc(X,K,pJacobiZeta(pi*X,K),'EdgeColor','none','FaceAlpha',fa);
hc = hs(2);
hc.ContourZLevel = -1;
%hc.LineWidth = 1;
hc.LevelList = -1:0.1:1;
caxis([-1 1])
%zlim([-1.1,1.1])
grid on
hold off

figure(4)
set(gcf, 'Position', [488 298 560 560]);
clf
hold on
title('Jacobi Z(x,k)')
xlabel('x')
ylabel('k')
view(3)
x = -2:0.01:2;
k = -1:0.01:1;
[X,K] = meshgrid(x,k);
hs = surfc(X,K,JacobiZeta(X,K),'EdgeColor','none','FaceAlpha',fa);
hc = hs(2);
hc.ContourZLevel = -1;
%hc.LineWidth = 1;
hc.LevelList = -1:0.1:1;
caxis([-1 1])
%zlim([-1.1,1.1])
grid on
hold off