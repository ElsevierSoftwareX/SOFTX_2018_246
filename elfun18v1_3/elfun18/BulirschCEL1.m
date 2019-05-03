function result = BulirschCEL1( KC )
%BULIRSCHCEL1 Bulirsch's complete elliptic integral of the first kind.
%   BULIRSCHCEL1(KC) is the Bulirsch's  complete elliptic integral of the 
%   first kind of the elements of KC ( complementary modulus). KC must be
%   real. 
%
%   See also
%       BULIRSCHCEL, BULIRSCHCEL2, BULIRSCHCEL3

%   BULIRSCHCEL1 is a wrapper function which mimics the elemental 
%   behaviour of function CEL1.

%   Functions called:
%       cel1, ufun1

    if nargin < 1
        error('Not enough input arguments.');
    end
    
    result = ufun1(@cel1, KC);
    
end

