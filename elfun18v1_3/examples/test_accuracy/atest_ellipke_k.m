fprintf('==== COMPARSION TEST OF ELLIPTIC FUNCTIONS USING MODULUS K ===\n')

global n2 
NRUN = 1000;
N2MAX = 1200;
N2    = N2MAX;

if N2 > N2MAX || N2 < 0
    N2 = N2MAX;
end

nchar = 12+4+8+7*12;
bplot = false;

PQ   = {'E', 'K'};
narg = [ 1,   1];


fprintf('Comparsion with Matlab function ellipke\n')
fprintf('num. of runs %d\n',NRUN)
%fprintf('range of arguments from %g*rand to %g*rand\n',pmin,pmax);
fprintf('%s\n',repmat('-',1,nchar));
fprintf('%12s%4s%8s%12s%12s%12s%12s%12s%12s%12s\n',...
    'func.','narg','nnan %','min(|arg|)','max(|arg|)',...
    'MAE','MRE/eps','RMS/eps','NDIG','RTIME %');
fprintf('%s\n',repmat('-',1,nchar));

rng('shuffle');
na = 1;
for n = 1:length(PQ)
    fmlb = str2func('ellipke'); % matlab function
    fun  = strcat('Elliptic',PQ{n}); % my function
    fmy = str2func(fun);
    for n2 = 1:100:N2
        x  = zeros(na,1);
        xx = zeros(NRUN,na);
        aerr = zeros(NRUN,1);        
        rerr = zeros(NRUN,1);
        nnan = 0;
        ninf = 0;
        for i=1:NRUN
            for j = 1:na
                x(j) = randx;
            end
            if abs(x(1)) > 1
                x(1) = 1/x(1);
            end
            if strcmp(PQ(n),'K')
                fex  = fmlb(x(1)^2);
            else
                [~,fex]  = fmlb(x(1)^2);
            end
            f    = fmy (x(1));
            if isnan(f)
                xx(i,1:na) = NaN;
                rerr(i)    = NaN;
                nnan = nnan + 1;
            else
                xx(i,1:na) = x(1:na);
                aerr(i) = abs(f - fex);
                if fex ~= 0
                    rerr(i) = abs(f/fex - 1);
                elseif f == 0
                end
            end
        end
        tic             
        f  = fmy (xx(1:end,1));
        tmy = toc;
        tic
        if strcmp(PQ(n),'K')
            fex  = fmlb(x(1)^2);
        else
            [~,fex]  = fmlb(x(1)^2);
        end         
        tmlb = toc;
        
        xx(isnan(xx)) = [];
        rerr(isnan(rerr)) = [];
        
        fprintf('%12s%4d%8.3g%12.3g%12.3g%12.3g%12.3g%12.3g%12.3g%12.3g\n',...
            fun,...
            narg(n),nnan/NRUN*100,...
            max(min(abs(xx))),max(max(abs(xx))),...
            max(aerr),max(rerr)/eps,rms(rerr)/eps,log(max(rerr))/log(10),...
            tmy/tmlb*100) 
        
    end
    fprintf('%70s\n',repmat('-',1,nchar));
    if ~bplot
        continue
    end
    
    figure(n);
    clf
    hold on
    view(3);
    title(strcat('Test of elliptic',PQ{n}))
    xlabel('x');
    ylabel('k');
    if max(rerr) < 10*eps
        scatter3( xx, mm, rerr/eps);
        zlabel('rerr/eps')
    else
        scatter3( xx, mm, log(rerr/eps));
        zlabel('log(rerr/eps)')
    end
    grid on
    hold off
    drawnow
end
fprintf('%70s\n',repmat('-',1,nchar));

    
function f = randx
global n2 
N = n2;
r = randi(N);
f = (rand-0.5)*2^(r-floor(N/2));
end