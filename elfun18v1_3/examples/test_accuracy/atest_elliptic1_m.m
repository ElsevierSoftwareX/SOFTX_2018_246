fprintf('==== COMPARSION TEST OF ELLIPTIC FUNCTIONS USING PARAM. M ===\n')
path = 'C:\Program Files\MATLAB\R2018a\toolbox\symbolic\symbolic';
addpath(path)

global n2 
NRUN = 100;
N2MAX = 43;
N2    = N2MAX;
ndig = 0;
if ndig <= 0 || ndig > 16
    eps0 = eps;
else
    eps0 = 10^(-ndig);
end

if N2 > N2MAX || N2 < 0
    N2 = N2MAX;
end

nchar = 12+8+6*12;
bplot = false;

PQ   = {'E', 'K', 'CE', 'CK','Nome','B','C','D'};
narg = [ 1,   1,    1,    1,  1, 1, 1, 1];
klim = [ 1,   1,    0,    0,  1, 1, 1, 1];

fprintf('%s\n',path);
fprintf('num. of runs %d\n',NRUN)
fprintf('%s\n',repmat('-',1,nchar));
fprintf('%12s%8s%12s%12s%12s%12s%12s%12s\n',...
    'func.','nnan %','min(m)','max(m)',...
    'MAE/eps','MRE/eps','RMS/eps','NDIG');
fprintf('%s\n',repmat('-',1,nchar));

rng('shuffle');
for n = 1:length(PQ)
    na = narg(n);
    fmlb = str2func(strcat( 'elliptic',PQ{n})); % matlab function
    switch na
        case 1
            fun  = strcat('mElliptic',PQ{n}); % my function
        case 2
            if strcmp(PQ(n),'CPi') || strcmp(PQ(n),'Pi')
                fun  = strcat('mElliptic',PQ{n}); % my function
            else
                fun  = strcat('mpElliptic',PQ{n}); % my function
            end
        case 3
             fun  = strcat('mpElliptic',PQ{n}); % my function
    end
    fmy = str2func(fun);
    for n2 = 3:10:N2
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
            if klim(n) == 1
                if x(na) > 1
                    x(na) = 1/x(na);
                end
            elseif klim(n) == 0
                if x(na) < 0
                    x(na) = -x(na);
                end                
            end
                    fex  = real(fmlb(x(1)));
                    f    = fmy (x(1));

            if ndig > 0
                fex = round(fex,ndig);
                f   = round(f,ndig);
            end
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
       
        xx(isnan(xx)) = [];
        rerr(isnan(rerr)) = [];
        
        fprintf('%12s%8.3g%12.3g%12.3g%12.3g%12.3g%12.3g%12.3g\n',...
            fun,...
            nnan/NRUN*100,...
            min(min((xx))),max(max((xx))),...
            max(aerr)/eps0,max(rerr)/eps0,rms(rerr)/eps0,...
            log(max(rerr))/log(10))
             
        
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
f = (rand-0.5)*2^(r-ceil(N/2));
end

function result = ellipticB(m)
    if m == 0
        result = pi/4;
    else
    result = (ellipticE(m) - (1 - m)*ellipticK(m))/m;
    end
end

function result = ellipticD(m)
    if m == 0
        result = pi/4;
    else
    result = (ellipticK(m) - ellipticE(m))/m;
    end
end

function result = ellipticC(m)
    if m == 0
        result = pi/16;
    else
    result = (-2*ellipticE(m) + (2 - m)*ellipticK(m))/m^2;
    end
end