function result = ijam( x, k)
%IJAM inverse of the Jacobi amplitude function AM.
%
%       invam = F(sin(x),k)
%
%   Result:
%       ijam(x,k) -- real scalar or NaN if either argument is invalid 
%           or convergenece failed.
%
%   Arguments:
%       x    -- real scalar
%       k    -- real scalar, elliptic modulus 
%
%   Functions called:
%      mijam

    result = mijam( x, k^2);
    
end
