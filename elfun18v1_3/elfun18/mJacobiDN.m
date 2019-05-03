function result = mJacobiDN( X, M )
%MJACOBIDC Jacobi's function dn.
%   Y = MJACOBIDN(X,M) computes Jacobi's function DN for elements of 
%   argument X and parameter M. X and M must all be real and the same size 
%   or any of them can be scalar.
%
%   See also JACOBIDN

%   MJACOBIDN is interface function which mimics the elemental 
%   behaviour of function MJDN.

%   Functions called:
%       mjdn, ufun2

%   References:
%   W.P.Reinhardt,P.L.Walker, "Jacobian Elliptic Functions" In: 
%   F.W.J.Olver et al., NIST Handbook of Mathematical Functions, 
%   Chap. 22, Cambridge, 2010.

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@mjdn, X, M);
    
end

