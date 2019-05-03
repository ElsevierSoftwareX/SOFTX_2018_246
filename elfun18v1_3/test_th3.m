nrun = 1000;
tic
for n = 1:nrun
    theta3(q);
end
toc
tic
for n = 1:nrun
    th3(q);
end
toc
tic
er = 0;
for n = 1:nrun
    q = rand();
    e = abs(th3(q)-theta3(q));
    if e > er
        er = e;
    end
end
toc
er

disp(th3(0.4) - 1.851725147218649);
disp(th3(0.5) - 2.128936827211877);
disp(th3(0.6) - 2.479925320694902);
disp(th3(0.7) - 2.967827368928780);
disp(th3(0.9) - 5.460545027060618);

disp(theta3(0.4) - 1.851725147218649);
disp(theta3(0.5) - 2.128936827211877);
disp(theta3(0.6) - 2.479925320694902);
disp(theta3(0.7) - 2.967827368928780);
disp(theta3(0.9) - 5.460545027060618);