fprintf('Check values ************** \n')
phi = pi/4;
m = 1/4;
nu = [1/16,5/8,5/4,-1/4];
fex = [0.813845432972993183, ...
       0.921129573330804736,...
       1.13213569486990871,...
       0.769872357408010631];
for n = 1:length(nu)
    f = mpEllipticPi(phi,nu(n),m);
    rer = abs(f/fex(n)-1);
    fprintf('mpEllipticPi(pi/4,%g,1/4) \t = %.16g \t rerr = %g\n',nu(n),f,rer)    
end

fprintf('\nCheck values ************** \n')
pphi = 0.5; xx = 0.5; mm = 0.5; nn = -1;
fprintf('%.16g \t exact ---\n',0.474332071443567609)
fprintf('%.16g \t mpelPi\n',mpelPi(pphi,nn,mm))
fprintf('%.16g \t melPi\n',melPi(sin(pphi),nn,mm))
fprintf('%.16g \t mjlambda\n',mjlambda(mijam(pphi,mm),nn,mm))
fprintf('%.16g \t exact ---\n',0.494621159371214917)
fprintf('%.16g \t melPi\n',melPi(xx,nn,mm))
fprintf('%.16g \t mpelPi\n',mpelPi(asin(xx),nn,mm))
fprintf('%.16g \t mjlambda\n',mjlambda(mijsn(xx,mm),nn,mm))
fprintf('%.16g \t exact ---\n',0.465792458884170880)
fprintf('%.16g \t mpelPi\n',mpelPi(mjam(xx,mm),nn,mm))
fprintf('%.16g \t melPi\n',melPi(mjsn(xx,mm),nn,mm))
fprintf('%.16g \t mjlambda\n',mjlambda(xx,nn,mm))


%-----------------------------------------
fprintf('\nCheck relations among various forms ******************\n')
NMAX = 51;
NSTP = 10;
nrun = 1000;
fprintf('\n1. Check mpelPi(phi,nu,m) = melPi(sin(phi),nu,m), |phi|<=pi/2\n')
fprintf('%4s %12s %12s %12s %12s %12s %12s\n',...
    'fail','min(nu)','max(nu)','min(m)','max(m)','max(rer)','rms(rer)')
for nn = 1:NSTP:NMAX
    nfail = 0;
    rer = zeros(nrun,1);
    phi = zeros(nrun,1);
    x   = zeros(nrun,1);
    nu  = zeros(nrun,1);
    m   = zeros(nrun,1);     
    for n = 1:nrun
        phi(n) = (2*rand() - 1)*pi/2;
        nu(n)  = randx(nn);
        m(n)   = randx(nn);   
        x(n)   = sin(phi(n));
        if m(n)*x(n)^2 > 1
            m(n) = rand()/x(n)^2;
        end
        if  nu(n)*x(n)^2 > 1
            nu(n) = rand()/x(n)^2;
        end
        if m(n) > 1 && nu(n) > m(n)
            nu(n) = rand()*m(n);
        end
        fp = mpEllipticPi(phi(n),nu(n),m(n));
        fx = mEllipticPi(x(n),nu(n),m(n));
        if isnan(fp) || isnan(fx) || imag(fp) ~= 0 || imag(fx) ~= 0
            nfail = nfail + 1;
            nu(n) = NaN;
            m(n)  = NaN;
            continue
        end
        if abs(fp) > 0
            rer(n) = abs(fx/fp -1);
        end
    end
    rer(isnan(rer)) = [];
    phi(isnan(phi)) = [];
    nu(isnan(nu ))  = [];
    m(isnan(m  ))   = [];    
    fprintf('%4d %12.4g %12.4g %12.4g %12.4g %12.4g %12.4g\n',...
        nfail,min(nu),max(nu),min(m),max(m),max(rer),rms(rer))
end

%-----------------------------------------
fprintf('\n2. Check mpelPi(phi,nu,m) = mjlambda(mijam(phi,m),nu,m), |phi|<=pi/2\n')
fprintf('%4s %12s %12s %12s %12s %12s %12s\n',...
    'fail','min(nu)','max(nu)','min(m)','max(m)','max(rer)','rms(rer)')
