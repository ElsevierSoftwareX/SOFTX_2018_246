fprintf('COMPLEMENTARY COMPLETE ELLIPTIC INTEGRAL OF THE THIRD KIND\n\n')
fprintf('Check values ************** \n')
m = 1/4;
nu = [1/16,5/8,5/4,-1/4];
fex = [2.23944310437543380, ...
       3.82647601763071056,...
       NaN,...
       1.89298976458932124];
for n = 1:length(nu)
    f = mEllipticCPi(nu(n),m);
    rer = abs(f/fex(n)-1);
    fprintf('pmEllipticPi(pi/4,%g,1/4) \t = %.16g \t rerr = %g\n',nu(n),f,rer)    
end



fprintf('\nVerification *****************\n')
NSTP = 10;
nrun = 100;
NMAX = 51;
fprintf('\n Check Pi''(nu,m) = E''(m)/m\n')
fprintf('%4s %12s %12s %12s %12s %12s %12s\n',...
    'fail','min(nu)','max(nu)','min(m)','max(m)','max(rer)','rms(rer)')
for nn = 1:NSTP:NMAX
    nfail = 0;
    rer = zeros(nrun,1);
    nu  = zeros(nrun,1);
    m   = zeros(nrun,1);
    for n = 1:nrun
        nu(n)  = randx(nn);
        m(n)   = randx(nn);
        if m(n) < 0
            m(n) = -m(n);
        end
        nu(n) = 1 - m(n);
        fp = mEllipticCPi(nu(n),m(n));
        fx = melCE(m(n))/(m(n));
        if isnan(fp) || isnan(fx) || imag(fp) ~= 0 || imag(fx) ~= 0
            nfail = nfail + 1;
            nu(n) = NaN;
            m(n)  = NaN;
            continue
        end
        if abs(fp) > 0
            rer(n) = abs(fp/fx -1);
        end
    end
    rer(isnan(rer)) = [];
    nu(isnan(nu ))  = [];
    m(isnan(m  ))   = [];
    fprintf('%4d %12.4g %12.4g %12.4g %12.4g %12.4g %12.4g\n',...
        nfail,min(nu),max(nu),min(m),max(m),max(rer),rms(rer))
end


%-----------------------------------------
fprintf('\nTest accuracy *****************\n')
path = 'C:\Program Files\MATLAB\R2018a\toolbox\symbolic\symbolic';
addpath(path)
NMAX = 100;
NSTP = 10;
nrun = 1000;
fprintf('\n Check mcelCPi(nu,k^2) = celCPi(nu,k)\n')
fprintf('%4s %12s %12s %12s %12s %12s %12s\n',...
    'fail','min(nu)','max(nu)','min(k)','max(k)','max(rer)','rms(rer)')
for nn = 1:NSTP:NMAX
    nfail = 0;
    rer = zeros(nrun,1);
    nu  = zeros(nrun,1);
    m   = zeros(nrun,1);     
    for n = 1:nrun
        nu(n)  = randx(nn);
        m(n)   = randx(nn);   
        if  nu(n) > 1
            nu(n) = 1/nu(n);
        end
        if m(n) > 1
            m(n) = 1/m(n);
        end
        fp = melCPi(nu(n),m(n)^2);
        fx =  elCPi(nu(n),m(n));
        if isnan(fp) || isnan(fx) || imag(fp) ~= 0 || imag(fx) ~= 0
            nfail = nfail + 1;
            nu(n) = NaN;
            m(n)  = NaN;
            continue
        end
        if abs(fp) > 0
            rer(n) = abs(fp/fx -1);
        end
    end
    rer(isnan(rer)) = [];
    nu(isnan(nu ))  = [];
    m(isnan(m  ))   = [];    
    fprintf('%4d %12.4g %12.4g %12.4g %12.4g %12.4g %12.4g\n',...
        nfail,min(nu),max(nu),min(m),max(m),max(rer),rms(rer))
end

fprintf('\n Check melCPi(nu,m) = ellipticCPi(nu,m)\n')
fprintf('%4s %12s %12s %12s %12s %12s %12s\n',...
    'fail','min(nu)','max(nu)','min(m)','max(m)','max(rer)','rms(rer)')
nrun = 100;
for nn = 1:NSTP:NMAX
    nfail = 0;
    rer = zeros(nrun,1);
    nu  = zeros(nrun,1);
    m   = zeros(nrun,1);     
    for n = 1:nrun
        nu(n)  = randx(nn);
        m(n)   = randx(nn);   
        if  nu(n) > 1
            nu(n) = 1/nu(n);
        end
        if m(n) < 0
            m(n) = -m(n);
        end
        fp = melCPi(nu(n),m(n));
        fx = ellipticCPi(nu(n),m(n));
        if isnan(fp) || isnan(fx) || imag(fp) ~= 0 || imag(fx) ~= 0
            nfail = nfail + 1;
            nu(n) = NaN;
            m(n)  = NaN;
            continue
        end
        if abs(fp) > 0
            rer(n) = abs(fp/fx -1);
        end
    end
    rer(isnan(rer)) = [];
    nu(isnan(nu ))  = [];
    m(isnan(m  ))   = [];    
    fprintf('%4d %12.4g %12.4g %12.4g %12.4g %12.4g %12.4g\n',...
        nfail,min(nu),max(nu),min(m),max(m),max(rer),rms(rer))
end

function f = randx(nn)
N = nn;
r = randi(N);
f = (rand-0.5)*2^(r-floor(N/2));
end