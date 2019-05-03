function result = EllipticCK( K )
%ELLIPTICCK Complementary complete elliptic integral of the first kind. 
%   ELLIPTICCK(K) is the complementary complete elliptic integral of the
%   1st kind of the elements of K (modulus). The elements of K must be real. 
%
%   See also
%       mEllipticCK 

%   ELLIPTICCK is a wrapper function which mimics the elemental behaviour
%   of function elCK.

%   Functions called:
%       elCK, ufun1

    if nargin < 1
        error('Not enough input arguments.');
    end

    result = ufun1(@elCK, K);
    
end

