function  result = mijcs( x, m)
%MIJCS Return inverse of Jacobi elliptic function CS.

%   Result:
%       mijcs(x,m) -- real scalar or NaN if either argument is invalid 
%           or convergenece failed.
%
%   Arguments:
%       x    -- real scalar 
%       m    -- real scalar, parameter (m = k^2)

%   Functions called:
%       pelF, melK, mijds

%   Matlab functions called:
%       abs, acot, asin, atan, isinf, isnan

%   References:
%   [1] M.Abramowitz, I.A.Stegun, "Handbook of Mathematical Functions",
%       New York, 1972
%   [2] W.Ehrhardt, "The AMath and DMath Special functions", 2016

    % Check input
    
    if isnan(x) || isinf(x) || isnan(m) || isinf(m)
        result = NaN;
        return
    end

    % Special cases
          
    if m > 1 
        k = sqrt(m);
        result = mijds(x/k,1/m)/k;
        return
    end
        
    if x == 0
        % ijcsc has singular point (Maple use value for ijsc(0+,k))
        result = NaN;
        return
    end
    
    if m == 0
        result = acot(x);
        return
    end
    
    if m == 1
        result = asinh(1/x);
        return
    end

    % General case   

    s = sign(x);
    result = melF( 1/sqrt(1 + x*x), m);
    if s < 0
        result =  - result; % 0 or 2 ???
    end
    
end
