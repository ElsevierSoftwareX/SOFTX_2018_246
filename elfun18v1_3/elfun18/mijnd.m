function result = mijnd( x, m)
%MIJND Return the inverse of Jacobi elliptic function ND
%
%   Result:
%       invnd(x,m) -- real scalar or NaN if either argument is invalid 
%           or convergenece failed.
%
%   Arguments:
%       x    -- real scalar 
%       m    -- real scalar, parameter (m = k^2)

%   Functions called:
%       melF, melK, mijnc
%
%   Matlab functions called:
%       abs, acosh, asin, isinf, isnan, sign, sqrt

%   References:
%   [1] M.Abramowitz, I.A.Stegun, "Handbook of Mathematical Functions",
%       New York, 1972
%   [2] W.Ehrhardt, "The AMath and DMath Special functions", 2016

    % Check input
    
    if isnan(m) || isnan(x) || isinf(x) 
        result = NaN;
        return
    end  
    
    % Special cases 
    
    if x == 1
        result = 0;
        return
    end
    
    if isinf(m)
        result = 0;
        return
    end
    
    if m == 0
        result = NaN;
        return
    end
         
    if m > 1
        result = mijnc(x,1/m)/sqrt(m);
        return
    end
       
    if m == 1 
        if x > 1
            result = acosh(x);
        else
            result = NaN;
        end
        return
    end
        
    % General case ([1],[2])
    
    if x < 0 
        result = NaN;
       return
    end
        
    if m > 0  % 1<x<1/sqrt(1-m)
        kc = sqrt(1 - m);
        if abs(x*kc - 1) <= eps
            result = melK(m);
            return
        end
        if x*kc > 1
            result = NaN;
            return
        end
    end
   
    % m < 0 1/sqrt(1-m) < x < 1
    a = (1 - 1/x)*(1 + 1/x);
    a = a/m;
    if a >= 0 && a <= 1
        result = melF(sqrt(a), m);
    else
        result = NaN;
    end
        
        

end
