function result = elCK( k )
%ELCK  Evaluates the complementary complete elliptic integral of the 
%   1st kind 
%
%       K'(k) = K(1 - k) 
%
%   Result:
%       K'(k) -- real scalar or NaN if  argument is invalid or 
%           convergence failes.
%
%   Arguments:
%       k  -- real scalar, modulus 0 <= k < inf 
%
%   Functions called:
%      melCK 
%

    result = melCK(k^2);
    
end


