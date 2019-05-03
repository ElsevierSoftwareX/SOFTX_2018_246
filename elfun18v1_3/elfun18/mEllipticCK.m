function result = mEllipticCK( M )
%MELLIPTICCK Complementary complete elliptic integral of the first kind. 
%   MELLIPTICCK(M) is the complementary complete elliptic integral of the
%   1st kind of the elements of M (param.). The elements of M must be real. 
%
%   See also
%       EllipticCK 

%   MELLIPTICCK is a wrapper function which mimics the elemental behaviour
%   of function melCK.

%   Functions called:
%       melCK, ufun1

    if nargin < 1
        error('Not enough input arguments.');
    end

    result = ufun1(@melCK, M);
    
end

