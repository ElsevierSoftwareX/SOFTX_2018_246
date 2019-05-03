function result = mijsd( x, m)
%MIJSD Return the inverse of Jacobi elliptic function SD
%
%   Result:
%       invsd(x,m) -- real scalar or NaN if either argument is invalid 
%           or convergenece failed.
%
%   Arguments:
%       x    -- real scalar 
%       m    -- real scalar, parameter (m = k^2)

%   Functions called:
%       melF, melK, mijsc
%
%   Matlab functions called:
%       abs, asin, asinh, isinf, isnan, sqrt

%   References:
%   [1] M.Abramowitz, I.A.Stegun, "Handbook of Mathematical Functions",
%       New York, 1972
%   [2] W.Ehrhardt, "The AMath and DMath Special functions", 2016

    % Check input
    
    if isnan(x) || isinf(x) || isnan(m) 
        result = NaN;
        return
    end

    % Special cases
    
    if x == 0 || isinf(m)
        result = 0;
        return
    end
    
    if m == 0
        if abs(x) <= 1
            result = asin(x);
        else
            result = NaN;
        end
        return
    end
       
    if m > 1
        m2 = sqrt(m);
        result = mijsc(m2*x, 1/m)/m2;
        return
    end

    if m == 1
        result = asinh(x);
        return
    end
       
    s = sign(x);
    x = abs(x);
    
    kc = sqrt(1 - m);
    if abs(x*kc - 1) <= eps
        result = s*melK(m);
        return
    end
    
    if x*kc > 1
        result = NaN;
        return
    end

	% General case
    
    result = s*melF(1/sqrt(1/x^2 + m),m);
    
end

