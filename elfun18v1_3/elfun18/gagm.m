function  result  = gagm( a, b )
%GAGM Evaluates the Gauss arithmetic geometric mean of x and y 
%
%   Result:
%       gagm(a,b) --- real scalar or NaN if either argument is invalid 
%
%   Arguments:
%       a  -- real scalar 
%       b  -- real scalar 
%
%   Matlab functions called:
%       abs, sqrt
%
%   References:
%   [1] M.Abramowitz, I.Stegun, "Handbook of Mathematical Functions"
%       Sec. 17.6
%   [2] N.H.F.Beebe, "The mathematical-function computation handbook",
%       Springer, 2017, Sec. 20.1
%

    % Check input
    
    if isnan(a) || isnan(b) || isinf(a) || isinf(b)
        result = NaN;
        return
    end
    
    if sign(a) ~= sign(b)
        result = NaN;
        return
    end

    % Special cases
       
    if a == 0 || b == 0
        result = 0;
        return
    end

    if a == b
        result = a;
        return
    end
          
    % General case
    
    if a < 0
        a = -a;
        b = -b;
        s = -1;
    else
        s = 1;
    end
    
    ERRTOL = 0.5e-8; 
    
    while abs(a - b) > ERRTOL*a
        t = a;
        a = 0.5*(t + b);
        b = sqrt(t*b);
    end
    
    result = s*0.5*(a + b);
    
end

