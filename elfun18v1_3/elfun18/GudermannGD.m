function result = GudermannGD( X )
%GUDERMANNGD Gudermannian function gd.
%   GUDERMANNGD(X) is Gudermann's function gd of the elements of X. The 
%   elements of X must be real.

%   GUDERMANNGD is a wrapper function which mimics the elemental 
%   behaviour of function gd.

%   Functions called:
%       gd, ufun1

    if nargin < 1
        error('Not enough input arguments.');
    end
    
    result = ufun1(@gd, X);
    
end

