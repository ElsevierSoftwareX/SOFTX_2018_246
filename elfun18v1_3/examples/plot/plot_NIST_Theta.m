% Reproduce graphs from NIST Handbook
% Olver, F.W.J. (Ed.), "NIST handbook of mathematical functions."
% Cambridge University Press : NIST, Cambridge ; New York, pp. xv, 951 p

% Figure 20.3

npts = 600;
q = [0.05, 0.5, 0.7, 0.9];

x = linspace( 0, 2, npts);
xx = pi*x;

figure(1)
clf
hold on
qq = 0.15;
plot(x,JacobiTheta1(xx,qq),'LineWidth',2)
plot(x,JacobiTheta2(xx,qq),'LineWidth',2)
plot(x,JacobiTheta3(xx,qq),'LineWidth',2)
plot(x,JacobiTheta4(xx,qq),'LineWidth',2)
hlg = legend('\theta_1','\theta_2','\theta_3','\theta_4','Location','best');
%title(hlg, strcat('q = ',num2str(q(n),6)),'FontWeight','normal')
xlabel('x/\pi')
ylim([-1.5,1.5]);
grid on
hold off

for m = 1:4
    figure(m+1)
    clf
    hold on
    for n = 1:length(q)
        switch m
            case 1
                ylabel('\theta_1(x,q)')
                y= JacobiTheta1(xx,q(n));
            case 2
                 ylabel('\theta_2(x,q)')
                y = JacobiTheta2(xx,q(n));
            case 3
                 ylabel('\theta_3(x,q)')
                y = JacobiTheta3(xx,q(n));
            case 4
                 ylabel('\theta_4(x,q)')
                y = JacobiTheta4(xx,q(n));
        end
        plot(x,y,'LineWidth',2)
    end
    hlg = legend('0.05','0.5','0.7','0.9','Location','best');
    title(hlg, strcat('q = ',num2str(q(n),6)),'FontWeight','normal')
    xlabel('x/\pi')
    if m <= 2
        ylim([-6,6]);
    else
        ylim([0, 6]);
    end
    grid on
    hold off
end
