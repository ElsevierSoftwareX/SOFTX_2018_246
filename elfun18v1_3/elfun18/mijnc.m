function result = mijnc( x, m)
%MIJNC Returns the inverse of the Jacobi elliptic function NC
%
%   Result:
%       invnc(x,m) -- real scalar or NaN if either argument is invalid 
%           or convergenece failed.
%
%   Arguments:
%       x    -- real scalar 
%       m    -- real scalar, parameter (m = k^2)

%   Functions called:
%       melF, melK, mijnd
%
%   Matlab functions called:
%       abs, acosh, isinf, isnan, sign, sqrt

%   References:
%   [1] M.Abramowitz, I.A.Stegun, "Handbook of Mathematical Functions",
%       New York, 1972
%   [2] W.Ehrhardt, "The AMath and DMath Special functions", 2016

    % Check input
    
    if isnan(x) || isnan(m) || isinf(m) || abs(x) < 1
        result = NaN;
        return
    end
    
    % Special cases (Maple)
        
    if m > 1
        if x > 0
            result = mijnd(x,1/m)/sqrt(m);
        else
            result = NaN;
        end
        return
    end
        
    if m == 1
        if x > 1
            result = acosh(x);
        else
            result = NaN;
        end
        return
    end
    
    if x == 1
        result = 0;
        return
    end
    
    if x == -1
        result = 2*melK(m);
        return
    end
    
    if isinf(x)
        result = melK(m);
        return
    end
    
    % General case
    
    s = sign(x);
    x = abs(x);
    
    result = melF( sqrt(1 - 1/x^2), m);
    
    if s < 1
        result = 2*melK(m) - result;
    end
    
end
