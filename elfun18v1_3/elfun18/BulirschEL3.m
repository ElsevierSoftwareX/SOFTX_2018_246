function result = BulirschEL3( X, KC, P )
%BULIRSCHEL3 Bulirsch's elliptic integral of the third kind.
%  BULIRSCHEL3(X,KC,P) is the Bulirsch's elliptic integral of the 3rd kind
%  of the elements of X, KC (complementary modulus), and P. X, KC, and P  
%  must be real and of the same size or any of them can be scalar. 
%
%   See also
%       BULIRSCHEL1, BULIRSCHEL2

%   BULIRSCHEL3 is a wrapper function which mimics the elemental 
%   behaviour of function EL3.

%   Functions called:
%       el3, ufun3

    if nargin < 3
        error('Not enough input arguments.');
    end
    
    result = ufun3(@el3, X, KC, P);
    
end

