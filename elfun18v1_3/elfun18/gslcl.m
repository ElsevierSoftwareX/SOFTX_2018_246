function [sl, cl] = gslcl( x)
%GSLCL  Gauss's lemniscatic elliptic functions sinlemn and coslemn
%
%   Functions called:
%       sncndn
%
%   Matlab functions called:
%       abs, fix, isnan, isinf, sqrt
%
%   References:
%   [1] W.Ehrhardt, "The AMath and DMath Special functions", 2016
%
    
    % Check input
    
    if isnan(x) || isinf(x)
        sl = NaN;
        cl = NaN;
        return
    end

    % General case is translation of Pascal procedure sincos_lemn from [1]

    x0  = 1.01e-4;

    y = abs(x);
    if y <= x0
        sl = x;
        cl = (1 - x)*(1 + x);
        return
    end
    
    TOM = 5.244115108584239621;
    if y > TOM
        % Cody/Waite style reduction mod 2*omega
        P1 = 5.244113922119140625;
        P2 = 1.18646494229324162e-6;
        P3 = 1.567026880591160005e-13;
        y  = fix(x/TOM);
        x  = ((x - y * P1) - y * P2) - y * P3;
    end
    sqrt2 = sqrt(2);
    [sl, cl, y] = sncndn( x*sqrt2, 0.5);
    sl = sl/y/sqrt2;
  
    
end


