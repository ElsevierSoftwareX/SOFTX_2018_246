nrun = 1000;
tic
for n = 1:nrun
    theta2(q);
end
toc
tic
for n = 1:nrun
    th2(q);
end
toc
tic
er = 0;
for n = 1:nrun
    q = rand();
    e = abs(th2(q)-theta2(q));
    if e > er
        er = e;
    end
end
toc
%er
disp(th2(0.4) - 1.851569650897229);
disp(th2(0.5) - 2.128931250513028);
disp(th2(0.6) - 2.479925280372744);
disp(th2(0.7) - 2.967827368917376);
disp(th2(0.9) - 5.460545027060618);