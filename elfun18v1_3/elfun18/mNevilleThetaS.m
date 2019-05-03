function result = mNevilleThetaS( X, M )
%MNEVILLETHETAS Neville Theta function S.
%   MNEVILLETHETAS(X,M) is the Neville theta function S of the elements of X and
%   the parameter M. X and M must all be real and the same size or any of them
%   can be scalar.
%

%   MNEVILLETHETAS is a wrapper function which mimics the elemental behaviour
%   of function mnths.

%   Functions called:
%       mnthetan, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end
    
    result = ufun2(@mnthetas, X, M);
    
end

