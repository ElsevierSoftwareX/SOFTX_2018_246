% Identities from
% Byrd, P.F., Friedman, M.D., 1971. "Handbook of elliptic integrals for 
% engineers and scientists", 2d ed. Springer-Verlag, Berlin, New York,.

   cfun = {'HeumanLambda(x,k)*pi/2 - (elE(k) - elK(k))*pelF(x,kc) - elK(k)*pelE(x,kc)',... %151.03
       'HeumanLambda(x,0) - sin(x)',... % 151.01
       'HeumanLambda(0,k) - 0',...
       'HeumanLambda(x,1) - 2*x/pi',...
       'HeumanLambda(pi/2,k) - 1',...
       'HeumanLambda(-x,k) + HeumanLambda(x,k)',...
       };      

   
bplot = false;
nrun = 100000;
ntest = length(cfun);
NMX = 10;

fmt  = strcat(repmat('%10.2g',1,8),'\n');
fmt1 = strcat(repmat('%10s',1,8),'\n');
clin = repmat('-',1,90);

fprintf(' Consistency tests for elliptic integrals functions \n')
fprintf(' Identities from Byrd-Friedman -- Handbook of Elliptic Integrals\n')
fprintf(' Modulus -1<=k<=1 \n')
fprintf('\n');
fprintf(' Values \n')
k = sqrt(2)/2;
fprintf(' BF 111.10a  ER/eps = %g\n',(elCK(k)-elK(k))/eps)
k = sqrt(2) - 1;
fprintf(' BF 111.10b  ER/eps = %g\n',(elCK(k)-sqrt(2)*elK(k))/eps)
k = 3 - 2*sqrt(2);
fprintf(' BF 111.10c  ER/eps = %g\n',(elCK(k)-2*elK(k))/eps)
k = (sqrt(3) - 1)/(2*sqrt(2));
kc = sqrt((1 - k)*(1 + k));
fprintf(' BF 111.11a  ER/eps = %g\n',(elCK(k)-sqrt(3)*elK(k))/eps)
fprintf(' BF 111.11b  ER/eps = %g\n',...
    (elE(k)-pi*sqrt(3)/(12*elK(k)) - sqrt(2/3)*kc*elK(k))/eps)
fprintf(' BF 111.11b  ER/eps = %g\n',...
    (elCE(k)-pi*sqrt(3)/(4*elCK(k)) - sqrt(2/3)*k*elCK(k))/eps)

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

        