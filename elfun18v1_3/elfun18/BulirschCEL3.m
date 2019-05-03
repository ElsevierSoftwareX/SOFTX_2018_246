function result = BulirschCEL3( KC, P )
%BULIRSCHCEL3 Bulirsch's complete elliptic integral of the third kind.
%   BULIRSCHCEL3(KC,P) is the Bulirsch's complete elliptic integral of the 
%   3rd kind of the elements of KC and P. KC and P must be real and of the 
%   same size or any of them can be scalar. 
%
%   See also
%       BULIRSCHCEL, BULIRSCHCEL1, BULIRSCHCEL2

%   BULIRSCHCEL3 is a wrapper function which mimics the elemental 
%   behaviour of function CEL3.

%   Functions called:
%       cel3, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@cel3, KC, P);
    
end

