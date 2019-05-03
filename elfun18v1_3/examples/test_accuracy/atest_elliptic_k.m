fprintf('==== COMPARSION TEST OF ELLIPTIC FUNCTIONS USING MODULUS K ===\n')
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

nchar = 12+4+8+7*12;
bplot = false;

PQ   = {'E', 'K', 'CE', 'CK','E','F', 'Pi','CPi','Pi','Nome'};
narg = [ 1,   1,    1,    1,  2,  2,   2,   2,    3,  1];
klim = [ 1,   1,    0,    0,  2,  2,   3,   4,    5,  1];

fprintf('%s\n',path);
fprintf('num. of runs %d\n',NRUN)
fprintf('%s\n',repmat('-',1,nchar));
fprintf('%12s%4s%8s%12s%12s%12s%12s%12s%12s%12s\n',...
    'func.','narg','nnan %','min(|arg|)','max(|arg|)',...
    'MAE','MRE/eps','RMS/eps','NDIG','RTIME %');
fprintf('%s\n',repmat('-',1,nchar));

rng('shuffle');
for n = 1:length(PQ)
    na = narg(n);
    fmlb = str2func(strcat( 'elliptic',PQ{n})); % matlab function
    switch na
        case 1
            fun  = strcat('Elliptic',PQ{n}); % my function
        case 2
            if strcmp(PQ(n),'CPi') || strcmp(PQ(n),'Pi')
                fun  = strcat('Elliptic',PQ{n}); % my function
            else
                fun  = strcat('pElliptic',PQ{n}); % my function
            end
        case 3
             fun  = strcat('pElliptic',PQ{n}); % my function
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
                if abs(x(na)) > 1
                    x(na) = 1/x(na);
                end
            elseif klim(n) == 2
                if abs(x(na)) > 1
                    if abs(x(1)) > pi/2
                        x(1) = 2/pi;
                    end
                end
                if abs(sin(x(1))*x(na)) > 1
                    x(na) = 0.9/sin(x(1));                    
                end
            elseif klim(n) == 3
                if x(1) > 1
                    x(1) = 1/x(1);
                end
                if abs(x(na)) > 1
                    x(na) = 1/x(na);
                end                  
            elseif klim(n) == 4
                if x(1) > 1
                    x(1) = 1/x(1);
                end  
            elseif klim(n) == 5
                                if abs(x(na)) > 1
                    if abs(x(1)) > pi/2
                        x(1) = 2/pi;
                    end
                end
                if sin(x(1))^2*x(2) > 1
                    x(2) = 0.9/sin(x(1))^2;
                    if x(1) > pi/2
                        x(1) = 2/pi;
                    end
                end                
                if abs(sin(x(1))*x(na)) > 1
                    x(na) = 0.9/sin(x(1));
                end                
            end
            switch na
                case (1)
                    fex  = real(fmlb(x(1)^2));
                    f    = fmy (x(1));
                case (2)
                    fex  = (fmlb(x(1),x(2)^2));
                    f    = fmy (x(1),x(2));
                case (3)
                    fex  = (fmlb(x(2),x(1),x(3)^2));
                    f    = fmy (x(1),x(2),x(3));
            end
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
        tic
        switch na
            case 1                
                f    = fmy (xx(1:end,1));
            case 2                
                f    = fmy (xx(1:end,1),xx(1:end,2));
            case 3                
                f    = fmy (xx(1:end,1),xx(1:end,2),xx(1:end,3));
        end
        tmy = toc;
        tic
        switch na
            case (1)
                fex  = real(fmlb(xx(:,1).^2));
                
            case (2)
                fex  = (fmlb(xx(:,1),xx(:,2).^2));
                
            case (3)
                fex  = (fmlb(xx(:,2),xx(:,1),xx(:,3).^2));        
        end
        tmlb = toc;
        
        xx(isnan(xx)) = [];
        rerr(isnan(rerr)) = [];
        
        fprintf('%12s%4d%8.3g%12.3g%12.3g%12.3g%12.3g%12.3g%12.3g%12.3g\n',...
            fun,...
            narg(n),nnan/NRUN*100,...
            max(min(abs(xx))),max(max(abs(xx))),...
            max(aerr)/eps0,max(rerr)/eps0,rms(rerr)/eps0,log(max(rerr))/log(10),...
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
f = (rand-0.5)*2^(r-ceil(N/2));
end