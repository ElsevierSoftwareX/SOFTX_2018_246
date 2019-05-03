% Flexural elastica 

% Data
lambda = 5;
cc     = 1;
kk     = [0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9];

% Plot
figure
hold on
s = 0:0.01:1;
C = cc*ones(size(s));
for n = 1:length(kk)
    k = -kk(n);
    x = -s + 2*(JacobiEpsilon(lambda*s + C,k) - JacobiEpsilon(C,k))/lambda;
    y = 2*k*(JacobiCN(C,k) - JacobiCN(lambda*s + C,k))/lambda;
    plot(x,y,'LineWidth',2)
end
legend('0.1','0.2','.3','0.4','0.5','0.6','0.7','0.8','0.9',...
    'Location','best')
axis equal
grid on
hold off

    