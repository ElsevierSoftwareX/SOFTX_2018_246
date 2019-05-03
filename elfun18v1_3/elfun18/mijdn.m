function result = mijdn( x, m)
%MIJDN Inverse of Jacobi elliptic function DN

%   Result:
%       invdn(x,m) -- real scalar or NaN if either argument is invalid 
%           or convergenece failed.
%
%   Arguments:
%       x    -- real scalar 
%       m    -- real scalar, parameter (m = k^2)

%   Functions called:
%       elF, elK, mijcn

%   Matlab functions called:
%       abs, asech, isinf, isnan, sqrt

%   References:
%   [1] M.Abramowitz, I.A.Stegun, "Handbook of Mathematical Functions",
%       New York, 1972
%   [2] W.Ehrhardt, "The AMath and DMath Special functions", 2016

    % Check input

    if isnan(x) || isnan(m) || isinf(m)
        result = NaN;
        return
    end
    
    % Special cases
  
    if m == 0
        result = NaN;
        return
    end
    
    if x == 1
        result = 0;
        return
    end
           
    if m == 1
        if x > 0 && x <= 1
            result = asech(x);
        else
            result = NaN;
        end
        return
    end
    
    if m > 1
        result = mijcn(x,1/m)/sqrt(m);
        return
    end

    % General case
    
    if m > 0 && x > 0 && x < 1
        a = sqrt((1 - x)*(1 + x)/m);
        result = melF( a, m);
    elseif m < 0 && x > 1
        a = sqrt((1 - x)*(x + 1)/m);
        result = melF( a, m);
    else
        result = NaN;
    end
    
end

