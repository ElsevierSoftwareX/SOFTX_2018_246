function result = mEllipticK( M )
%MELLIPTICK Complete elliptic integral of 1st kind. 
%   MELLIPTICK(M) is complete elliptic integral K of elements of parameter
%   M. The elements of M must all be real.
%
%   See also
%      mEllipticK

%   MELLIPTICK is a wrapper function which mimics the elemental behaviour
%   of function melK.

%   Functions called:
%       melK, ufun1

    if nargin < 1
        error('Not enough input arguments.');
    end
    
    result = ufun1(@melK, M);
    
end

