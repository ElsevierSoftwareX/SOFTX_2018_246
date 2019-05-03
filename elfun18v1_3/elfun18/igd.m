function result = igd( x )
%IGD Evaluates the inverse of Gudermannian function gd
%
%                  x
%                 | |          
%                 |     dt
%       igd(x) =  |  ------- 
%                 |   cos(t)
%               | | 
%                0
%   Result:
%       igd(x) -- real scalar or NaN if argument is invalid 
%
%   Arguments: 
%       x   -- real scalar
%
%   Functions called:
%       NONE
%
%   Matlab functions called:
%       abs, asinh, isnan, pi, sign, tan
%
%   References:
%   [1] F.W.J.Olver et al., NIST Handbook of Mathematical Functions, 
%       Cambridge, 2010.
%

    if isnan(x) || abs(x) > pi/2
        result = NaN;
    elseif x == 0
        result = 0;
    elseif abs(x) == pi/2
        result = sign(x)*inf;
    else
        % General case ([1] 4.23.42)
        result = asinh(tan(x)); 
    end

end


