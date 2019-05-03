function result = BulirschCEL2( KC, A, B )
%BULIRSCHCEL2  Complete Bulirsch's elliptic integral of the second kind.
%   BULIRSCHCEL3(KC,A,B) is the Bulirsch's complete elliptic integral of  
%   the 2nd kind of the elements of KC, A and B. KC, A and B must all be  
%   real and of the same  size or any of them can be scalar. 
%
%   See also
%       BULIRSCHCEL, BULIRSCHCEL1, BULIRSCHCEL3

%   BULIRSCHCEL2 is a wrapper function which mimics the elemental 
%   behaviour of function CEL2.

%   Functions called:
%       cel2, ufun3

%   Reference:
%   R.Bulirsch -- Numerical calculation of elliptic integrals and elliptic
%       functions, Numerische Mathematik 7,1965, pp 78-90

    if nargin < 3
        error('Not enough input arguments.');
    end
    
    result = ufun3(@cel2, KC, A, B);
    
end

