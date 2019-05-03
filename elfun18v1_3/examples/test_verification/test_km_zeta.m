% Test mjXX vs jXX 
   cfun = {...
       'jzeta(x,k) / mjzeta(x,k^2)',...       
       'pjzeta(x,k) / mpjzeta(x,k^2)',...
       'hlambda(x,k) / mhlambda(x,k^2)',...
       };      

   
bplot = false;
kflag = true;  % use only |k|<= 1
nrun = 100000;
ntest = length(cfun);
NMX = 10;

fmt  = strcat(repmat('%10.2g',1,8),'\n');
fmt1 = strcat(repmat('%10s',1,8),'\n');
clin = repmat('-',1,90);

fprintf(' Consistency tests \n')
fprintf(' jXX vs mjXX \n')
if kflag
    fprintf(' Modulus -1<=k<=1 \n')
else
fprintf(' Modulus -inf<=k<=inf \n')
end

fprintf('\n');
fprintf('number of runs %g\n',nrun);
fprintf('fail = aerr>sqrt(eps)\n');
nt1 = ntest + 1;
for nt = 1:ntest
    zz = zeros(nrun,1);    
    kk = zeros(nrun,1);
    nfail = 0;
    f = zeros(nrun,1);
    if nt > 36
        fun = str2func(strcat('@(k)',cfun{nt}));
    else
        fun = str2func(strcat('@(x,k)',cfun{nt}));
    end
    fprintf('\n test %d rerr= %s - 1 \n',nt,cfun{nt})
    fprintf('%s\n',clin);
    fprintf(fmt1,'min |x|','max |x|','min |k|','max |k|',...
        'MRE/eps','RME/eps','NDIG','nfail%');
    fprintf('%s\n',clin);
    rng('shuffle');
    for nn = 1:NMX 
        N  = 2^nn;
        for n = 1:nrun
            k  = randi([-N, N]);
            z  = randi([-N, N]);
            k  = (-1)^(n+1)*rand()*2^k;
            z  = (-1)^n*rand()*2^z;
            if kflag && abs(k) > 1
                k = 1/k;
            end
            %kc = sqrt((1 - k)*(1 + k));
            if nt > nt1
                f(n) = abs(1/fun(k)-1);
            else
                f(n) = abs(1/fun(z,k)-1);
            end
            if isnan(f(n)) || isinf(f(n))
                f(n) = NaN;
                kk(n) = NaN;
                zz(n) = NaN;
                continue
            else
                kk(n) = k;
                zz(n) = z;
            end
            if f(n) > sqrt(eps)
                nfail = nfail + 1;
            end
        end
        f(isnan(f)) = [];
        zz(isnan(zz)) = [];
        kk(isnan(kk)) = [];
        if nt > nt1
            zz(:) = 0;
        end
        fprintf(fmt,...
            min(abs(zz)),max(abs(zz)),min(abs(kk)), max(abs(kk)),...
            max(f)/eps,rms(f)/eps,log10(max(f)),...
            nfail/nrun*100);
        if nfail > 10
          %  break
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

        