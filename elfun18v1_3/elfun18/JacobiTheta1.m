function result = JacobiTheta1( X, Q)
%JACOBITHETA1 Jacobi's theta1 function.
%   JACOBITHETA1(X,Q) is the Jacobi's theta1 function of the elements of X
%   and nome Q. X and Q must all be real and the same size or any of them
%   can be scalar.
%
%   See also JACOBITHETA2, JACOBITHETA3, JACOBITHETA4

%   JACOBITHETA1 is a wrapper function which mimics the elemental behaviour
%   of function jtheta1.

%   Functions called:
%       ufun2, jtheta1
%

    if nargin < 2
        error('Not enough input arguments.');
    end
    
    result = ufun2( @jtheta1, X, Q);
    
end

