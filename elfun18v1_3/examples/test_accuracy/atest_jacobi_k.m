fprintf('==== COMPARSION TEST OF ELLIPTIC FUNCTIONS USING MODULUS K ===\n')
path = 'C:\Program Files\MATLAB\R2018a\toolbox\symbolic\symbolic';
addpath(path)

global n2 
NRUN = 1000;
N2MAX = 31;
N2    = N2MAX;

if N2 > N2MAX || N2 < 0
    N2 = N2MAX;
end
nchar = 12+8+8*12;
bplot = false;
bklim = false;

PQ = {'CD', 'CN', 'CS', ...
    'DC', 'DN', 'DS', ...
    'NC', 'ND', 'NS', ...
    'SC', 'SD', 'SN', 'AM','Zeta'};

narg = 2*ones(length(PQ),1);


fprintf('%s\n',path);
fprintf('num. of runs %d\n',NRUN)
fprintf('%s\n',repmat('-',1,nchar));
fprintf('%12s%8s%12s%12s%12s%12s%12s%12s%12s%12s\n',...
    'func.','nnan %','min(|x|)','max(|x|)','min(|k|)','max(|k|)',...
    'MAE/eps','MRE/eps','RMS/eps','NDIG');
fprintf('%s\n',repmat('-',1,nchar));

rng('shuffle');
for n = 1:length(PQ)
    na = narg(n);
    fmlb = str2func(strcat( 'jacobi',PQ{n})); % matlab function
    fun  = strcat('Jacobi',PQ{n}); % my function
    fmy = str2func(fun);
    for n2 = 1:10:N2
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
            if bklim
                if abs(x(na)) > 1
                    x(na) = 1/x(na);
                end
            end
            
            fex  = fmlb(x(1),x(2)^2);
            f    = fmy (x(1),x(2));
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
        f    = fmy (xx(1:end,1),xx(1:end,2));
        tmy = toc;
        tic        
        fex  = fmlb(xx(:,1),xx(:,2).^2);        
        tmlb = toc;
        
        xx(isnan(xx)) = [];
        rerr(isnan(rerr)) = [];
        
        fprintf('%12s%8.3g%12.3g%12.3g%12.3g%12.3g%12.3g%12.3g%12.3g%12.3g\n',...
            fun,...
            nnan/NRUN*100,...
            max(min(abs(xx(:,1)))),max(max(abs(xx(:,1)))),...
            max(min(abs(xx(:,2)))),max(max(abs(xx(:,2)))),...
            max(aerr)/eps,max(rerr)/eps,rms(rerr)/eps,log10(max(rerr))) 
        
    end
    fprintf('%70s\n',repmat('-',1,nchar));
    if ~bplot
        continue
    end
    
    figure(n);
    clf
    hold on
    view(3);
    title(strcat('Test of Jacobi',PQ{n}))
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
f = (rand-0.5)*2^(r-ceil(N/2));
end