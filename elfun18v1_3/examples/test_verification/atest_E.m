% Tests for ellitic integral of second kind

   cfun = {...
       'mpelE(x,m)/ melE(sin(x),m) - 1', ...
       'mpelE(x,m)/ mjepsilon(mijam(x,m),m) - 1', ...   
       'melE(x,m) / mpelE(asin(x),m) - 1',...
       'melE(x,m) / mjepsilon(mijsn(x,m),m) - 1',...
       'mjepsilon(x,m)/ melE(mjsn(x,m),m) - 1',...
       'mjepsilon(x,m)/ mpelE(mjam(x,m),m) - 1',...
       'mpelE(x,m) + mpelE(-x,m)',...       
       'melE(x,m) + melE(-x,m)',...       
       'mjepsilon(x,m) + mjepsilon(-x,m)',...
       'mpelE(x,m^2)/pelE(x,m)-1',...       
       'melE(x,m^2)/elE(x,m)-1',...       
       'mjepsilon(x,m^2)/jepsilon(x,m)-1',...  
       'mpelE(x,m)-(sqrt(m)*(mpelE(asin(sin(x)*sqrt(m)),1/m) - (1 - 1/m)*mpelF(asin(sin(x)*sqrt(m)),1/m) ))',...          
       'melE(x,m)-(sqrt(m)*(melE(x*sqrt(m),1/m) - (1 - 1/m)*melF(x*sqrt(m),1/m) ))',...          
       'mjepsilon(x,m)-(sqrt(m)*mjepsilon(x*sqrt(m),1/m) + (1 - m)*x)',...    
       'mpelE(0,m)',...    
       'melE(0,m)',...  
       'mjepsilon(0,m)',...       
       'mpelE(pi/2,m)/melE(m)-1',...      
       'melE(1,m)/melE(m)-1',...        
       'mjepsilon(melK(m),m)/melE(m) - 1',...      
       'mpelE(x,0)/x - 1',...        
       'mpelE(x,1)/sin(x) - 1',...    
       'melE(x,0)/asin(x) - 1',...        
       'melE(x,1)/x - 1',...     
       'mjepsilon(x,0)/x - 1',...        
       'mjepsilon(x,1)/tanh(x) - 1',...        
       'mjepsilon(x,1)/tanh(x) - 1',...  
       'jepsilon(x + elK(m),m) - jepsilon(x,m) - elE(m) +  m^2*jsn(x,m)*jcd(x,m)',...
       'jepsilon(x + 2*elK(m),m) - jepsilon(x,m) - 2*elE(m)',...
       'mjepsilon(x + melK(m),m) - mjepsilon(x,m) - melE(m) +  m*mjsn(x,m)*mjcd(x,m)',...
       'mjepsilon(x + 2*melK(m),m) - mjepsilon(x,m) - 2*melE(m)',...       
       };      

   itest = zeros(length(cfun),1);
   iskip = ones(length(cfun),1);
   
   itest(1)  = 100; % |phi|<pi/2
   itest(2)  = 100;
   itest(3)  = 200; % |x|<1
   itest(4)  = 200;
   itest(5)  = 300; % |x|<K
   itest(6)  = 300; % |x|<K   
   itest(13) = 11; % m > 1
   itest(14) = 14; % m > 1 && |x| < 1
   itest(15) = 15;
   itest(19) = 4;% m < 1
   itest(20) = 4;% m < 1
   itest(21) = 4;% m < 1
   itest(23) = 2; % |phi|<pi/2
   itest(24) = 3; % |x|<1
   itest(25) = 3; % |x|<1
   itest(29) = 41; % |m| < 1
   itest(30) = 41; % |m| < 1
   itest(31) = 4; % m < 1
   itest(32) = 4; % m < 1
   
   iskip(15) = 0;
   iskip(:) = 0;
bplot = false;
nrun = 10000;
ntest = length(cfun);
NMX = 10;

fmt  = strcat(repmat('%10.2g',1,8),'\n');
fmt1 = strcat(repmat('%10s',1,8),'\n');
clin = repmat('-',1,90);

fprintf(' Consistency tests for elliptic integral of 2nd kind \n')

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
                        z = 2*rand/pi;
                    end
                    if m > 1
                        m = 1/m;
                    end
                case 200
                    if abs(z) > 1
                        z = rand;
                    end
                    if m > 1
                        m = 1/m;
                    end  
                case 300
                    if m > 1
                        m = 1/m;
                    end
                    K = melK(m);
                    if abs(z) > K
                        z = rand*K;
                    end
                case 14
                    if m > 0 
                    if z*sqrt(m) > 1
                        z = rand/sqrt(m);
                    end      
                    end
                case 15
                    if m == 0
                        m = 1000*eps;
                    end
                    if m < 0
                        m = - m;
                    end
                    if m < 1
                        m = 1/m;
                    end
                    K = melK(m);
                    if abs(z) > K
                        z = rand*K;
                    end
                case 1
                    if m == 0
                        m = 1000*eps;
                    end
                    if m < 0
                        m = - m;
                    end
                    if m < 1
                        m = 1/m;
                    end
                case 11
                    if m == 0
                        m = 10*eps;
                    end
                    if m < 0
                        m = -m;
                    end
                    if m < 1
                        m = 1/m;
                    end
                    if abs(sin(z)*sqrt(m)) > 1
                        z = asin(rand/sqrt(m));
                    end
                case 2
                    if abs(z) > pi/2
                        z = pi/2/z;
                    end
                    if m*sin(z)^2 > 1
                        m = rand/sin(z)^2;
                    end
                case 3
                    if abs(z) > 1
                        z = 1/z;
                    end
                    if m*z^2 > 1
                        m = rand/z^2;
                    end     
                case 4
                    if m > 1
                        m = 1/m;
                    end
                case 41
                    if abs(m) > 1
                        m = 1/m;
                    end
                case 5
                    K = melK(m);
                    if abs(z) > K
                        z = rand* K/z;
                    end
            end
            f(n) = fun(z,m);
            if isnan(f(n)) || isinf(f(n))
               % m
              %  z
               % f(n)
               % mjepsilon(z,m)
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
fprintf('\n Check mpelE(phi,m) = ellipticE(phi,m)\n')
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
        fp = mpEllipticE(phi(n),m(n));
        fx = ellipticE(phi(n),m(n));
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
        