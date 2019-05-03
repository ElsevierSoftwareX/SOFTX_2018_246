function result = EllipticCE( K )
%ELLIPTICCE Complementary complete elliptic integral of the 2nd kind. 
%   ELLIPTICCE(K) is the complementary complete elliptic integral of the
%   2nd kind of the elements of modulus K. The elements of K must all be 
%   real.
%
%   See also
%       mEllipticCE 

%   ELLIPTICCE is a wrapper function which mimics the elemental behaviour
%   of function elCE.

%   Functions called:
%       elCE, ufun1

    if nargin < 1
        error('Not enough input arguments.');
    end

    result = ufun1(@elCE, K);
    
end

