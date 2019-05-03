% Olver, F.W.J. (Ed.), "NIST handbook of mathematical functions."
% Cambridge University Press : NIST, Cambridge ; New York, pp. xv, 951 p

ctest = {'NIST 22.6.5','NIST 22.6.19',...
    'NIST 22.16.28','NIST 22.16.29',...
    'NIST 22.16.32','NIST 22.16.33','NIST 22.16.34',...
    'NIST 19.2.6','B'}
bplot = false;
nrun = 10000;
ntest = length(ctest);
NMX = 10;

fmt  = strcat(repmat('%10.2g',1,8),' %s\n');
fmt1 = strcat(repmat('%10s',1,9),'\n');
clin = repmat('-',1,90);

fprintf(' Consistency tests for Jacobi elliptic functions \n')
fprintf('number of runs %g\n',nrun);
fprintf('fail = aerr>sqrt(eps)\n');
fprintf('%s\n',clin);
fprintf(fmt1,'N','Min','Max.','MAR/eps','MRE/eps','RME/eps','NDIG','nfail','test');
fprintf('%s\n',clin);

for nt = 1:ntest
    kk = zeros(nrun,1);
    zz = zeros(nrun,1);
    %vv = zeros(nrun,1);
    nfail = 0;
    f = zeros(nrun,1);
    rng('shuffle');
    for nn = 1:NMX 
        N  = 2^nn;
        for n = 1:nrun
            k  = randi([-N, N]);
            z  = randi([-N, N]);
            k  = rand()*2^k;
            z  = rand()*2^z;
            switch nt
                case 1 % NIST 22.6.5 double argument
                    f(n) = jsn(2*z,k) - 2*jsn(z,k)*jcn(z,k)*jdn(z,k)/...
                        ((1 - k*jsn(z,k)^2)*(1 + k*jsn(z,k)^2));
                case 2 % NIST 22.6.19 half argument
                    f(n) = jsn(z/2,k)^2 - (1 -jcn(z,k))/(1 + jdn(z,k));
                case 3 % NIST 22.16.28 ????
                    if k > 1
                    %    k = 1/k;
                    end
                    f(n) = jepsilon(z + elK(k),k) - jepsilon(z,k) - elE(k) + ...
                        k^2*jsn(z,k)*jcd(z,k);
                case 4 % NIST 22.16.29
                    f(n) = jepsilon(z + 2*elK(k),k) - jepsilon(z,k) - 2*elE(k);
                case 5 % NIST 22.16.32
                    f(n) = jepsilon(z,k) - elE(k)*z/elK(k) - jzeta(z,k);
                case 6 % NIST 22.16.33
                    f(n) = jzeta(z + elK(k),k) - jzeta(z,k) ...
                        + k^2*jsn(z,k)*jcd(z,k);
                case 7 % NIST 22.16.34
                    f(n) = jzeta(z + 2*elK(k),k) - jzeta(z,k);  
                case 8 % NIST 19.2.6
                    f(n) = elD(z,k)*k^2 - (elF(z,k) - elE(z,k));  
                case 9 % def of B
                    f(n) = elB(z,k)*k^2 - (elE(z,k) - (1 - k^2)*elF(z,k));
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
            zz(n) = z;
        end
        fprintf(fmt,N,...
            min(min(zz),min(kk)),max(max(zz),max(kk)),...
            max(f)/eps,mean(f)/eps,rms(f)/eps,log10(max(f)),...
            nfail,ctest{nt});
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

        