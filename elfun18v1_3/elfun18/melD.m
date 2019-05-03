function result = melD( x, m)
%MELD Evaluates the incomplete elliptic integral D
%
%                  x
%                 | |  
%                 |            t^2 dt
%       D(x,m) =  |  ---------------------------- = (F(x,m) - E(x,m))/m
%                 |  sqrt((1 - t^2)*(1 - m*t^2)) 
%               | | 
%                0
%
%   Result:
%       D(x,m) -- real scalar or NaN if either argument is invalid 
%           or convergenece failed.
%
%   Arguments:
%       x    -- real scalar 
%       m    -- real scalar, the parameter
%
%   Functions called:
%       mcelD, rd
%
%   Matlab functions called:
%       abs, asin, atanh, isnan, sign, sqrt
%
%   Reference:
%   [1] B.C.Carlson,"Computing Elliptic Integrals by Duplication", Numer. 
%       Math. 33, 1979, pp 1-16.

    % Check input
    
    if nargin == 1
        result = mcelD( x);
        return
    end 
    
    if isnan(x) || isnan(m) || abs(x) > 1
        result = NaN;
        return
    end
    
    % Special cases (Maple)
    
    if isinf(m)
        result = 0;
        return
    end
       
    if x == 0
        result = 0;
        return
    end

    if abs(x) == 1
        result = sign(x)*mcelD(m);
        return
    end
    
    if m == 0
         result = 0.5*(asin(x) - x*sqrt((1-x)*(1 + x)));   
         return
    end
       
    if m == 1
        result = atanh(x) - x;
        return
    end
    
    % General case (by definition using E and K from [1] Eq 4.5-4.6)
    
    x2 = x*x;
    p = (1 - x)*(1 + x);
    q = 1 - m*x2;
    if q < 0
        result = NaN;
    else
        result = (x*x2*rd( p, q, 1))/3;
    end
    
end



