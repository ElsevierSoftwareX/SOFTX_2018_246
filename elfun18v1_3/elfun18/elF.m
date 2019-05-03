function result = elF( x, k)
%ELF Evaluates the incomplete elliptic integrals of the 1st kind
%
%                  x
%                 | |  
%                 |              dt
%       F(x,k) =  |  -----------------------------
%                 |  sqrt((1 - t^2)*(1 - k^2*t^2)) 
%               | | 
%                0
%
%   Result:
%       F(x,k) -- real scalar or NaN if either argument is invalid 
%           or convergenece failed.
%
%   Arguments:
%       x    -- real scalar, |x|<=1
%       k    -- real scalar, modulus |k*x| <= 1
%
%   Functions called:
%       melK, melF
%

    if nargin == 1
        result = melK( x^2); % x = k !!!
    else
        result = melF( x, k^2);
    end
    
end



