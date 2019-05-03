function  result = mijns( x, m)
%MIJNS Return the inverse of Jacobi elliptic function NS
%
%   Result:
%       mijns(x,m) -- real scalar or NaN if either argument is invalid 
%           or convergenece failed.
%
%   Arguments:
%       x    -- real scalar 
%       m    -- real scalar, parameter (m = k^2)

%   Functions called:
%       melF, melK, mijsc
%
%   Matlab functions called:
%       abs, acosh, asin, isinf, isnan, sign, sqrt

%   References:
%   [1] M.Abramowitz, I.A.Stegun, "Handbook of Mathematical Functions",
%       New York, 1972
%   [2] W.Ehrhardt, "The AMath and DMath Special functions", 2016

    % Check input
    
    if isnan(x) || isnan(m) || abs(x) < 1
        result = NaN;
        return
    end

    % Special cases (Maple)
    
    if isinf(m)
        result = 0;
        return
    end

    if m == 0
        if abs(x) >= 1
            result = acsc(x);
        else
            result = NaN;
        end
        return
    end
    
    if m == 1
        if abs(x) >= 1
            result = acoth(x);
        else
            result = NaN;
        end
        return
    end
    
    if isinf(x)
        result = 0;
        return
    end
    
    s = sign(x);
    x = abs(x);
    
    if x == 1
        if m <= 1
            result = s*melK(m);
        else
            result = NaN;
        end
        return
    end
    
    % General case ([1],[2]), it works also for m > 1
    
    result = s*melF( 1/x, m);
    
end