for nn = 1:NSTP:NMAX
    nfail = 0;
    rer = zeros(nrun,1);
    phi = zeros(nrun,1);
    nu  = zeros(nrun,1);
    m   = zeros(nrun,1);     
    u   = zeros(nrun,1);
    x   = zeros(nrun,1);
    for n = 1:nrun
        phi(n) = (2*rand() - 1)*pi/2; 
        nu(n)  = randx(nn);
        m(n)   = randx(nn);   
        x(n)   = sin(phi(n));
        if m(n)*x(n)^2 > 1
            m(n) = rand()/x(n)^2;
        end
        if  nu(n)*x(n)^2 > 1
            nu(n) = rand()/x(n)^2;
        end
        u(n) = mijam(phi(n),m(n));
        fp   = mpEllipticPi(phi(n),nu(n),m(n));
        fu   = mJacobiLambda(u(n),nu(n),m(n));
        if isnan(fp) || isnan(fu) || imag(fp) ~= 0 || imag(fu) ~= 0
            nfail = nfail + 1;
            nu(n) = NaN;
            m(n)  = NaN;
            return
            continue
        end
        if abs(fp) > 0
            rer(n) = abs(fu/fp -1);
        end
    end
    rer(isnan(rer)) = [];
    phi(isnan(phi)) = [];
    nu(isnan(nu ))  = [];
    m(isnan(m  ))   = [];    
    fprintf('%4d %12.4g %12.4g %12.4g %12.4g %12.4g %12.4g\n',...
        nfail,min(nu),max(nu),min(m),max(m),max(rer),rms(rer))
end

fprintf('\n3. Check melPi(x,nu,m) = mpelPi(asin(x),nu,m), |x|<=1\n')
fprintf('%4s %12s %12s %12s %12s %12s %12s\n',...
    'fail','min(nu)','max(nu)','min(m)','max(m)','max(rer)','rms(rer)')
for nn = 1:NSTP:NMAX
    nfail = 0;
    rer = zeros(nrun,1);
    phi = zeros(nrun,1);
    x   = zeros(nrun,1);
    nu  = zeros(nrun,1);
    m   = zeros(nrun,1);     
    for n = 1:nrun
        x(n) = randx(nn);
        if abs(x(n)) > 1
            x(n) = 1/x(n);
        end
        nu(n)  = randx(nn);
        m(n)   = randx(nn);   
        if  nu(n)*x(n)^2 > 1
            nu(n) = rand/x(n)^2;
        end
        if m(n)*x(n)^2 > 1
            m(n) = rand/x(n)^2;
        end
        if m(n) > 1 && nu(n) > m(n)
            nu(n) = rand()*m(n);
        end
        phi(n) = asin(x(n));
        fp = mpEllipticPi(phi(n),nu(n),m(n));
        fx = mEllipticPi(x(n),nu(n),m(n));
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
    phi(isnan(phi)) = [];
    nu(isnan(nu ))  = [];
    m(isnan(m  ))   = [];    
    fprintf('%4d %12.4g %12.4g %12.4g %12.4g %12.4g %12.4g\n',...
        nfail,min(nu),max(nu),min(m),max(m),max(rer),rms(rer))
end

%----------------------------------
fprintf('\n4. Check melPi(x,nu,m) = mjlambda(mijsn(x,m),nu,m), |x|<=1\n')
fprintf('%4s %12s %12s %12s %12s %12s %12s\n',...
    'fail','min(nu)','max(nu)','min(m)','max(m)','max(rer)','rms(rer)')
for nn = 1:NSTP:NMAX
    nfail = 0;
    rer = zeros(nrun,1);
    x   = zeros(nrun,1);
    nu  = zeros(nrun,1);
    m   = zeros(nrun,1);     
    u   = zeros(nrun,1);  
    for n = 1:nrun
        x(n)  = randx(nn);
        nu(n) = randx(nn);
        m(n)  = randx(nn);
        if abs(x(n)) > 1
            x(n) = 1/x(n);
        end
        if  nu(n)*x(n)^2 > 1
            nu(n) = rand/x(n)^2;
        end
        if m(n)*x(n)^2 > 1
            m(n) = rand/x(n)^2;
        end
        if m(n) > 1 && nu(n) > m(n)
            nu(n) = rand()*m(n);
        end
        u(n)  = mijsn(x(n),m(n));
        fu = mJacobiLambda(u(n),nu(n),m(n));
        fx = mEllipticPi(x(n),nu(n),m(n));
        if isnan(fu) || isnan(fx) || imag(fu) ~= 0 || imag(fx) ~= 0
            nfail = nfail + 1;
            nu(n) = NaN;
            m(n)  = NaN;
            continue
        end
        if abs(fp) > 0
            rer(n) = abs(fu/fx -1);
        end
    end
    rer(isnan(rer)) = [];
    u(isnan(phi)) = [];
    nu(isnan(nu ))  = [];
    m(isnan(m  ))   = [];    
    fprintf('%4d %12.4g %12.4g %12.4g %12.4g %12.4g %12.4g\n',...
        nfail,min(nu),max(nu),min(m),max(m),max(rer),rms(rer))
