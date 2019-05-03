function result = elD( x, k)
%ELD Evaluates the complete or the incomplete elliptic integral D
%
%                  x
%                 | |  
%                 |            t^2 dt
%       D(x,k) =  |  ---------------------------- 
%                 |  sqrt((1 - t^2)*(1 - k^2t^2)) 
%               | | 
%                0
%
%   Result:
%       D(k)  -- complete integral, real scalar or NaN if either argument 
%           is invalid  or convergenece failed.
%       D(x,k) -- incomplete integral, real scalar or NaN if either
%           argument is invalid  or convergenece failed.
%
%   Arguments:
%       x    -- real scalar, |x|<=1
%       k    -- real scalar, modulus |k*x| <= 1
%
%   Functions called:
%       melD
    
    if nargin == 1
        result = melD( x^2);  % k = x !!!
    else    
        result = melD( x, k^2);
    end
    
end



