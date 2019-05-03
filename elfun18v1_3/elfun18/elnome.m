function result = elnome(k)
%ELNOME Compute the elliptic nome 
%
%       q(k) = exp(-pi*K'(k)/K(k))
%
%   Result:
%       q(k) -- real scalar or NaN if argument is invalid.
%
%   Arguments:
%       k    -- real scalar, modulus |k|<= 1
%
%   Functions called:
%       melnome
%
%   Matlab functions called:
%      NONE
%

    result = melnome( k^2);

end

