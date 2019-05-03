function result = gd( x )
%GD Evaluates the Gudermannian function 
%
%                 x
%                | |          
%                |     dt
%       gd(x) =  |  ------- 
%                |   ch(t)
%              | | 
%               0
%   Result:
%       gd(x) -- real scalar or NaN if argument is invalid 
%
%   Arguments: 
%       x   -- real scalar
%
%   Functions called:
%       NONE
%
%   Matlab functions called:
%       abs, atan, isnan, isinf, pi, sign, sinh
%
%   References:
%   [1] F.W.J.Olver et al., NIST Handbook of Mathematical Functions, 
%       Cambridge, 2010.
%   [2] https://en.wikipedia.org/wiki/Gudermannian_function
%

    % Check input
    
    if isnan(x)
        result = NaN;
        return
    end
    
    % Special cases
    
    if x == 0
        result = 0;
        return
    end
    
    if isinf(x)
        result = sign(x)*pi/2;
        return
    end

    % General case ([1] 4.23.40)
    
    result = atan(sinh(x));  

end


