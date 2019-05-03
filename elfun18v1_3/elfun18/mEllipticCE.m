function result = mEllipticCE( M )
%ELLIPTICCE Complementary complete elliptic integral of 2nd kind. 
%   MELLIPTICCE(M) is the complementary complete elliptic integral of the
%   2nd kind of the elements of parameter M. The elements of K must all be 
%   real.
%
%   See also
%       EllipticCE 

%   MELLIPTICCE is a wrapper function which mimics the elemental behaviour
%   of function melCE.

%   Functions called:
%       melCE, ufun1

    if nargin < 1
        error('Not enough input arguments.');
    end
    
    result = ufun1(@melCE, M);
    
end

