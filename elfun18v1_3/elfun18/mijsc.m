function result  = mijsc( x, m)
%MIJSC Return the inverse of Jacobi elliptic function SC
%
%   Result:
%       mijscsc(x,m) -- real scalar or NaN if either argument is invalid 
%           or convergenece failed.
%
%   Arguments:
%       x    -- real scalar 
%       m    -- real scalar, parameter (m = k^2)

%   Functions called:
%       melF, melK, mijsd
%
%   Matlab functions called:
%       abs, asinh, atan, isinf, isnan, sign, sqrt

%   References:
%   [1] M.Abramowitz, I.A.Stegun, "Handbook of Mathematical Functions",
%       New York, 1972
%   [2] W.Ehrhardt, "The AMath and DMath Special functions", 2016

    % Check input
    
    if isnan(x) || isnan(m)
        result = NaN;
        return
    end

    % Special cases
    
    if x == 0 || isinf(m)
        result = 0;
        return
    end
    
    if m == 0
        result = atan(x);
        return
    end
    
    if m == 1
        result = asinh(x);
        return
    end
    
    if m > 1
        k = sqrt(m);
        result = mijsd(k*x,1/m)/k;
        return
    end
    
    s = sign(x);
    x = abs(x);
    
    if isinf(x)
        result = s*melK(m);
        return
    end
    
	% General case  
    
    result = s*melF( 1/sqrt(1 + 1/x^2), m);
    
end
