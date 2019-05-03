function result = mijsn( x, m)
%MIJSN Inverse of Jacobi elliptic function SN
%
%       invsn(x,m) = F(x,m)

%   Result:
%       mijsn(x,m) -- real scalar or NaN if either argument is invalid 
%           or convergenece failed.
%
%   Arguments:
%       x    -- real scalar 
%       m    -- real scalar, parameter (m = k^2)

%   Functions called:
%       melF
%
%   Matlab functions called:
%       abs, asin, atanh, isinf, isnan

%   References:
%   [1] M.Abramowitz, I.A.Stegun, "Handbook of Mathematical Functions",
%       New York, 1972
%   [2] W.Ehrhardt, "The AMath and DMath Special functions", 2016

    result = melF(x,m);
    return
    
    % Check input
    
    if isnan(x) || isnan(m) || isinf(m) || abs(x) > 1
        result = NaN;
        return
    end  
    
    % Specila cases
    
    if m == 0
        result = asin(x);
        return
    end

    if m == 1
        result = atanh(x);
        return
    end

    % General case
    
    result = melF( x, m);
    
end
