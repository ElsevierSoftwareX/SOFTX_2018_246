function result = NevilleThetaD( X, Q )
%NEVILLETHETAD Neville Theta function D.
%   NEVILLETHETAD(X,Q) is the Neville theta function S of the elements of X and
%   nome Q. X and Q must all be real and the same size or any of them
%   can be scalar.
%

%   NEVILLETHETAD is a wrapper function which mimics the elemental behaviour
%   of function nthd.

%   Functions called:
%       nthetad, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end
    
    result = ufun2(@nthetad, X, Q);
    
end

