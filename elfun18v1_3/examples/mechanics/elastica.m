% Flexural elastica 

% Data
omega = 5;             % load parameter
cc    = 1;             % integration constant
kk    = 0.1:0.1:0.9;   % eliptic modulus 

% Plot shapes 
figure
hold on
s = 0:0.01:1;
C = cc*ones(size(s));
for k = kk
    x = -s + 2*(JacobiEpsilon(omega*s + C,k) - JacobiEpsilon(C,k))/omega;
    y = 2*k*(JacobiCN(C,k) - JacobiCN(omega*s + C,k))/omega;
    plot(x,y,'LineWidth',2)
end
h=legend('0.1','0.2','.3','0.4','0.5','0.6','0.7','0.8','0.9',...
    'Location','best');
title(h,'k')
xlabel('x')
ylabel('y')
axis equal
grid on
hold off
  print(gcf,'elastica.png','-dpng','-r600')

    