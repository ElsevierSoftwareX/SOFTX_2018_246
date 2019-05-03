% Plot Elliptic integrals from
% Olver, F.W.J. (Ed.), "NIST handbook of mathematical functions."
% Cambridge University Press : NIST, Cambridge ; New York, pp. xv, 951 p
%============================

% Figure 19.3.1 ----------------------------------------------
figure(1)
clf
hold on
m = -2:0.005:1;
plot(m,mEllipticK(m),'LineWidth',2)
plot(m,mEllipticE(m),'LineWidth',2)
title('Complete Elliptic Integrals')
xlabel('m')
ylim([0,4])
legend('K(m)','E(m)');
grid on
hold off

fa = 0.75;

% Figure 19.3.3 ----------------------------------------------
figure(3)
clf
hold on
title('Elliptic integral of 1st kind')
xlabel('x^{2}')
ylabel('m')
view(3)
phi = 0:0.01:pi/2;
m = -1:0.01:2;
x = sin(phi).^2;
[X,M] = meshgrid(x,m);
[Y,M] = meshgrid(sin(phi),m);
hs = surfc(X,M,mEllipticF(Y,M),'EdgeColor','none','FaceAlpha',fa)
hc = hs(2);
hc.ContourZLevel = 0;
hc.LineWidth = 1;
hc.LevelList = 0:0.3:3;
caxis([0 3])
zlim([0,3])
grid on
hold off


% Figure 19.3.4 ----------------------------------------------
figure(4)
clf
hold on
title('Elliptic integral of 2nd kind')
xlabel('x^{2}')
ylabel('m')
view(3)
phi = 0:0.01:pi/2;
m = -1:0.01:2;
x = sin(phi).^2;
[X,M] = meshgrid(x,m);
[Y,M] = meshgrid(sin(phi),m);
hs = surfc(X,M,mEllipticE(Y,M),'EdgeColor','none','FaceAlpha',fa);
hc = hs(2);
hc.ContourZLevel = 0;
hc.LineWidth = 1;
hc.LevelList = 0:0.2:2;
caxis([0 2])
zlim([0 1.9])
grid on
hold off

% Figure 19.3.5 ----------------------------------------------
figure(5)
clf
hold on
title('Elliptic integral of 3rd kind')
xlabel('n')
ylabel('m')
view(3)
n = -2:0.01:2;
m = -2:0.01:2;
[N,M] = meshgrid(n,m);
hs = surfc(N,M,mEllipticPi(N,M),'EdgeColor','none','FaceAlpha',fa);
hc = hs(2);
hc.ContourZLevel = -6;
hc.LineWidth = 1;
hc.LevelList = -6:0.5:6;
caxis([-6 6])
zlim([-6,6])
grid on
hold off


% Figure 19.3.6 ----------------------------------------------
figure(6)
clf
hold on
title('Elliptic integral of 3rd kind')
xlabel('x^2')
ylabel('m')
view(3)
phi = 0:0.05:pi/2;
m = -1:0.05:3;
x = sin(phi).^2;
[X,M] = meshgrid(x,m);
[Y,M] = meshgrid(sin(phi),m);
hs = surfc(X,M,mEllipticPi(Y,2,M),'EdgeColor','none','FaceAlpha',fa);
hc = hs(2);
hc.ContourZLevel = -2.5;
hc.LineWidth = 1;
hc.LevelList = -2.5:0.5:5;
zlim([-2.5,5])
caxis([-2.5 5])
grid on
hold off
return

figure(11)
clf
hold on
title('Complete Elliptic Integral K')
xlabel('m')
k = -2:0.005:2;
plot(k,mEllipticK(k),'LineWidth',2)
plot(k,mEllipticCK(k),'LineWidth',2)
grid on
hold off

figure(12)
clf
hold on
title('Complete Elliptic Integral K')
xlabel('k')
k = -1:0.005:1;
plot(k,EllipticK(k),'LineWidth',2)
plot(k,EllipticCK(k),'LineWidth',2)
grid on
hold off

figure(13)
clf
hold on
title('Complete Elliptic Integral D')
xlabel('k')
k = -1:0.005:1;
plot(k,EllipticD(k),'LineWidth',2)
plot(k,EllipticCK(k),'LineWidth',2)
grid on
hold off
return

return

return

figure(3)
clf
hold on
title('Bulirsch cel3')
xlabel('kc')
ylabel('p')
view(3)
kc = -0.4:0.01:0.4;
p = 0:0.01:0.4;
[KC,P] = meshgrid(kc,p);
surface(KC,P,BulirschCEL3(KC,P),'EdgeColor','none')
grid on
hold off

figure(5)
clf
hold on
title('Bulirsch el1')
xlabel('x')
ylabel('kc')
view(3)
x = -3:0.01:3;
kc = -3:0.01:3;
[X,KC] = meshgrid(x,kc);
surfc(X,KC,BulirschEL1(X,KC),'EdgeColor','none')
%fsurf(@BulirschEL1, [-2 2 -2 2] ,'EdgeColor','none')
grid on
hold off

figure(7)
clf
hold on
title('Carlson RC')
xlabel('x')
ylabel('y')
view(3)
x = 0:0.01:1;
y = 0:0.01:1;
[X,Y] = meshgrid(x,y);
surfc(X,Y,CarlsonRC(X,Y),'EdgeColor','none')
%fsurf(@BulirschEL1, [-2 2 -2 2] ,'EdgeColor','none')
grid on
hold off

figure(8)
clf
hold on
title('Gauss AGM')
xlabel('x')
ylabel('y')
view(3)
x = 0:0.01:1;
y = 0:0.01:1;
[X,Y] = meshgrid(x,y);
surfc(X,Y,GaussAGM(X,Y),'EdgeColor','none')
%fsurf(@BulirschEL1, [-2 2 -2 2] ,'EdgeColor','none')
grid on
hold off

figure(9)
clf
hold on
title('Complete elliptic Pi')
xlabel('x')
ylabel('y')
view(3)
x = 0:0.01:1;
y = 0:0.01:1;
[X,Y] = meshgrid(x,y);
surfc(X,Y,EllipticCPi(X,Y),'EdgeColor','none')
%fsurf(@BulirschEL1, [-2 2 -2 2] ,'EdgeColor','none')
grid on
hold off
