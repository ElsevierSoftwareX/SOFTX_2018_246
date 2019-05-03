function result = mijcn( x, m)
%MIJCN Inverse of Jacobi elliptic function CN

%   Result:
%       mijcn(x,m) -- real scalar or NaN if either argument is invalid 
%           or convergenece failed.
%
%   Arguments:
%       x    -- real scalar 
%       m    -- real scalar, parameter (m = k^2)

%   Functions called:
%       melF, melK, mijdn

%   Matlab functions called:
%       abs, acos, acosh, isinf, isnan

    % Check input

    if isnan(x) || isnan(m) || isinf(m) || abs(x) > 1
        result = NaN;
        return
    end
    
    % Special cases
        
    if x == 1
        result = 0;
        return
    end
    
    if m == 0
        result = acos(x);
        return
    end

    if m == 1
        if x > 0
        result = acosh(1/x);
        else
            result = NaN;
        end
        return
    end
    
    if m > 1
        result = mijdn(x,1/m)/sqrt(m);
        return
    end
    
    % General case
    
    a = sqrt((1 - x)*(1 + x));
    result = melF( a, m);
    if x < 0
        result = 2*melK(m) - result;
    end
    
end
