fprintf('Test of peroiodicity\n\n')
cfun = { ...
    'jcd','jcn','jcs',...
    'jdc','jdn','jds',...
    'jnc','jnd','jns',...
    'jsc','jsd','jsn',...
    'jzeta',...
    };
clin = repmat('-',1,90);
N=1e5;
fprintf('number of evaluations N = %d\n',N);
x0 = 0.23;
k = 0.999;
fprintf('x = %g k = %g\n',x0,k)
K = EllipticK(k);
fprintf('%s\n',clin)
fprintf('%16s%16s%16s%16s%16s\n','Func.','f(x)','f(x+N*K)','Diff.','NDIG')
fprintf('%s\n',clin)
for i = 1:length(cfun)
    fun = str2func(cfun{i});
    y0 = fun(x0,k);
    y = zeros(N,1);
    for n=1:N
        x = x0 + 4*n*K;
        y(n) = fun( x, k);
    end
    fprintf('%16s%16.12f%16.12f%16g%16g\n',cfun{i},y(1),y(N),y(1)-y(N),log10(y(N)/y(1)-1));
end
fprintf('%s\n',clin)
return

figure(1)
clf
hold on
title(strcat('Test of ',cfun))
xlabel('log10(n)')
ylabel('log10(aerr)')
plot(log10(1:N),log10(abs(y/y0-1)))
grid on
hold off

