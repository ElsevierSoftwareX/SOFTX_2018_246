% test
N = 10000;
tic()
for n = 1:N
    k1 = fzero(@fun1,0.5);
end
t1=toc/N;
tic()
for n = 1:N
    k2 = sqrt(fzero(@fun2,0.5));
end
t2 = toc/N;
fprintf('k1 = %f k1-k2 = %f  \nt1 = %f t2 = %f  t1/t2 = %f\n',k1,k1-k2,t1,t2,t2/t1);

function f = fun1(k)
% Elfun18
f = 2*elE(k) - elK(k);
end

function f = fun2(m)
% MATLAB
[K,E] = ellipke(m);
f = 2*E - K;
end

