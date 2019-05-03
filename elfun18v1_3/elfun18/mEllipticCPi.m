function result = mEllipticCPi( N, M )
%MELLIPTICCPI Complementary complete elliptic integral of 3rd kind.  
%   MELLIPTICCPI(N,K) is the complementary complete elliptic integral 
%   of the 3rd kind of elements of N and parameter M. N and M must be real
%   and of the same size or any of them can be real scalar. 
%
%   See also
%       EllipticCPi 

%   MELLIPTICCPi is a wrapper function which mimics the elemental behaviour
%   of function melCPi.

%   Functions called:
%       mcelCPi, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@melCPi, N, M);
    
end

