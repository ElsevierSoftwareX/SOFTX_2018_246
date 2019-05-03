function result = BulirschEL2( X, KC, A, B )
%BULIRSCHEL2 Bulirsch's elliptic integral of the second kind.
%  Y = BULIRSCHEL2(X,KC,A,B) is the Bulirsch's elliptic integral of the
%   elements of X, KC (complementary modulus), A and B. X, KC, A and
%   B must all be real and of the same  size or any of them can be scalar. 
%
%   See also
%       BULIRSCHEL1, BULIRSCHEL3

%   BULIRSCHEL2 is a wrapper function which mimics the elemental 
%   behaviour of function EL2.

%   Functions called:
%       el3, ufun4

    if nargin < 4
        error('Not enough input arguments.');
    end
    
    result = ufun4(@el2, X, KC, A, B);
    
end

