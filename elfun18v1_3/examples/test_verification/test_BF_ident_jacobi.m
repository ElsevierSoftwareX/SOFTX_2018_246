% Identities from
% Byrd, P.F., Friedman, M.D., 1971. "Handbook of elliptic integrals for 
% engineers and scientists", 2d ed. Springer-Verlag, Berlin, New York,.

   cfun = {...
       'jcd(x,k) - jcn(x,k)/jdn(x,k)', ...
       'jcs(x,k) - jcn(x,k)/jsn(x,k)', ...
       'jdc(x,k) - jdn(x,k)/jcn(x,k)', ...       
       'jds(x,k) - jdn(x,k)/jsn(x,k)', ...     
       'jsc(x,k) - jsn(x,k)/jcn(x,k)', ...       
       'jsd(x,k) - jsn(x,k)/jdn(x,k)', ...     
       'jnc(x,k) - 1/jcn(x,k)', ...     
       'jnd(x,k) - 1/jdn(x,k)', ...   
       'jns(x,k) - 1/jsn(x,k)', ...          
       'jsn(x,k)^2 + jcn(x,k)^2 - 1',...                % 121.00
       'jdn(x,k)^2 + k^2*jsn(x,k)^2 - 1',...            % 121.00    
       'jdn(x,k)^2 - k^2*jcn(x,k)^2 - kc^2',...         % 121.00       
       'jcn(x,k)^2 + k^2*jsn(x,k)^2 - jdn(x,k)^2',...   % 121.00           
       'jam(-x,k) + jam(x,k)',...                       % 122.00   
       'jsn(-x,k) + jsn(x,k)',...       
       'jcn(-x,k) - jcn(x,k)',...      
       'jdn(-x,k) - jdn(x,k)',...   
       'jsc(-x,k) + jsc(x,k)',...  
       'jam(0,k)',...                                   % 122.01
       'jsn(0,k)',...
       'jcn(0,k) - 1',...
       'jdn(0,k) - 1',...
       'jsc(0,k)',...
       'jam(elK(k),k) - pi/2',...                       % 122.02   
       'jsn(elK(k),k) - 1',...
       'jcn(elK(k),k)'    ,...       
       'jdn(elK(k),k) - kc',...
       'jam(x + elK(k),k) - atan(kc*jsc(x,k)) - pi/2',...   % 122.03   
       'jsn(x + elK(k),k) - jcd(x,k)',...
       'jcn(x + elK(k),k) + kc*jsd(x,k)',...      
       'jdn(x + elK(k),k) - kc*jnd(x,k)',...
       'jsc(x + elK(k),k) + jcs(x,k)/kc',...  
       'jam(x + 2*elK(k),k) - jam(x,k) - pi',...    % 122.04
       'jsn(x + 2*elK(k),k) + jsn(x,k)',...         % 122.04
       'jcn(x + 2*elK(k),k) + jcn(x,k)',...         % 122.04
       'jdn(x + 2*elK(k),k) - jdn(x,k)',...         % 122.04
       'jsc(x + 2*elK(k),k) - jsc(x,k)',...         % 122.04
       'jam(x + 3*elK(k),k) - 3*pi/2 - atan(kc*jsc(x,k))',...   % 122.05
       'jsn(x + 3*elK(k),k) + jcd(x,k)',...         % 122.05
       'jcn(x + 3*elK(k),k) - kc*jsd(x,k)',...      % 122.05
       'jdn(x + 3*elK(k),k) - kc*jnd(x,k)',...      % 122.05
       'jsc(x + 3*elK(k),k) + jcs(x,k)/kc',...      % 122.05
       'jam(x + 4*elK(k),k) - jam(x,k) - 2*pi', ...             % 122.06 
       'jsn(x + 4*elK(k),k) - jsn(x,k)', ...        % 122.06 
       'jcn(x + 4*elK(k),k) - jcn(x,k)', ...        % 122.06 
       'jdn(x + 4*elK(k),k) - jdn(x,k)', ...        % 122.06 
       'jsc(x + 4*elK(k),k) - jsc(x,k)',...         % 122.06        
       'jsn(x,0) - sin(x)',...                      % 122.08
       'jcn(x,0) - cos(x)',...
       'jdn(x,0) - 1',...
       'jsc(x,0) - tan(x)',...
       'jsn(x,1) - tanh(x)',...                     % 122.09
       'jcn(x,1) - sech(x)',...
       'jdn(x,1) - sech(x)',...
       'jsc(x,1) - sinh(x)',...    
       'jsn(elK(k)/2,k) - 1/sqrt(1 + kc)',...       % 122.10      
       'jcn(elK(k)/2,k) - sqrt(kc/(1 + kc))',...    % 122.10    
       'jdn(elK(k)/2,k) - sqrt(kc)',...             % 122.10    
       'jsc(elK(k)/2,k) - 1/sqrt(kc)',...           % 122.10         
       'jsn(3*elK(k)/2,k) - 1/sqrt(1 + kc)',...     % 122.11   
       'jcn(3*elK(k)/2,k) + sqrt(kc/(1 + kc))',...  % 122.11
       'jdn(3*elK(k)/2,k) - sqrt(kc)',...           % 122.11  
       'jsc(3*elK(k)/2,k) + 1/sqrt(kc)',...         % 122.10   
       '(1 - jcn(2*x,k))/(1 + jcn(2*x,k)) - jsc(x,k)^2*jdn(x,k)^2', ... %129.04
       '(1 - jdn(2*x,k))/(1 + jdn(2*x,k)) - k^2*jsn(x,k)^2*jcd(x,k)^2' ... %129.04  
       };      

   
