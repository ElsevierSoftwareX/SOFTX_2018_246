function result = mijcd( x, m)
%MIJCD Return the inverse of Jacobi elliptic function CD

%   Result:
%       mijcd(x,m) -- real scalar or NaN if either argument is invalid 
%           or convergenece failed.
%
%   Arguments:
%       x    -- real scalar 
%       m    -- real scalar, parameter (m = k^2)

%   Functions called:
%       pelF, melK, mijdc

%   Matlab functions called:
%       abs, acos, asin, isinf, isnan, sqrt

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
        result = mijdc(x,1/m)/sqrt(m);
        return
    end    
    
    if abs(x) > 1
        result = NaN;
        return
    end
    
    if x == 1
        result = 0;
        return
    end
    
    if x == 0
        result = melK(m);
        return
    end
    
    if x == -1
        result = 2*melK(m);
        return
    end
    
    if m == 0
        result = acos(x);
        return
    end
    
    % General case
    
    s = (x < 0);
    x = abs(x);
    if x > 0.01 
        a = sqrt(m)*x;
        b = (1 - a)*(1 + a);
        a = (1 - x)*(1 + x)/b;
        result = melF(sqrt(a),m);
        %result = elF(sqrt(a),k);
    else
        result = melK(m) - mijsn(x,m);
    end
    if s 
        result = 2*melK(m) - result;
    end
   
end
