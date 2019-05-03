function result = melF( x, m)
%MELF Evaluates the incomplete elliptic integrals of the 1st kind
%
%                  x
%                 | |  
%                 |              dt
%       F(x,m) =  |  ---------------------------
%                 |  sqrt((1 - t^2)*(1 - m*t^2)) 
%               | | 
%                0
%
%   Result:
%       F(x,m) -- real scalar or NaN if either argument is invalid 
%           or convergenece failed.
%
%   Arguments:
%       x    -- real scalar, |x|<= min(1,1/sqrt(m))
%       m    -- real scalar, parameter, 1  - m*x^2 >= 0
%
%   Functions called:
%       rf
%
%   Matlab functions called:
%       abs, asin, atanh, isinf, isnan
%
%   Reference:
%   [1] B.C.Carlson,"Numerical computation of real or complex elliptic 
%       integrals", Numerical Algorithms 10, 1995, pp 13-26.
%

    % Check input
    
    if isnan(x) || isnan(m) || abs(x) > 1 
        result = NaN;
        return
    end
    
    % Special cases
    
    if isinf(m)
        if m < 0 || x == 0
            result = 0;
        else
            result = NaN;
        end
        return
    end

    if x == 0
        result = 0;
        return
    end
    
    if abs(x) == 1
        result = sign(x)*melK(m);
        return
    end
    
    if m == 0
        result = asin(x);
        return
    end
    
    if m == 1
        result = atanh(x);
        return
    end
       
    % General case
    
    p = (1 - x)*(1 + x);
    q = 1 - m*x*x;
    if q < 0
        result = NaN;
    else
        result = x*rf( p, q, 1);
    end
    
end



