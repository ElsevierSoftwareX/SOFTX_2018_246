% Reproduce graphs from 
% Olver, F.W.J. (Ed.), "NIST handbook of mathematical functions."
% Cambridge University Press : NIST, Cambridge ; New York, pp. xv, 951 p

% Figure 22.3.1-4 ---------------------------------
npts = 100;
k = [0.4, 0.7, 0.99, 0.999999];

for n = 1:4
    s = elK( k(n) );
    xlim =  3;
    x = linspace( -xlim, xlim, npts);   
    xx = x*s;
    figure(n)
    clf
    hold on
    plot(x,JacobiSN(xx,k(n)),'LineWidth',2)
    plot(x,JacobiCN(xx,k(n)),'LineWidth',2)
    plot(x,JacobiDN(xx,k(n)),'LineWidth',2)
    plot(x,JacobiND(xx,k(n)),'LineWidth',2)    
    hlg = legend('sn','cn','dn','nd');
    title(hlg, strcat('k = ',num2str(k(n),6)),'FontWeight','normal')
    xlabel('x/K');
    ylim([-1.05,1.5]);
    grid on
    hold off
end

% Figure 22.3.13 -------------------------------
npts = 100;
m = linspace(0,20,npts);
k = 1 - exp(-m);
xlim = 5;
x = linspace( -xlim, xlim, npts);
[X,M]=meshgrid(x,m);
[X,K]=meshgrid(x,k);
figure(5)
clf
hold on
s = surface(X,M,JacobiSN(X*pi,K),...
    'FaceColor','interp','FaceLighting','flat','FaceAlpha',0.99);
s.EdgeColor = 'none';
zlim([-1,1]);
title('sn(x,1-e^{-n})')
%hlgd=legend('0','0.01','0.05','0.2', '1');
%title(hlgd,'y')
xlabel('x/\pi');
ylabel('n');
view([42.4 40.4]);
grid on
colormap('jet')
set(gca,'CLim',[-1 1]);