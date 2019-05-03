function result = NevilleThetaN( X, Q )
%NEVILLETHETAN Neville Theta function N.
%   NEVILLETHETAN(X,Q) is the Neville theta function N of the elements of X and
%   nome Q. X and Q must all be real and the same size or any of them
%   can be scalar.
%

%   NEVILLETHETAN is a wrapper function which mimics the elemental behaviour
%   of function nthn.

%   Functions called:
%       nthetan, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end
    
    result = ufun2(@nthetan, X, Q);
    
end

