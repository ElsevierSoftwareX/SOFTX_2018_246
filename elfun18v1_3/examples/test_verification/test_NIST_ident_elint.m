% Olver, F.W.J. (Ed.), "NIST handbook of mathematical functions."
% Cambridge University Press : NIST, Cambridge ; New York, pp. xv, 951 p

ctest = {'NIST 19.6.2a','NIST 19.6.2b','NIST 19.7.1',...
    'NIST 19.8.12a','NIST 19.8.12b','NIST 19.2.6'}
bplot = false;
nrun = 10000;
ntest = length(ctest);
NMX = 10;

fmt  = strcat(repmat('%10.2g',1,8),' %s\n');
fmt1 = strcat(repmat('%10s',1,9),'\n');
clin = repmat('-',1,90);

fprintf(' Consistency tests for complete elliptic integrals \n')
fprintf('number of runs %g\n',nrun);
fprintf('fail = aerr>sqrt(eps)\n');
fprintf('%s\n',clin);
fprintf(fmt1,'N','Min','Max.','MAR/eps','MRE/eps','RME/eps','NDIG','nfail','test');
fprintf('%s\n',clin);

for nt = 1:ntest
    kk = zeros(nrun,1);
    nfail = 0;
    f = zeros(nrun,1);
    rng('shuffle');
    for nn = 1:NMX 
        N  = 2^nn;
        for n = 1:nrun
            k  = randi([-N, N]);
            k  = rand()*2^k;
            switch nt
                case 1 % NIST 19.6.2
                    f(n) = elPi(k^2,k) - elE(k)/((1 - k)*(1 + k)); 
                case 2 % NIST 19.6.2
                    f(n) = elPi(-k,k) - pi/4/(1 + k) - elK(k)/2;    
                case 3 % NIST 19.7.1
                    f(n) = elE(k)*elCK(k) + elCE(k)*elK(k) - elK(k)*elCK(k) - pi/2;
                case 4 % NIST 19.8.12
                    if k > 1
                        k = 1/k;
                    end
                    kc = sqrt((1 - k)*(1 + k));
                    k1 = (1 - kc)/(1 + kc);
                    f(n) = elK(k) - (1 + k1)*elK(k1);
                case 5 % NIST 19.8.12
                    if k > 1
                        k = 1/k;
                    end
                    kc = sqrt((1 - k)*(1 + k));
                    k1 = (1 - kc)/(1 + kc);
                    f(n) = elE(k) - (1 + kc)*elE(k1) + kc*elK(k);   
                case 6 % NIST 19.2.6
                    f(n) = elB(k)*k^2 - (elE(k) - (1 - k^2)*elK(k)); 
                    
            end
            if isnan(f(n))
                f(n) = 0;
                continue
            end
            f(n) = abs(f(n));
            if f(n) > sqrt(eps)
                nfail = nfail + 1;
            end
            kk(n) = k;
        end
        fprintf(fmt,N,...
            min(min(kk)),max(max(kk)),...
            max(f)/eps,mean(f)/eps,rms(f)/eps,log10(max(f)),...
            nfail,ctest{nt});
        if nfail > 100
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

        