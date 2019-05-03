function result = NevilleThetaC( X, Q )
%NEVILLETHETAC Neville Theta function C.
%   NEVILLETHETAC(X,Q) is the Neville theta function S of the elements of X and
%   nome Q. X and Q must all be real and the same size or any of them
%   can be scalar.
%

%   NEVILLETHETAC is a wrapper function which mimics the elemental behaviour
%   of function nthc.

%   Functions called:
%       nthetac, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end
    
    result = ufun2(@nthetac, X, Q);
    
end

