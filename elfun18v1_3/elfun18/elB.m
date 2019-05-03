function result = elB( x, k)
%ELB Evaluates the complete or incomplete elliptic integral B.
%
%                  x
%                 | |  
%                 |            (1 - t^2) dt
%       B(x,k) =  |  ----------------------------  
%                 |  sqrt((1 - t^2)*(1 - k^2*t^2)) 
%               | | 
%                0
%
%   Result:
%       B(k)   -- complete integral, real scalar or NaN if either argument
%            is invalid or convergenece failed.
%       B(x,k) -- incomplete integral, real scalar or NaN if either 
%           argument is invalid or convergenece failed.
%
%   Arguments:
%       x    -- real scalar, |x|<=1
%       k    -- real scalar, modulus |k*x| <= 1
%
%   Functions called:
%       melB
%
    
    if nargin == 1
        result = melB( x^2);  % k = x !!!
    else 
        result = melB(x,k^2);
    end
    
end



