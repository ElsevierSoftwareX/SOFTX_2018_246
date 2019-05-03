fprintf('================================\n')
fprintf('Elliptic integral K timing\n')
fprintf('================================\n')

path = 'C:\Program Files\MATLAB\R2018a\toolbox\symbolic\symbolic';
addpath(path)



nrun = 1000000;
fprintf('number of runs = %d\n',nrun)
m = rand(nrun,1);
y = zeros(nrun,1);

fprintf('Timing K - individual call\n')
fprintf(' mjsn\n')
tic()
for n = 1:nrun
    y(n) = melK(m(n));
end
t1 = toc();
fprintf('   average %.16g time %gs\n',mean(y),t1);

fprintf(' ellipke\n')
tic()
for n = 1:nrun
    [y(n),~] = ellipke(m(n));
end
t2 = toc();
fprintf('   average %.16g time %gs t2/t1 = %g\n',mean(y), t2, t2/t1);
fprintf(' elipticK\n')
tic()
for n = 1:nrun
 %   y(n) = ellipticK(m(n));
end
t3 = toc();
fprintf('   average %.16g time %gs t3/t1 = %g \n',mean(y), t3,t3/t1);

nrun = 10000;
fprintf('Timing K - compact call - vector argument\n')
fprintf(' melK\n')
tic()
y = mEllipticK(m);
t1 = toc();
fprintf('   average %.16g time %gs\n',mean(y), t1);

fprintf(' ellipke\n')
tic()
[y,~] = ellipke(m);
t2 = toc();
fprintf('   average %.16g time %gs t2/t1 = %g\n', mean(y), t2, t2/t1);

fprintf(' ellipticK\n')
tic()
%y = ellipticK(m);
t3 = toc();
fprintf('   average %.16g time %gs t3/t1 = %g \n',mean(y),t3,t3/t1);

fprintf('Timing K - compact call - matrix argument\n')
nrun = 1000;
fprintf('number of runs = %d\n',nrun)
m = rand(nrun);
y = zeros(nrun);
fprintf(' mjsn\n')
tic()
y = mEllipticK(m);
t1 = toc();
fprintf('   average %.16g time %gs\n',mean(mean(y)), t1);

fprintf(' ellipke\n')
tic()
[y,~] = ellipke(m);
t2 = toc();
fprintf('   average %.16g time %gs t2/t1 = %g\n', mean(mean(y)), t2, t2/t1);
fprintf(' ellipticK\n')
tic()
%y = ellipticK(m);
t3 = toc();
fprintf('   average %.16g time %gs t3/t1 = %g \n',mean(mean(y)),t3,t3/t1);
