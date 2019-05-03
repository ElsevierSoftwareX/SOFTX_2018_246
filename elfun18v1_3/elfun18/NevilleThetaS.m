function result = NevilleThetaS( X, Q )
%NEVILLETHETAS Neville Theta function S.
%   NEVILLETHETAS(X,Q) is the Neville theta function S of the elements of X and
%   nome Q. X and Q must all be real and the same size or any of them
%   can be scalar.
%

%   NEVILLETHETAS is a wrapper function which mimics the elemental behaviour
%   of function nths.

%   Functions called:
%       nthetas, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end
    
    result = ufun2(@nthetas, X, Q);
    
end

