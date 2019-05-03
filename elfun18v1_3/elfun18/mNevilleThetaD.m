function result = mNevilleThetaD( X, M )
%MNEVILLETHETAD Neville Theta function D.
%   MNEVILLETHETAC(X,M) is the Neville theta function S of the elements of X and
%   the parameter M. X and M must all be real and the same size or any of them
%   can be scalar.
%

%   MNEVILLETHETAD is a wrapper function which mimics the elemental behaviour
%   of function mnthd.

%   Functions called:
%       mnthetad, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end
    
    result = ufun2(@mnthetad, X, M);
    
end

