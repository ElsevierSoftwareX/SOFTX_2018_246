function result = JacobiTheta2( X, Q)
%JACOBITHETA2 Jacobi's theta2 function.
%   JACOBITHETA2(X,Q) is the Jacobi's theta2 function of the elements of X 
%   and nome Q. X and Q must all be real and the same size or any of them
%   can be scalar.
%
%   See also JACOBITHETA1, JACOBITHETA3, JACOBITHETA4

%   JACOBITHETA2 is a wrapper function which mimics the elemental behaviour
%   of function jtheta2.

%   Functions called:
%       ufun2, jtheta2
%

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2( @jtheta2, X, Q);
    
end

