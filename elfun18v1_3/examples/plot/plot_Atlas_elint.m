% Reproduce graphs from 
% Oldham, K.B., Myland, J.C., Spanier, J., 2009. "Atlas of functions 
% with Equator, the atlas function calculator", 2nd ed. Springer, New York.

% Figure 61.5 --------------------
k = 0:0.01:1;
x = -9:0.01:9;
[X,K] = meshgrid(x,k);
figure(1)
clf
hold on
hs = surfc(X,K,EllipticPi(X,K),'EdgeColor','none');
hc = hs(2);
hc.ContourZLevel = -2.4;
hc.LineWidth = 1;
hc.LevelList = -2.4:0.2:2.4;
caxis([-2.4 2.4])
zlim([-2.4 2.4])
view(3);
xlabel('x');
ylabel('k');
zlabel('\Pi(x,k)')
grid on
hold off
%-------------

% Figure 62.2 --------------------
k = 0:0.01:1;
x = -1:0.01:2;
[X,K] = meshgrid(x,k);
figure(2)
clf
hold on
hs = surfc(X,K,pEllipticF(pi*X,K),'EdgeColor','none');
hc = hs(2);
hc.ContourZLevel = -15;
hc.LineWidth = 1;
hc.LevelList = -15:1:15;
caxis([-15 15])
zlim([-15 15])
view(3);
xlabel('x/\pi');
ylabel('k');
zlabel('F(\phi,k)')
grid on
hold off
%-------------

% Figure 62.3 --------------------
k = 0:0.01:1;
x = -1:0.01:2;
[X,K] = meshgrid(x,k);
figure(3)
clf
hold on
hs = surfc(X,K,pEllipticE(pi*X,K),'EdgeColor','none');
hc = hs(2);
hc.ContourZLevel = -15;
hc.LineWidth = 1;
hc.LevelList = -15:1:15;
caxis([-15 15])
zlim([-15 15])
view(3);
xlabel('x/\pi');
ylabel('k');
zlabel('E(\phi,k)')
grid on
hold off
%-------------