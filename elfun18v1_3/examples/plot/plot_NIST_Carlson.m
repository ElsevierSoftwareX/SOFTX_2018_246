% Figures from 
% Olver, F.W.J. (Ed.), "NIST handbook of mathematical functions."
% Cambridge University Press : NIST, Cambridge ; New York, pp. xv, 951 p

%Figure 19.3.2
figure(11)
clf
x = 0:0.01:5;
hold on
plot(x,CarlsonRC(x,1),'LineWidth',2)
plot(x,CarlsonRC(x,-1),'LineWidth',2)
title('RC(x,y)')
hlgd=legend('1','-1');
title(hlgd,'y')
%xlabel('x')
ylim([0,2])
grid on
hold off

%plotRF plot graph on Figure 19.17.1-4

dx = 0.01;
xmax = 1;
x = 0:dx:xmax;
y = [ 0, 0.1, 0.5, 1];
z = 1;
p = 2;

figure(1)
clf
hold on
for n = 1:length(y)
    plot(x,CarlsonRF(x,y(n),z),'LineWidth',2)
end
title('RF(x,y,1)')
hlgd=legend('0','0.1','0.5','1');
title(hlgd,'y')
xlabel('x')
ylim([1,2.5])
grid on
hold off

figure(2)
clf
hold on
for n = 1:length(y)
    plot(x,CarlsonRG(x,y(n),z),'LineWidth',2)
end
title('RG(x,y,1)')
hlgd=legend('0','0.1','0.5','1');
title(hlgd,'y')
xlabel('x')
grid on
hold off

figure(3)
clf
hold on
x = 0:0.01:2;
y = [ 0, 0.1, 1, 5, 25];
for n = 1:length(y)
    plot(x,CarlsonRD(x,y(n),z),'LineWidth',2)
end
title('RD(x,y,1)')
hlgd=legend('0','0.1','1','5', '25');
title(hlgd,'y')
xlabel('x')
ylim([0,5])
grid on
hold off


figure(4)
clf
hold on
x = 0:0.01:1;
y = [ 0, 0.1, 0.5, 1];
for n = 1:length(y)
    plot(x,CarlsonRJ(x,y(n),z, p),'LineWidth',2)
end
title('RJ(x,y,1,2)')
hlgd=legend('0','0.1','0.5','1');
title(hlgd,'y')
xlabel('x')
ylim([0,4])
grid on
hold off

figure(5)
clf
p = 0.5;
hold on
for n = 1:length(y)
    plot(x,CarlsonRJ(x,y(n),z, p),'LineWidth',2)
end
title('RJ(x,y,1,0.5)')
hlgd=legend('0','0.1','0.5','1');
title(hlgd,'y')
xlabel('x')
ylim([0,10])
grid on
hold off

figure(6)
clf
p = -0.5;
hold on
for n = 1:length(y)
    plot(x,CarlsonRJ(x,y(n),z, p),'LineWidth',2)
end
title('RJ(x,y,1,-0.5)')
hlgd=legend('0','0.1','0.5','1');
title(hlgd,'y')
xlabel('x')
ylim([-12,0])
grid on
hold off

%figure(6)
%clf
%p = -0.5;
%hold on
%for n = 1:length(y)
%    plot(x,CarlsonRJ(x,y(n),z, p),'LineWidth',2)
%end
%title('RJ(x,y,1,-0.5)')
%hlgd=legend('0','0.1','0.5','1');
%title(hlgd,'y')
%xlabel('x')
%grid on
%hold off
%return

figure(7)
clf
hold on
y = [ 0, 0.01, 0.05, 0.2, 1];
p = -1:0.01:0;
for n = 1:length(y)
    plot(p,CarlsonRJ(0.5,y(n),1,p),'LineWidth',2)
end
title('RJ(0.5,y,1,p)')
hlgd=legend('0','0.01','0.05','0.2', '1');
title(hlgd,'y')
xlabel('p')
grid on
hold off

figure(8)
clf
hold on
y = 0:0.0002:1;
p = -1:0.0002:2;
[Y,P]=meshgrid(y,p);
s = surfc(Y,P,CarlsonRJ(0,Y,1,P),...
    'FaceColor','interp','FaceLighting','flat','FaceAlpha',0.75,'EdgeColor','none');
hc = s(2);
hc.ContourZLevel = -12;
hc.LineWidth = 1;
hc.LevelList = -12:2:12;
zlim([-12,12]);
title('RJ(0,y,1,p)')
colormap(jet)
%hlgd=legend('0','0.01','0.05','0.2', '1');
%title(hlgd,'y')
xlabel('y')
ylabel('p')
view([42.4 40.4]);
caxis([-12 12]);

grid on
hold off



