function result = mijdc( x, m)
%MIJDC Return the inverse of Jacobi elliptic function DC

%   Result:
%       mijdc(x,m) -- real scalar or NaN if either argument is invalid 
%           or convergenece failed.
%
%   Arguments:
%       x    -- real scalar 
%       m    -- real scalar, parameter (m = k^2)
%

%   Functions called:
%       melF, melK, mijcd

%   Matlab functions called:
%       abs, acos, isinf, isnan, sqrt

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
        result = mijcd(x,1/m)/sqrt(m);
        return
    end
    
    if abs(x) < 1 || m == 1
        result = NaN;
        return
    end
    
    if x == 1
        result = 0;
        return
    end
    
    if x == -1
        result = 2*melK(m);
        return
    end
      
    if x == 1
        result = 0;
        return
    end
    
    if m == 0
        result = acos(1/x);
        return
    end
    
    if  abs(x) >= 16
        % From AMath [2]
        result= mijcd(1/x,m);
        return
    end
       
    % General case
    
    a = (x - 1)*(x + 1);
    b = x*x - m;
        
    result = melF( sqrt(a/b), m);
    
    if x < 0
       result = 2*melK(m) - result;
    end
    
end