end

%----------------------------------
fprintf('\n5. Check mjlambda(u,nu,m) = melPi(mjsn(u,m),nu,m), |u|<K\n')
fprintf('%4s %12s %12s %12s %12s %12s %12s\n',...
    'fail','min(nu)','max(nu)','min(m)','max(m)','max(rer)','rms(rer)')
for nn = 1:NSTP:NMAX
    nfail = 0;
    rer = zeros(nrun,1);
    x   = zeros(nrun,1);
    
    u   = zeros(nrun,1);
    nu  = zeros(nrun,1);
    m   = zeros(nrun,1);     
    u   = zeros(nrun,1);  
    for n = 1:nrun      
        u(n)  = randx(nn);
        m(n)  = randx(nn);
        nu(n) = randx(nn);
        if m(n) > 1
          % m(n) = 1/m(n);
           K = melK(1/m(n))/sqrt(m(n));
        else
         K = melK(m(n));
        end
        if abs(u(n)) > K
            u(n) = rand()*K;
        end            
        x(n)  = mjsn(u(n),m(n));
        if nu(n)*x(n)^2 > 1
            nu(n) = rand()/x(n)^2;
        end
        fu = mJacobiLambda(u(n),nu(n),m(n));
        fx = mEllipticPi(x(n),nu(n),m(n));
        if isnan(fu) || isnan(fx) || imag(fu) ~= 0 || imag(fx) ~= 0
            nfail = nfail + 1;
            nu(n) = NaN;
            m(n)  = NaN;
            continue
        end
        if abs(fp) > 0
            rer(n) = abs(fx/fu -1);
        end
    end
    rer(isnan(rer)) = [];
    u(isnan(phi)) = [];
    nu(isnan(nu ))  = [];
    m(isnan(m  ))   = [];    
    fprintf('%4d %12.4g %12.4g %12.4g %12.4g %12.4g %12.4g\n',...
        nfail,min(nu),max(nu),min(m),max(m),max(rer),rms(rer))
end

%----------------------------------
fprintf('\n6. Check mjlambda(u,nu,m) = mpelPi(mjam(u,m),nu,m), |u|<inf)\n')
fprintf('%4s %12s %12s %12s %12s %12s %12s\n',...
    'fail','min(nu)','max(nu)','min(m)','max(m)','max(rer)','rms(rer)')
for nn = 1:NSTP:NMAX
    nfail = 0;
    rer = zeros(nrun,1);
    phi = zeros(nrun,1);
    u   = zeros(nrun,1);
    nu  = zeros(nrun,1);
    m   = zeros(nrun,1);     
    u   = zeros(nrun,1);  
    for n = 1:nrun
        u(n)  = randx(nn);
        m(n)  = randx(nn); 
        nu(n) = randx(nn);
        if  nu(n) > 1
            nu(n) = 1/nu(n);
        end
        if m(n) > 1
            m(n) = 1/m(n);
        end
        
        %m(n)  = randx(nn); 
        %if m(n) > 1
        %    m(n) = 1/m(n);
        %end
        %K = melK(m(n));
        %u(n)  = randx(nn);
        %if abs(u(n)) > K
        %    u(n) = 1/u(n);
        %end
        %nu(n) = randx(nn);
        %if nu(n) > 1
        %    nu(n) = 1/nu(n);
        %end
        phi(n) = mjam(u(n),m(n));
        fu = mJacobiLambda(u(n),nu(n),m(n));
        fp = mpEllipticPi(phi(n),nu(n),m(n));
        if isnan(fu) || isnan(fp) || imag(fu) ~= 0 || imag(fp) ~= 0
            nfail = nfail + 1;
            nu(n) = NaN;
            m(n)  = NaN;
            continue
        end
        if abs(fp) > 0
            rer(n) = abs(fp/fu -1);
        end
    end
    rer(isnan(rer)) = [];
    u(isnan(phi)) = [];
    nu(isnan(nu ))  = [];
    m(isnan(m  ))   = [];    
    fprintf('%4d %12.4g %12.4g %12.4g %12.4g %12.4g %12.4g\n',...
        nfail,min(nu),max(nu),min(m),max(m),max(rer),rms(rer))
