% Tests for complete ellitic integral of the first kind

fprintf('Check values ************** \n')
m = [80/81, -1e7, 1e-4, 1-1e-5];
fex = [3.59154499979651292, ...
      0.00298687939216652428,...
       1.57083559891215224,...
       7.14277245058172823];
for n = 1:length(m)
    f = mEllipticK(m(n));
    rer = abs(f/fex(n)-1);
    fprintf('melK(%g) \t = %.16g \t rerr = %g\n',m(n),f,rer)    
end

k = sqrt(2)/2;
f = EllipticK(k);
fex = EllipticCK(k);
rer = abs(f/fex-1);
fprintf('elK(%g) \t = %.16g \t rerr = %g\n',k,f,rer)
k = 3 - 2*sqrt(2);
f = 2*EllipticK(k);
fex = EllipticCK(k);
rer = abs(f/fex-1);
fprintf('elK(%g) \t = %.16g \t rerr = %g\n',k,f,rer)
   cfun = {...
       'melK(m^2)/ elK(m) - 1', ...    
       'elK(m) - elK(-m)',... 
       'elE(m)*elCK(m) + elCE(m)*elK(m) - elK(m)*elCK(m) - pi/2',...
       'melK(m)/cel1(sqrt(1 - m)) - 1',...
       };      

   itest = zeros(length(cfun),1);
   itest(2) = 1;
   itest(3) = 1;
   itest(4) = 1;
   
nrun = 10000;
ntest = length(cfun);
NMX = 10;

fmt  = strcat(repmat('%10.2g',1,6),'\n');
fmt1 = strcat(repmat('%10s',1,6),'\n');
clin = repmat('-',1,76);

fprintf('\n Consistency tests for elliptic integral of 1st kind \n')

fprintf('\n');
fprintf('number of runs %g\n',nrun);
fprintf('fail = aerr>sqrt(eps)\n');

for nt = 1:ntest
    fun = str2func(strcat('@(m)',cfun{nt}));
    fprintf('\ntest %d %s = 0\n',nt, cfun{nt})
    fprintf('%s\n',clin);
    fprintf(fmt1,'min m','max m',...
        'MAE/eps','RME/eps','NDIG','nfail%');
    fprintf('%s\n',clin);
    rng('shuffle');
    for nn = 1:NMX
        mm = zeros(nrun,1);
        zz = zeros(nrun,1);
        nfail = 0;
        nfail1 = 0;
        f = zeros(nrun,1);
        N  = 2^nn;
        for n = 1:nrun
            m  = randi([-N, N]);
            m  = (-1)^(n+1)*rand()*2^m;
            if m > 1
                m = 1/m;
            end
            if itest(nt) == 1
                if abs(m) > 1
                    m = 1/m;
                end
            end
            f(n) = fun(m);
            if isnan(f(n)) || isinf(f(n))
                f(n) = NaN;
                m(n) = NaN;
                nfail = nfail + 1;
                continue
            end
            f(n) = abs(f(n));
            if f(n) > sqrt(eps)
                nfail1 = nfail1 + 1;
            end
            mm(n) = m;
        end
        mm(isnan(mm)) = [];
        f(isnan(f)) = [];
        fprintf(fmt,...
            min((mm)), max((mm)),...
            max(f)/eps,rms(f)/eps,log10(max(f)),...
            nfail/nrun*100);
        if nfail1 > 10
            break
        end
    end
end

path = 'C:\Program Files\MATLAB\R2018a\toolbox\symbolic\symbolic';
addpath(path)
NMAX = 51;
NSTP = 10;
nrun = 100;
fprintf('\n Check melK(m) = ellipticK(m)\n')
fprintf('%4s %12s %12s %12s %12s\n',...
    'fail','min(m)','max(m)','max(rer)','rms(rer)')
for nn = 1:NSTP:NMAX
    nfail = 0;
    rer = zeros(nrun,1);
    m   = zeros(nrun,1);     
    for n = 1:nrun
        m(n)   = randx(nn);   
        if m(n) > 1
            m(n) = rand/m(n);
        end
        fp = mEllipticK(m(n));
        fx = ellipticK(m(n));
        if isnan(fp) || isnan(fx) || imag(fp) ~= 0 || imag(fx) ~= 0
            nfail = nfail + 1;
            m(n)  = NaN;
            phi(n) = NaN;
            continue
        end
        if abs(fp) > 0
            rer(n) = abs(fp/fx -1);
        end
    end
    rer(isnan(rer)) = [];
    m(isnan(m  ))   = [];    
    fprintf('%4d %12.4g %12.4g %12.4g %12.4g\n',...
        nfail,min(m),max(m),max(rer),rms(rer))
end

function f = randx(nn)
N = nn;
r = randi(N);
f = (rand-0.5)*2^(r-floor(N/2));
end
        