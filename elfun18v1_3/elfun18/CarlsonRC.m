function result = CarlsonRC( X, Y )
%CARLSONRC Carlson elliptic integral RC.
%   CARLSONRC(X,Y) is the Carlson elliptic integral RC of the elements 
%   of X and Y. X and Y must be real and of the same size or any of them 
%   can be scalar. The elements of X must be positive.
%
%   See also
%       CARLSONRD, CARLSONRF, CARLSONRG, CARLSONRJ

%   CARLSONRC is a wrapper function which emulates the elemental behaviour
%   of function RC.

%   Functions called:
%       rc, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@rc, X, Y);
    
end

