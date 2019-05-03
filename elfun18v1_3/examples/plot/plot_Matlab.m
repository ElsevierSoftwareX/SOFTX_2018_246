% Matlab example 
M = 0.7;
U = -5:0.01:5;
S = mJacobiSN(U,M);
C = mJacobiCN(U,M);
D = mJacobiDN(U,M);
plot(U,S,U,C,U,D);
legend('SN','CN','DN','Location','best')
grid on
title('Jacobi Elliptic Functions sn,cn,dn')