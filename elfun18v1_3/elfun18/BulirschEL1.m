function result = BulirschEL1( X, KC )
%BULIRSCHEL1 Bulirsch's elliptic integral of the first kind.
%   BULIRSCHEL1(X,KC) is the Bulirsch's elliptic integral of the 1st kind 
%   of the element of X and KC (complementary  modulus). X and KC must be 
%   real and of the same  size or any of them can be scalar.
%
%   See also
%       BULIRSCHEL2, BULIRSCHEL3

%   BULIRSCHEL1 is a wrapper function which mimics the elemental 
%   behaviour of function EL1.

%   Functions called:
%       el1, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end
    
    result = ufun2(@el1, X, KC);
    
end

