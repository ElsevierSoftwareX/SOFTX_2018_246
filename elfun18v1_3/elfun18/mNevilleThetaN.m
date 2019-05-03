function result = mNevilleThetaN( X, M )
%MNEVILLETHETAN Neville Theta function N.
%   MNEVILLETHETAN(X,M) is the Neville theta function N of the elements of X and
%   the parameter M. X and M must all be real and the same size or any of them
%   can be scalar.
%

%   MNEVILLETHETAN is a wrapper function which mimics the elemental behaviour
%   of function mnthn.

%   Functions called:
%       mnthetan, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end
    
    result = ufun2(@mnthetan, X, M);
    
end

