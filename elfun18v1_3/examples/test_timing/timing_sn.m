fprintf('================================\n')
fprintf('Jacobi elliptic functions timing\n')
fprintf('================================\n')

path = 'C:\Program Files\MATLAB\R2018a\toolbox\symbolic\symbolic';
addpath(path)



nrun = 1000;
fprintf('number of runs = %d\n',nrun)
x = rand(nrun,1);
m = rand(nrun,1);
y = zeros(nrun,1);

fprintf('Timing SN - individual call\n')
fprintf(' mjsn\n')
tic()
for n = 1:nrun
    y(n) = mjsn(x(n),m(n));
end
t1 = toc();
fprintf('   average %.16g time %gs\n',mean(y),t1);

fprintf(' ellipj\n')
tic()
for n = 1:nrun
    [y(n),~,~] = ellipj(x(n),m(n));
end
t2 = toc();
fprintf('   average %.16g time %gs t2/t1 = %g\n',mean(y), t2, t2/t1);
fprintf(' jacobiSN\n')
tic()
for n = 1:nrun
    y(n) = jacobiSN(x(n),m(n));
end
t3 = toc();
fprintf('   average %.16g time %gs t3/t1 = %g \n',mean(y), t3,t3/t1);

fprintf('Timing SN - compact call - vector arguments\n')
fprintf(' mjsn\n')
tic()
y = mJacobiSN(x,m);
t1 = toc();
fprintf('   average %.16g time %gs\n',mean(y), t1);

fprintf(' ellipj\n')
tic()
[y,~,~] = ellipj(x,m);
t2 = toc();
fprintf('   average %.16g time %gs t2/t1 = %g\n', mean(y), t2, t2/t1);

fprintf(' jacobiSN\n')
tic()
y = jacobiSN(x,m);
t3 = toc();
fprintf('   average %.16g time %gs t3/t1 = %g \n',mean(y),t3,t3/t1);

fprintf('Timing SN - compact call - matrix arguments\n')
nrun = 100;
fprintf('number of runs = %d\n',nrun)
x = rand(nrun);
m = rand(nrun);
y = zeros(nrun);
fprintf(' mjsn\n')
tic()
y = mJacobiSN(x,m);
t1 = toc();
fprintf('   average %.16g time %gs\n',mean(mean(y)), t1);

fprintf(' ellipj\n')
tic()
[y,~,~] = ellipj(x,m);
t2 = toc();
fprintf('   average %.16g time %gs t2/t1 = %g\n', mean(mean(y)), t2, t2/t1);
fprintf(' jacobiSN\n')
tic()
y = jacobiSN(x,m);
t3 = toc();
fprintf('   average %.16g time %gs t3/t1 = %g \n',mean(mean(y)),t3,t3/t1);
