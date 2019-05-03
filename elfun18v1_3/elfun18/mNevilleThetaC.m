function result = mNevilleThetaC( X, M )
%MNEVILLETHETAC Neville Theta function C.
%   MNEVILLETHETAC(X,Q) is the Neville theta function S of the elements of X and
%   the parameter M. X and M must all be real and the same size or any of them
%   can be scalar.
%

%   MNEVILLETHETAC is a wrapper function which mimics the elemental behaviour
%   of function mnthc.

%   Functions called:
%       mnthetac, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end
    
    result = ufun2(@mnthetac, X, M);
    
end

