% Tests for ellitic integral of first kind
fprintf(' ELLIPTIC INTEGRAL OF THE FIRST KIND\n\n')
fprintf('Check values ************** \n')
phi = [pi/6, pi/3];
m = [1/4,1/4];
fex = [0.529428627051905818, ...
       1.08955067005188541];
for n = 1:length(m)
    f = mpEllipticF(phi(n),m(n));
    rer = abs(f/fex(n)-1);
    fprintf('mpEllipticF(%g,%g) \t = %.16g \t rerr = %g\n',phi(n),m(n),f,rer)    
end

   cfun = {...
       'mpelF(x,m)/ melF(sin(x),m) - 1', ...
       'melF(x,m) / mpelF(asin(x),m) - 1',...
       'mpelF(x,m) + mpelF(-x,m)',...       
       'melF(x,m) + melF(-x,m)',...       
       'mpelF(x,m^2)/pelF(x,m)-1',...       
       'melF(x,m^2)/elF(x,m)-1',...        
       'mpelF(0,m)',...    
       'melF(0,m)',...        
       'mpelF(pi/2,m)/melK(m)-1',...      
       'melF(1,m)/melK(m)-1',...         
       'mpelF(x,0)/x - 1',...        
       'mpelF(x,1)/igd(x) - 1',...    
       'melF(x,0)/asin(x) - 1',...        
       'melF(x,1)/atanh(x) - 1',...       
       'melF(x,m)*sqrt(m) - melF(x*sqrt(m),1/m)',...  
       'pelF(asin(1/sqrt(1 + sqrt(1 - m^2))),m)*2/elK(m) -1',...
       'pelF(abs(x),1)/log(tan(abs(x))+sec(abs(x))) -1',...
       };     

   itest = zeros(length(cfun),1);
   iskip = ones(length(cfun),1);
   
   itest(1)  = 100;     % phi|<pi/2
   itest(2)  = 200;     % |x| < 1
   itest(3)  = 500;
   itest(4)  = 400;
   itest( 5) = 500;     % 1 - k^2*sin(phi)^2 > 1
   itest( 6) = 400;     % 1 - k^2*x^2 > 0
   itest( 9) = 300;
   itest(10) = 300;     % m < 1
   itest(12) = 100; 
   itest(13) = 200;     % |x| < 1   
   itest(14) = 200;     % |x| < 1
   itest(15) = 600;     % m > 1
   itest(16)= 700;      % |k|<1
    
   iskip(5) = 0;
   iskip(:) = 0;
bplot = false;
nrun = 10000;
ntest = length(cfun);
NMX = 10;

fmt  = strcat(repmat('%10.2g',1,8),'\n');
fmt1 = strcat(repmat('%10s',1,8),'\n');
clin = repmat('-',1,90);

fprintf('\n Consistency tests for elliptic integral of 2nd kind \n')

fprintf('\n');
fprintf('number of runs %g\n',nrun);
fprintf('fail = aerr>sqrt(eps)\n');

for nt = 1:ntest
    if iskip(nt) == 1
        continue
    end
    fun = str2func(strcat('@(x,m)',cfun{nt}));
    fprintf('\ntest %d %s = 0\n',nt, cfun{nt})
    fprintf('%s\n',clin);
    fprintf(fmt1,'min x','max x','min m','max m',...
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
            z  = randi([-N, N]);
            m  = (-1)^(n+1)*rand()*2^m;
            z  = (-1)^n*rand()*2^z;
            if z == 0
                z = 10*eps;
            end
            switch itest(nt)
                case 100
                    if abs(z) > pi/2
                        z = rand()*pi/2/z;
                    end
                    if m*sin(z)^2 >  1
                        m = rand/sin(z)^2;
                    end
                case 200
                    if abs(z) > 1
                        z = rand/z;
                    end
                    if m*z^2 >  1
                        m = rand/z^2;
                    end
                case 300
                    if m > 1
                        m = rand/m;
                    end
                case 400
                    if abs(z) > 1
                        z = rand/z;
                    end
                    if abs(m) > 1
                        z = rand/m;
                    end
                case 500
                    if abs(m) > 1 && abs(z) > pi/2
                        z = rand*pi/2;
                    end
                    if (m*sin(z))^2 >  1
                        m = rand/sin(z);
                    end
                case 600
                    if m < 1
                        m = 1+1/abs(m);
                    end
                    if z^2*m > 1
                        z = rand/sqrt(m);
                    end
                case 700
                    if abs(m) > 1
                        m = 1/m;
                    end
            end
            f(n) = fun(z,m);
            if isnan(f(n)) || isinf(f(n))
                f(n) = NaN;
                m(n) = NaN;
                z(n) = NaN;
                nfail = nfail + 1;
                %return
                continue
            end
            f(n) = abs(f(n));
            if f(n) > sqrt(eps)
                nfail1 = nfail1 + 1;
            end
            mm(n) = m;
            zz(n) = z;
        end
        zz(isnan(zz)) = [];
        mm(isnan(mm)) = [];
        f(isnan(f)) = [];
        fprintf(fmt,...
            min((zz)),max((zz)),min((mm)), max((mm)),...
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
fprintf('\n Accuracy test: mpelF(phi,m) = ellipticF(phi,m)\n')
fprintf('%4s %12s %12s %12s %12s %12s %12s\n',...
    'fail','min phi','max phi','min(m)','max(m)','max(rer)','rms(rer)')
for nn = 1:NSTP:NMAX
    nfail = 0;
    rer = zeros(nrun,1);
    phi = zeros(nrun,1);
    m   = zeros(nrun,1);     
    for n = 1:nrun
        phi(n) = randx(nn);
        m(n)   = randx(nn);   
        if m(n)*sin(phi(n))^2 > 1
            m(n) = rand/sin(phi(n))^2;
        end
        if m(n) > 1 && abs(phi(n)) > pi/2
            m(n) = rand/m(n);
        end
        fp = mpEllipticF(phi(n),m(n));
        fx = ellipticF(phi(n),m(n));
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
    phi(isnan(phi)) = [];
    m(isnan(m  ))   = [];    
    fprintf('%4d %12.4g %12.4g %12.4g %12.4g %12.4g %12.4g\n',...
        nfail,min(phi),max(phi),min(m),max(m),max(rer),rms(rer))
end

function f = randx(nn)
N = nn;
r = randi(N);
f = (rand-0.5)*2^(r-floor(N/2));
end
        