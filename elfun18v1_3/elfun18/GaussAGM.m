function result = GaussAGM( X, Y )
%GAUSSAGM Gauss' Arithmetic-Geometric Mean.
%   GAUSSAGM(X,Y) is Gauss' arithmetic geometric mean of the elements 
%   of X and Y. X and Y must all be real and of the same size or any of 
%   them can be scalar.
%

%   GAUSSAGM is a wrapper function which mimics the elemental behaviour
%   of function GAGM.

%   Functions called:
%       gagm, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end
    
    result = ufun2(@gagm, X, Y);
    
end

