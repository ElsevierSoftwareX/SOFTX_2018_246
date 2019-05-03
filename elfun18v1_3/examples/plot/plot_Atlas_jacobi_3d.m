% Reproduce graphs from 
% Oldham, K.B., Myland, J.C., Spanier, J., 2009. "Atlas of functions 
% with Equator, the atlas function calculator", 2nd ed. Springer, New York.

k = 0:0.01:1;
x = -1:0.01:1;
[X,K] = meshgrid(x,k);

% Figure 63.1 ---------------------------------

figure(1)
clf
hold on
subplot(1,3,1)
surfc(X,K,JacobiCN(pi*X,K),'EdgeColor','none');
caxis([-1 1])
view([35 15]);
xlabel('x');
ylabel('k');
zlabel('cn(x,k)')
subplot(1,3,2)
surfc(X,K,JacobiSN(pi*X,K),'EdgeColor','none');
caxis([-1 1])
view([35 15]);
xlabel('x');
ylabel('k');
zlabel('sn(x,k)')
subplot(1,3,3)
hs = surfc(X,K,JacobiDN(pi*X,K),'EdgeColor','none');
hc = hs(2);
hc.ContourZLevel = -1;
hc.LineWidth = 1;
hc.LevelList = 0:0.2:1;
caxis([-1 1])
view([35 15]);
xlabel('x');
ylabel('k');
zlim([-1,1])
zlabel('dn(x,k)')
hold off

% Figure 63.2 ---------------------------------

figure(2)
clf
hold on
subplot(1,3,1)
hs = surfc(X,K,JacobiCD(pi*X,K),'EdgeColor','none');
hc = hs(2);
hc.ContourZLevel = -5;
hc.LineWidth = 1;
hc.LevelList = -5:0.1:5;
caxis([-5 5])
view([35 15]);
xlabel('x');
ylabel('k');
zlabel('cd(x,k)')
zlim([-5,5])
subplot(1,3,2)
hs = surfc(X,K,JacobiSD(pi*X,K),'EdgeColor','none');
hc = hs(2);
hc.ContourZLevel = -5;
hc.LineWidth = 1;
hc.LevelList = -5:0.2:5;
caxis([-5 5])
view([35 15]);
xlabel('x');
ylabel('k');
zlabel('sn(x,k)')
zlim([-5,5])
subplot(1,3,3)
hs = surfc(X,K,JacobiND(pi*X,K),'EdgeColor','none');
hc = hs(2);
hc.ContourZLevel = -5;
hc.LineWidth = 1;
hc.LevelList =0:0.1:5;
caxis([-5 5])
view([35 15]);
xlabel('x');
ylabel('k');
zlim([-5,5])
zlabel('nd(x,k)')
hold off

% Figure 63.3 ---------------------------------

figure(3)
clf
hold on
subplot(1,3,1)
hs = surfc(X,K,JacobiCS(pi*X,K),'EdgeColor','none');
hc = hs(2);
hc.ContourZLevel = -5;
hc.LineWidth = 1;
hc.LevelList = -5:0.1:5;
caxis([-5 5])
view([35 15]);
xlabel('x');
ylabel('k');
zlabel('cs(x,k)')
zlim([-5,5])
subplot(1,3,2)
hs = surfc(X,K,JacobiDS(pi*X,K),'EdgeColor','none');
hc = hs(2);
hc.ContourZLevel = -5;
hc.LevelList = -5:0.1:5;
hc.LineWidth = 1;
caxis([-5 5])
view([35 15]);
xlabel('x');
ylabel('k');
zlabel('ds(x,k)')
zlim([-5,5])
subplot(1,3,3)
hs = surfc(X,K,JacobiNS(pi*X,K),'EdgeColor','none');
hc = hs(2);
hc.ContourZLevel = -5;
hc.LineWidth = 1;
hc.LevelList = -5:0.1:5;
caxis([-5 5])
view([35 15]);
xlabel('x');
ylabel('k');
zlim([-5,5])
zlabel('ns(x,k)')
hold off

% Figure 63.4 ---------------------------------

figure(4)
clf
hold on
subplot(1,3,1)
f = JacobiSC(pi*X,K);
f(abs(f)>10) = NaN;
hs = surfc(X,K,f,'EdgeColor','none');
hc = hs(2);
hc.ContourZLevel = -5;
hc.LineWidth = 1;
hc.LevelList = -5:0.1:5;
caxis([-5 5])
view([35 15]);
xlabel('x');
ylabel('k');
zlabel('sc(x,k)')
zlim([-5,5])
subplot(1,3,2)
f = JacobiDC(pi*X,K);
f(abs(f)>10) = NaN;
hs = surfc(X,K,f,'EdgeColor','none');
hc = hs(2);
hc.ContourZLevel = -5;
hc.LineWidth = 1;
hc.LevelList = -5:0.1:5;
caxis([-5 5])
view([35 15]);
xlabel('x');
ylabel('k');
zlabel('dc(x,k)')
zlim([-5,5])
subplot(1,3,3)
f = JacobiNC(pi*X,K);
f(abs(f)>10) = NaN;
hs = surfc(X,K,f,'EdgeColor','none');
hc = hs(2);
hc.ContourZLevel = -5;
hc.LineWidth = 1;
hc.LevelList = -5:0.1:5;
caxis([-5 5])
view([35 15]);
xlabel('x');
ylabel('k');
zlim([-5,5])
zlabel('nc(x,k)')
hold off

% Figure 63.5 ---------------------------------
figure(5)
clf
hold on
x = -0.2:0.01:1.2;
k =[0, 0.8, 0.99, 0.95, 0.9999, 1-1e-9];
for n = 1:length(k)
    K = elK(k(n));
    plot( x, JacobiCN(K*x,k(n)),'LineWidth',2)
end
legend('0','0.8','0.99','0.95','0.9999','1-1e-9','Location','best')
xlabel('x/K')
ylabel('cn(x,k)')
%xlim([-0.1,1.2])
ylim([-0.1,1.05])
grid on
hold off

% Figure 63.6 ---------------------------------
figure(6)
clf
hold on
x = -0.2:0.01:1.2;
k =[0, 0.8, 0.99, 0.95, 0.9999, 1-1e-9];
for n = 1:length(k)
    K = elK(k(n));
    plot( x, JacobiSN(K*x,k(n)),'LineWidth',2)
end
legend('0','0.8','0.99','0.95','0.9999','1-1e-9','Location','best')
xlabel('x/K')
ylabel('sn(x,k)')
%xlim([-0.1,1.2])
ylim([-0.1,1.05])
grid on
hold off

% Figure 63.7 ---------------------------------
figure(7)
clf
hold on
x = -0.2:0.01:1.2;
k =[0, 0.8, 0.99, 0.95, 0.9999, 1-1e-9];
for n = 1:length(k)
    K = elK(k(n));
    plot( x, JacobiDN(K*x,k(n)),'LineWidth',2)
end
legend('0','0.8','0.99','0.95','0.9999','1-1e-9','Location','best')
xlabel('x/K')
ylabel('dn(x,k)')
%xlim([-0.1,1.2])
ylim([-0.1,1.05])
grid on
hold off
