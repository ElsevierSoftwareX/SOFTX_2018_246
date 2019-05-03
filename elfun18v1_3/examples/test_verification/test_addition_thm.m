bplot = false;
nrun = 20000;
ntest = 5;
NMX = 10;

fmt  = strcat(repmat('%10.2g',1,9),'\n');
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
    uu = zeros(nrun,1);
    vv = zeros(nrun,1);
    nfail = 0;
    f = zeros(nrun,1);
    rng('shuffle');
    for nn = 1:NMX 
        N  = 2^nn;
        for n = 1:nrun
            k  = randi([-N, N]);
            u  = randi([-N, N]);
            v  = randi([-N, N]);
            k  = rand()*2^k;
            u  = rand()*2^u;
            v  = rand()*2^v;
            kk(n) = k;
            uu(n) = u;
            vv(n) = v;
            switch nt
                case 1
                    f(n) = jsn(u + v,k) - ...
                        (jsn(u,k)*jcn(v,k)*jdn(v,k) + jsn(v,k)*jcn(u,k)*jdn(u,k))/...
                        (1 - (k*jsn(u,k)*jsn(v,k))^2);
                case 2
                    f(n) = jcn(u + v,k) - ...
                        (jcn(u,k)*jcn(v,k) - jsn(u,k)*jsn(v,k)*jdn(u,k)*jdn(v,k))/...
                        (1 - (k*jsn(u,k)*jsn(v,k))^2);
                case 3
                    f(n) = jdn(u + v,k) - ...
                        (jdn(u,k)*jdn(v,k) - k*k*jsn(u,k)*jsn(v,k)*jcn(u,k)*jcn(v,k))/...
                        (1 - (k*jsn(u,k)*jsn(v,k))^2);
                case 4
                    f(n) =jzeta(u + v,k)  - jzeta(u,k) - jzeta(v,k) + ...
                        k^2*jsn(u,k)*jsn(v,k)*jsn(u + v,k);
                case 5 % NIST 22.16.27
                    f(n) =jepsilon(u + v,k)  - jepsilon(u,k) - jepsilon(v,k) + ...
                        k^2*jsn(u,k)*jsn(v,k)*jsn(u + v,k);
            end
            if isnan(f(n))
                f(n) = 0;
                continue
            end
            f(n) = abs(f(n));
            if f(n) > sqrt(eps)
                nfail = nfail + 1;
            end
        end
        fprintf(fmt,N,...
            min(min(uu),min(kk)),max(max(uu),max(kk)),...
            max(f)/eps,mean(f)/eps,rms(f)/eps,log10(max(f)),...
            nfail,nt);
        if nfail > 0
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
    scatter(log10(uu(1:mstp:nrun)+vv(1:mstp:nrun)),log10(f(1:mstp:nrun)))
    xlabel('log10(u + v)')
    ylabel('log10(aerr)')
    grid on
    hold off
end

        