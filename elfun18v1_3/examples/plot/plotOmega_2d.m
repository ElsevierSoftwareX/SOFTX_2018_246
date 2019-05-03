% Plot Pi - 2d
%============================


figure(3)
clf
hold on
nu = 0.5;
m = [0.9,0.99,.99999];
x = -4:0.001:4;
clg={};
for n = 1:length(m)
    clg{n} = num2str(m(n));
    plot(x,mJacobiOmega(x,nu,m(n)),'LineWidth',2)
end
hlg = legend(clg,'Location','best');
title(hlg, 'm','FontWeight','normal')
title('Periodic part of function \Lambda')
xlabel('u')
ylabel(strcat(strcat('\Omega(u,',num2str(nu)),',m)'));
%ylim([-0.5,0.5])
grid on
hold off
hold off

figure(4)
clf
hold on
m = 0.5;
nu = [0.99,0.999,0.9999];
x = -3:0.001:3;
K=melK(m);
clg={};
for n = 1:length(nu)
    clg{n} = num2str(nu(n));
    plot(x,mJacobiOmega(K*x,nu(n),m),'LineWidth',2)
end
hlg = legend(clg,'Location','best');
title(hlg, '\nu','FontWeight','normal')
title('Periodic part of function \Lambda')
xlabel('u/K')
ylabel(strcat(strcat('\Omega(u,\nu,',num2str(m)),')'));
%ylim([-0.5,0.5])
grid on
hold off
hold off