% Plot Pi - 2d
%============================

% Jacobi form

figure(1)
clf
hold on
m = 0.5;
nu = [-2,-1,0,0.5,1, 2];
x = -1:0.0001:1;
clg={};
for n = 1:length(nu)
    clg{n} = num2str(nu(n));
    plot(x,mEllipticPi(x,nu(n),m),'LineWidth',2)
end
hlg = legend(clg,'Location','best');
title(hlg, '\nu','FontWeight','normal')
title('Jacobi form of elliptic integral of the 3rd kind')
xlabel('x')
ylabel(strcat(strcat('\Pi(x,\nu,',num2str(m)),')'));
ylim([-3,3])
grid on
hold off

figure(2)
clf
hold on
%m = 1.5;
%nu = [ -2,-1,0,0.5,1, 2];
x = -2:0.0001:2;
clg={};
for n = 1:length(nu)
    clg{n} = num2str(nu(n));
    plot(x,mpEllipticPi(pi*x,nu(n),m),'LineWidth',2)
end
hlg = legend(clg,'Location','best');
title(hlg, '\nu','FontWeight','normal')
title('Legendre form of elliptic Integral of the 3rd kind')
xlabel('\phi/\pi')
ylabel(strcat(strcat('\Pi(\phi,\nu,',num2str(m)),')'));
ylim([-3,3])
grid on
hold off

figure(3)
clf
hold on
%m = 1.5;
%nu = [-2,-1,0,0.5,1, 2];
x = -8:0.0001:8;
K=melK(m)
clg={};
for n = 1:length(nu)
    clg{n} = num2str(nu(n));
    plot(x,mJacobiLambda(x*K,nu(n),m),'LineWidth',2)
end
hlg = legend(clg,'Location','best');
title(hlg, '\nu','FontWeight','normal')
title('Jacobi 2nd form of elliptic integral of the 3rd kind')
xlabel('u/K')
ylabel(strcat(strcat('\Lambda(u,\nu,',num2str(m)),')'));
ylim([-3,3])
grid on
hold off
hold off