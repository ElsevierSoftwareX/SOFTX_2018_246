% test limit cases of E
%{
fprintf('Test m -> 1\n')
fprintf('%12s %12s %12s %12s %12s\n','n','m','exE','apE','rerr')
for n = 1:16
    m = 1 - 1/10^n;
    exE = ellipticE(m);
    apE = melE(m);
    fprintf('%12g %12g %12g %12g %12g\n',n,m,exE,apE,apE/exE-1)
end
%}
%%{
fprintf('\nTest m -> -inf\n')
 fprintf('%12s %12s %12s %12s %12s\n','n','m','exE','apE','rerr')
for n = 1:10:280
    m = -10^n;
    exE = ellipticE(m);
    apE = melE(m);
    fprintf('%12g %12g %12g %12g %12g\n',n,m,exE,apE,apE/exE-1)
end
%}
%{
fprintf('\nTest m -> 0\n')
 fprintf('%12s %12s %12s %12s %12s\n','n','m','exE','apE','rerr')
for n = 1:5:180
    m = 1/10^n;
    exE = ellipticE(m);
    apE = melE(m);
    fprintf('%12g %12g %12g %12g %12g\n',n,m,exE,apE,apE/exE-1)
end
%}