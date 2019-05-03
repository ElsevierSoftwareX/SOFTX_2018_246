function result = mijds( x, m)
%MIJDS Return the inverse of Jacobi elliptic function DS
%     
%       invds(x,m) = F(1/sqrt(m + x^2),k)
%
%   Result:
%       mijds(x,m) -- real scalar or NaN if either argument is invalid 
%           or convergenece failed.
%
%   Arguments:
%       x    -- real scalar 
%       m    -- real scalar, parameter (m = k^2)

%   Functions called:
%       melF, melK, mijcs
%
%   Matlab functions called:
%       abs, asin, asinh, isinf, isnan, sign, sqrt

%   References:
%   [1] M.Abramowitz, I.A.Stegun, "Handbook of Mathematical Functions",
%       New York, 1972
%   [2] W.Ehrhardt, "The AMath and DMath Special functions", 2016

    % Check input
    
    if isnan(x) || isinf(x) || isnan(m) || isinf(m)
        result = NaN;
        return
    end  
    
    % Special cases (Maple)
    
    if m > 1
        k = sqrt(m);
        result = mijcs(x/k,1/m)/k;
        return
    end
        
    if m == 1
        result = asinh(1/x);
        return
    end
    
    if m == 0
        if abs(x) >= 1
            result = asin(1/x);
        else
            result = NaN;
        end
        return
    end
    
    t = x^2 + m;
    
    if abs(t - 1) <= eps
        result = sign(x)*melK(m);
        return
    end
        
    if t < 1
        result = NaN;
        return
    end
    
    % General case
    
    s = sign(x);
    result = s*melF(1/sqrt(t),m);
    

end
