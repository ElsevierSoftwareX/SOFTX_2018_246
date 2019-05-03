function result = InverseGudermannGD( X )
%INVERSEGUDERMANNGD Inverse Gudermannian function gd.
%   INVERSEGUDERMANNGD(X) is the inverse of the Gudermannian function gd 
%   of the elements of X. The elements of X must be real.

%   INVERSEGUDERMANNGD is a wrapper function which mimics the elemental 
%   behaviour of function igd.

%   Functions called:
%       igd, ufun1

    if nargin < 1
        error('Not enough input arguments.');
    end
    
    result = ufun1(@igd, X);
    
end

