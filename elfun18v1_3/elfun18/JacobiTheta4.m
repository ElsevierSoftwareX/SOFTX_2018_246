function result = JacobiTheta4( X, Q)
%JACOBITHETA4 Jacobi's theta4 function.
%   JACOBITHETA4(X,Q) is the Jacobi's theta4 function of the elements of X
%   and nome Q. X and Q must all be real and the same size or any of them
%   can be scalar.
%
%   See also JACOBITHETA1, JACOBITHETA2, JACOBITHETA3

%   JACOBITHETA4 is a wrapper function which mimics the elemental behaviour
%   of function jtheta4.

%   Functions called:
%       ufun3, jtheta4
%

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2( @jtheta4, X, Q);
    
end

