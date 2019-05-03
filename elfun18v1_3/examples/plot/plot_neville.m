% Graph of Neville theta functions.
% Fig 20.14 from Beebe - The Mathematical-Function Computation Handbook,
% Springer 2017

x = -8:0.01:8;
qq = [0.05, 0.25, 0.5, 0.75];
for n = 1:4
    q = qq(n);
    figure(n)
    clf
    hold on
    plot(x,NevilleThetaS(x*elK(ielnome(q)),q),'LineWidth',1.5)
    plot(x,NevilleThetaC(x*elK(ielnome(q)),q),'LineWidth',1.5)
    plot(x,NevilleThetaD(x*elK(ielnome(q)),q),'LineWidth',1.5)
    plot(x,NevilleThetaN(x*elK(ielnome(q)),q),'LineWidth',1.5)
    txt = sprintf('Neville theta functions (q = %g)',q);
    title(txt)
    legend('\theta_{s}','\theta_{c}','\theta_{d}','\theta_{n}',...
        'Location','best') %,'FontSize',14)
    grid on
    hold off
end