end

fprintf('\nVerification *****************\n')
NSTP = 10;
nrun = 100;
fprintf('\n Check Pi(phi,nu,m) = E(phi,m)/(1-m) - m*sin(phi)*cos(phi)/(1-m)/sqrt(1 - m*sin(phi)^2)\n')
fprintf('%4s %12s %12s %12s %12s %12s %12s\n',...
    'fail','min(nu)','max(nu)','min(m)','max(m)','max(rer)','rms(rer)')
for nn = 1:NSTP:NMAX
    nfail = 0;
    rer = zeros(nrun,1);
    phi = zeros(nrun,1);
    x   = zeros(nrun,1);
    nu  = zeros(nrun,1);
    m   = zeros(nrun,1);     
    for n = 1:nrun
        phi(n) = (2*rand() - 1)*pi/2;
        nu(n)  = randx(nn);
        m(n)   = randx(nn);   
        if m(n)*sin(phi(n))^2 > 1
            m(n) = 0.9/sin(phi(n))^2;
        end
        fp = mpEllipticPi(phi(n),m(n),m(n));
        fx = mpelE(phi(n),m(n))/(1 - m(n)) ...
            - m(n)*sin(phi(n))*cos(phi(n))/(1 - m(n))/sqrt(1 - m(n)*sin(phi(n))^2);
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
    phi(isnan(phi)) = [];
    nu(isnan(nu ))  = [];
    m(isnan(m  ))   = [];    
    fprintf('%4d %12.4g %12.4g %12.4g %12.4g %12.4g %12.4g\n',...
        nfail,min(nu),max(nu),min(m),max(m),max(rer),rms(rer))
end

fprintf('\n Check Pi(x,nu,m) = E(x,m)/(1-m) - m*x*sqrt(1 - c^2)/(1-m)/sqrt(1 - m*x^2)\n')
fprintf('%4s %12s %12s %12s %12s %12s %12s\n',...
    'fail','min(nu)','max(nu)','min(m)','max(m)','max(rer)','rms(rer)')
for nn = 1:NSTP:NMAX
    nfail = 0;
    rer = zeros(nrun,1);
    x   = zeros(nrun,1);
    m   = zeros(nrun,1);     
    for n = 1:nrun
        x(n) = randx(nn);
                if abs(x(n)) > 1
            x(n) = 1/x(n);
        end
        m(n) = randx(nn); 
        if m(n)*x(n)^2 > 1
            m(n) = 0.9/x(n)^2;
        end
        fp = mEllipticPi(x(n),m(n),m(n));
        fx = melE(x(n),m(n))/(1 - m(n)) ...
            - m(n)*x(n)/(1 - m(n))*sqrt((1 - x(n)^2)/(1 - m(n)*x(n)^2));
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
    phi(isnan(phi)) = [];
    nu(isnan(nu ))  = [];
    m(isnan(m  ))   = [];    
    fprintf('%4d %12.4g %12.4g %12.4g %12.4g %12.4g %12.4g\n',...
        nfail,min(nu),max(nu),min(m),max(m),max(rer),rms(rer))
end

fprintf('\n Check Pi(x,nu,m) = Pi(x*sqrt(m),nu/m,1/m)/sqrt(m)\n')
fprintf('%4s %12s %12s %12s %12s %12s %12s\n',...
    'fail','min(nu)','max(nu)','min(m)','max(m)','max(rer)','rms(rer)')