bplot = false;
nrun = 10000;
ntest = length(cfun);
NMX = 10;

fmt  = strcat(repmat('%10.2g',1,8),'\n');
fmt1 = strcat(repmat('%10s',1,8),'\n');
clin = repmat('-',1,90);

fprintf(' Consistency tests for elliptic integrals functions \n')
fprintf(' Identities from Byrd-Friedman -- Handbook of Elliptic Integrals\n')
fprintf(' Modulus -1<=k<=1 \n')

fprintf('\n');
fprintf('number of runs %g\n',nrun);
fprintf('fail = aerr>sqrt(eps)\n');


for nt = 1:ntest
    kk = zeros(nrun,1);
    zz = zeros(nrun,1);
    nfail = 0;
    f = zeros(nrun,1);
    fun = str2func(strcat('@(x,k,kc)',cfun{nt}));
    fprintf('\ntest %d %s = 0\n',nt, cfun{nt})
    fprintf('%s\n',clin);
    fprintf(fmt1,'min |x|','max |x|','min |k|','max |k|',...
        'MAE/eps','RME/eps','NDIG','nfail%');
    fprintf('%s\n',clin);
    rng('shuffle');
    for nn = 1:NMX 
        N  = 2^nn;
        for n = 1:nrun
            k  = randi([-N, N]);
            z  = randi([-N, N]);
            k  = (-1)^(n+1)*rand()*2^k;
            z  = (-1)^n*rand()*2^z;
            if abs(k) > 1
                k = 1/k;
            end
            kc = sqrt((1 - k)*(1 + k));            
            f(n) = fun(z,k,kc);
            if isnan(f(n)) || isinf(f(n))
                f(n) = 0;
                continue
            end
            f(n) = abs(f(n));
            if f(n) > sqrt(eps)
                nfail = nfail + 1;
            end
            kk(n) = k;
            zz(n) = z;
        end
        fprintf(fmt,...
            min(abs(zz)),max(abs(zz)),min(abs(kk)), max(abs(kk)),...
            max(f)/eps,rms(f)/eps,log10(max(f)),...
            nfail/nrun*100);
        if nfail > 10
            break
        end
    end
    fprintf('%70s\n',repmat('-',1,90));
    if ~bplot
        continue
    end
    figure(nt)
    clf
    ctitle = strcat('Test ',num2str(nt));
    mstp = 100;
    subplot(1,2,1)
    hold on
    title(ctitle)
    scatter(log10(kk(1:mstp:nrun)),log10(f(1:mstp:nrun)))
    xlabel('log10(k)')
    ylabel('log10(aerr)')
    grid on
    hold off
    subplot(1,2,2)
    hold on
    scatter(log10(zz(1:mstp:nrun)),log10(f(1:mstp:nrun)))
    xlabel('log10(u)')
    ylabel('log10(aerr)')
    grid on
    hold off
end

        