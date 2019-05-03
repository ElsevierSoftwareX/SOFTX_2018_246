% plot inverse

x = -5:0.001:5;
k = -1.5;

for ifun = 0:12
    figure (ifun+1)
    clf
    hold on
    switch ifun
        case 0
            title('JacobiAM')
            plot(x,JacobiAM(x,k),InverseJacobiAM(x,k),x,'LineWidth',2)
        case 1
            title('JacobiSN')
            plot(x,JacobiSN(x,k),InverseJacobiSN(x,k),x,'LineWidth',2)
        case 2
            title('JacobiCN')
            plot(x,JacobiCN(x,k),InverseJacobiCN(x,k),x,'LineWidth',2)
        case 3
            title('JacobiDN')
            plot(x,JacobiDN(x,k),InverseJacobiDN(x,k),x,'LineWidth',2)
        case 4
            title('JacobiCD')
            plot(x,JacobiCD(x,k),InverseJacobiCD(x,k),x,'LineWidth',2)
        case 5
            title('JacobiCS')
            plot(x,JacobiCS(x,k),InverseJacobiCS(x,k),x,'LineWidth',2)
        case 6
            title('JacobiDC')
            plot(x,JacobiDC(x,k),InverseJacobiDC(x,k),x,'LineWidth',2)
        case 7
            title('JacobiDS')
            plot(x,JacobiDS(x,k),InverseJacobiDS(x,k),x,'LineWidth',2)
        case 8
            title('JacobiSC')
            plot(x,JacobiSC(x,k),InverseJacobiSC(x,k),x,'LineWidth',2)
        case 9
            title('JacobiSD')
            plot(x,JacobiSD(x,k),InverseJacobiSD(x,k),x,'LineWidth',2)
        case 10
            title('JacobiNC')
            plot(x,JacobiNC(x,k),InverseJacobiNC(x,k),x,'LineWidth',2)
        case 11
            title('JacobiND')
            plot(x,JacobiND(x,k),InverseJacobiND(x,k),x,'LineWidth',2)
        case 12
            title('JacobiNS')
            plot(x,JacobiNS(x,k),InverseJacobiNS(x,k),x,'LineWidth',2)
    end
    ylim([-4,4])
    grid on
    hold off
end
