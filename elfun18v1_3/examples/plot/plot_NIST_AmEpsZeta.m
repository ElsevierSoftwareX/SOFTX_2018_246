% Reproduce graphs from 
% Olver, F.W.J. (Ed.), "NIST handbook of mathematical functions."
% Cambridge University Press : NIST, Cambridge ; New York, pp. xv, 951 p
% ====================================

npts = 100;
k = [0.4, 0.7, 0.99, 0.999999];
s = pi;
xlim =  10
x = linspace( 0, xlim, npts);
xx = x*s;

% Figure 22.16.1 --------------------------------------
figure(1)
clf
hold on
nn = length(k);
for n = 1:nn 
    txt{n} = num2str(k(n),6);
    plot(x,JacobiAM(xx,k(n)),'LineWidth',2)
end
hlg = legend(txt,'Location','best')
title(hlg, 'k','FontWeight','normal')
xlabel('x/\pi')
ylim([0, 30]);
title('Jacobi''s amplitude function am(x,k)','FontWeight','normal')
grid on
hold off

%Figure 22.16.2 ------------------------------------------
figure(2)
clf
hold on
nn = length(k);
for n = 1:nn
    txt{n} = num2str(k(n),6);
    plot(x,JacobiEpsilon(xx,k(n)),'LineWidth',2)
end
hlg = legend(txt,'Location','best');
title(hlg, 'k','FontWeight','normal')
xlabel('x/\pi')
ylim([0, 30]);
title('Jacobi''s epsilon function \epsilon(x,k)','FontWeight','normal')
grid on
hold off

%Figure 22.16.3 ------------------------------------------
figure(3)
clf
hold on
nn = length(k);

for n = 1:nn
    
    txt{n} = num2str(k(n),6);
    plot(x,JacobiZeta(xx,k(n)),'LineWidth',2)
end
hlg = legend(txt,'Location','best');
title(hlg, 'k','FontWeight','normal')
xlabel('x/\pi')
ylim([-0.8, 0.8]);
title('Jacobi''s zeta function Z(x,k)','FontWeight','normal')
grid on
hold off

k = [0.5, 0.9999, 1.0001, 2];

% Figure 22.19.1 -------------------------------------------
figure(4) 
clf
hold on
nn = length(k);

for n = 1:nn
    
    txt{n} = num2str(k(n),6);
    plot(x,JacobiAM(xx,k(n)),'LineWidth',2)
end
hlg = legend(txt,'Location','best');
title(hlg, 'k','FontWeight','normal')
xlabel('x/\pi')
ylim([-2, 12]);
title('Jacobi''s amplitude function am(x,k)','FontWeight','normal')
grid on
hold off