for nn = 1:NSTP:NMAX
    nfail = 0;
    rer = zeros(nrun,1);
    x   = zeros(nrun,1);
    m   = zeros(nrun,1);     
    for n = 1:nrun
        m(n) = abs(randx(nn)); 
        if m(n) < 1
            m(n) = 1/m(n);
        end
        nu(n) = randx(nn);
        x(n)  = randx(nn);
        if abs(x(n)) > 1
            x(n) = 1/x(n);
        end
        fp = mEllipticPi(x(n),nu(n),m(n));
        fx = mEllipticPi(x(n)*sqrt(m(n)),nu(n)/m(n),1/m(n))/sqrt(m(n));
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
    phi(isnan(phi)) = [];
    nu(isnan(nu ))  = [];
    m(isnan(m  ))   = [];    
    fprintf('%4d %12.4g %12.4g %12.4g %12.4g %12.4g %12.4g\n',...
        nfail,min(nu),max(nu),min(m),max(m),max(rer),rms(rer))
end

%-----------------------------------------
fprintf('\nTest accuracy *****************\n')
path = 'C:\Program Files\MATLAB\R2018a\toolbox\symbolic\symbolic';
addpath(path)
NMAX = 151;
NSTP = 20;
nrun = 1000;
fprintf('\n Check mpelPi(phi,nu,k^2) = pelPi(phi,nu,k)\n')
fprintf('%4s %12s %12s %12s %12s %12s %12s\n',...
    'fail','min(nu)','max(nu)','min(k)','max(k)','max(rer)','rms(rer)')
for nn = 1:NSTP:NMAX
    nfail = 0;
    rer = zeros(nrun,1);
    phi = zeros(nrun,1);
    x   = zeros(nrun,1);
    nu  = zeros(nrun,1);
    m   = zeros(nrun,1);     
    for n = 1:nrun
        phi(n) = (2*rand() - 1)*pi/2;
        nu(n)  = randx(nn);
        m(n)   = randx(nn);   
        if  nu(n)*sin(phi(n))^2 > 1
            nu(n) = 0.9/sin(phi(n))^2;
        end
        if m(n)^2*phi(n)^2 > 1
            m(n) = 0.9/sin(phi(n));
        end
        if nu(n) > m(n)
          %  nu(n) = 0.9*m(n);
        end
        fp = mpEllipticPi(phi(n),nu(n),m(n)^2);
        fx = pEllipticPi(phi(n),nu(n),m(n));
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
    phi(isnan(phi)) = [];
    nu(isnan(nu ))  = [];
    m(isnan(m  ))   = [];    
    fprintf('%4d %12.4g %12.4g %12.4g %12.4g %12.4g %12.4g\n',...
        nfail,min(nu),max(nu),min(m),max(m),max(rer),rms(rer))
end

fprintf('\n Check melPi(x,nu,k^2) = elPi(x,nu,k)\n')
fprintf('%4s %12s %12s %12s %12s %12s %12s\n',...
    'fail','min(nu)','max(nu)','min(k)','max(k)','max(rer)','rms(rer)')
for nn = 1:NSTP:NMAX
    nfail = 0;
    rer = zeros(nrun,1);
    phi = zeros(nrun,1);
    x   = zeros(nrun,1);
    nu  = zeros(nrun,1);
    m   = zeros(nrun,1);     
    for n = 1:nrun
        x(n) =  randx(nn);
        nu(n)  = randx(nn);
        m(n)   = randx(nn);   
        if abs(x(n)) > 1
            x(n) = 1/x(n);
        end
        if  nu(n)*x(n)^2 > 1
            nu(n) = 0.9/x(n)^2;
        end
        if m(n)^2*x(n)^2 > 1
            m(n) = 0.9/x(n);
        end
        if nu(n) > m(n)
          %  nu(n) = 0.9*m(n);
        end
        fp = mEllipticPi(x(n),nu(n),m(n)^2);
        fx = EllipticPi(x(n),nu(n),m(n));
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
    phi(isnan(phi)) = [];
    nu(isnan(nu ))  = [];
    m(isnan(m  ))   = [];    
    fprintf('%4d %12.4g %12.4g %12.4g %12.4g %12.4g %12.4g\n',...
        nfail,min(nu),max(nu),min(m),max(m),max(rer),rms(rer))
end

