x=linspace(0,20);
m = 1.1;
f1 = mJacobiEpsilon(x,m);
f2 = mpEllipticE(mJacobiAM(x,m),m);
f3 = ellipticE(jacobiAM(x,m),m);
figure(1)
clf
hold on

plot(x,f3,'b','LineWidth',2)
plot(x,f2,'b:','LineWidth',2)
plot(x,f1,'r','LineWidth',2)
legend({'E(am(x|m),m) - MATLAB R2018a','E(am(x|m),m)','\epsilon(x|m)'},'Location','northwest','FontSize',12)
grid on
 print(gcf,'JacobiEpsilon.png','-dpng','-r600')