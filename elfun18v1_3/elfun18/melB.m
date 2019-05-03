function result = melB( x, m)
%MELB Evaluates the Jahnke incomplete elliptic integral B.
%
%                  x
%                 | |  
%                 |            (1 - t^2) dt
%       B(x,m) =  |  --------------------------- = (E - (1 - m)*F)/m
%                 |  sqrt((1 - t^2)*(1 - m*t^2)) 
%               | | 
%                0
%
%   Result:
%       B(x,m) -- real scalar or NaN if either argument is invalid 
%           or convergenece failed.
%
%   Arguments:
%       x    -- real scalar 
%       m    -- real scalar, parameter
%
%   Functions called:
%       mcelB, melE
%
%   Matlab functions called:
%       abs, isinf, isnan
%
%   Reference:
%   [1] R.Bulirsch, "Numerical calculation of elliptic integrals and 
%       elliptic functions", Numerische Mathematik 7,1965, pp 78-90
%   [2] B.C.Carlson, "Elliptic Integrals" In: F.W.J.Olver et al., NIST 
%       Handbook of Mathematical Functions, Cambridge, 2010.


    % Check input
    
    if nargin == 1
        result = mcelB( x);
        return
    end 
    
    if isnan(x) || isnan(m) || abs(x) > 1
        result = NaN;
        return
    end
    
    % Special cases
    
    if isinf(m)
        result = 0;
        return
    end
    
    if x == 0
        result = 0;
        return
    end
    
    if abs(x) == 1
        result = sign(x)*mcelB(m);
        return
    end
           
    if m == 0
         result = 0.5*(asin(x) + x*sqrt((1-x)*(1 + x)));
         return
    end
    
    if m == 1
        result = x;
        return
    end
    
    x2 = x*x;
    p = (1 - x)*(1 + x);
    q = 1 - m*x2;
    if q < 0
        result = NaN;
    else
        result = x*(rf( p, q, 1) - (x2*rd( p, q, 1))/3);
    end
    
end