fprintf('\n Check mjlambda(x,nu,k^2) = jlambda(x,nu,k)\n')
fprintf('%4s %12s %12s %12s %12s %12s %12s\n',...
    'fail','min(nu)','max(nu)','min(k)','max(k)','max(rer)','rms(rer)')
for nn = 1:NSTP:NMAX
    nfail = 0;
    rer = zeros(nrun,1);
    phi = zeros(nrun,1);
    x   = zeros(nrun,1);
    nu  = zeros(nrun,1);
    m   = zeros(nrun,1);     
    for n = 1:nrun
        x(n) =  randx(nn);
        nu(n)  = randx(nn);
        m(n)   = randx(nn);   
        if abs(x(n)) > 1
            x(n) = 1/x(n);
        end
        if  nu(n)*x(n)^2 > 1
            nu(n) = 0.9/x(n)^2;
        end
        if m(n)^2*x(n)^2 > 1
            m(n) = 0.9/x(n);
        end
        if nu(n) > m(n)
          %  nu(n) = 0.9*m(n);
        end
        fp = mJacobiLambda(x(n),nu(n),m(n)^2);
        fx = JacobiLambda(x(n),nu(n),m(n));
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
    phi(isnan(phi)) = [];
    nu(isnan(nu ))  = [];
    m(isnan(m  ))   = [];    
    fprintf('%4d %12.4g %12.4g %12.4g %12.4g %12.4g %12.4g\n',...
        nfail,min(nu),max(nu),min(m),max(m),max(rer),rms(rer))
end

fprintf('\n Check mjomega(x,nu,k^2) = jomega(x,nu,k)\n')
fprintf('%4s %12s %12s %12s %12s %12s %12s\n',...
    'fail','min(nu)','max(nu)','min(k)','max(k)','max(rer)','rms(rer)')
for nn = 1:NSTP:NMAX
    nfail = 0;
    rer = zeros(nrun,1);
    phi = zeros(nrun,1);
    x   = zeros(nrun,1);
    nu  = zeros(nrun,1);
    m   = zeros(nrun,1);     
    for n = 1:nrun
        x(n) =  randx(nn);
        nu(n)  = randx(nn);
        m(n)   = randx(nn);   
        if abs(x(n)) > 1
            x(n) = 1/x(n);
        end
        if  nu(n)*x(n)^2 > 1
            nu(n) = 0.9/x(n)^2;
        end
        if m(n)^2*x(n)^2 > 1
            m(n) = 0.9/x(n);
        end
        if nu(n) > m(n)
          %  nu(n) = 0.9*m(n);
        end
        fp = mJacobiOmega(x(n),nu(n),m(n)^2);
        fx = JacobiOmega(x(n),nu(n),m(n));
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
    phi(isnan(phi)) = [];
    nu(isnan(nu ))  = [];
    m(isnan(m  ))   = [];    
    fprintf('%4d %12.4g %12.4g %12.4g %12.4g %12.4g %12.4g\n',...
        nfail,min(nu),max(nu),min(m),max(m),max(rer),rms(rer))
end

NMAX = 51;
NSTP = 10;
nrun = 100;
fprintf('\n Check mpelPi(phi,nu,m) = ellipticPi(phi,nu,m)\n')
fprintf('%4s %12s %12s %12s %12s %12s %12s\n',...
    'fail','min(nu)','max(nu)','min(m)','max(m)','max(rer)','rms(rer)')
for nn = 1:NSTP:NMAX
    nfail = 0;
    rer = zeros(nrun,1);
    phi = zeros(nrun,1);
    x   = zeros(nrun,1);
    nu  = zeros(nrun,1);
    m   = zeros(nrun,1);     
    for n = 1:nrun
        phi(n) = (2*rand() - 1)*pi/2;
        nu(n)  = randx(nn);
        m(n)   = randx(nn);   
        if  nu(n)*phi(n)^2 > 1
            nu(n) = 0.9/phi(n)^2;
        end
        if m(n)*phi(n)^2 > 1
            m(n) = 0.9/phi(n)^2;
        end
        if nu(n) > m(n)
            nu(n) = 0.9*m(n);
        end
        fp = mpEllipticPi(phi(n),nu(n),m(n));
        fx = ellipticPi(nu(n),phi(n),m(n));
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
    phi(isnan(phi)) = [];
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