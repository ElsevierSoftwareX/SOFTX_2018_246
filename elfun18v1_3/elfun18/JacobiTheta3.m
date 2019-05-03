function result = JacobiTheta3( X, Q)
%JACOBITHETA3 Jacobi's theta3 function.
%   JACOBITHETA3(X,Q) is the Jacobi's theta3 function of the elements of X
%   and nome Q. X and Q must all be real and the same size or any of them
%   can be scalar.
%
%   See also JACOBITHETA1, JACOBITHETA3, JACOBITHETA4

%   JACOBITHETA3 is a wrapper function which mimics the elemental behaviour
%   of function jtheta3.

%   Functions called:
%       ufun3, jtheta3
%

    if nargin < 2
        error('Not enough input arguments.');
    end
    
    result = ufun2( @jtheta3, X, Q);
    
end

