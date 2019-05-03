% Reproduce graphs from 
% Oldham, K.B., Myland, J.C., Spanier, J., 2009. "Atlas of functions 
% with Equator, the atlas function calculator", 2nd ed. Springer, New York.

k = 0:0.01:1;
x = -1:0.01:1;
[X,K] = meshgrid(x,k);

% Figure 63.5 ---------------------------------
figure(1)
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
figure(2)
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
figure(3)
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
