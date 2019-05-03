function result = mEllipticPi( X, N, M )
%MELLIPTICPI  Elliptic integral of 3rd kind (Jacobi form). 
%   MELLIPTICPI(X,N,M) is the Jacobi's form of  elliptic integral of the
%   3rd kind of elements of X, N and parameter M. X, N, M must be real and 
%   of the same size or any of them can be real scalar. 
%
%   MELLIPTICPI(N,M) is complete elliptic integral of the 3rd kind of the 
%   elements of N (characteristic) and M (parameter). N and K must be real.
%
%   See also
%       EllipticPi

%   See also
%       EllipticPi

%   MELLIPTICPi is a wrapper function which mimics the elemental behaviour
%   of function melPi and mcelPi.

%   Functions called:
%       mcelPi, melPi, ufun2, ufun3

    if nargin < 2
        error('Not enough input arguments.');
    end
    
    if nargin == 2
        result = ufun2(@mcelPi, X, N);
    else
        result = ufun3(@melPi, X, N, M);
    end
    
end

