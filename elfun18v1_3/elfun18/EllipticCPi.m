function result = EllipticCPi( N, K )
%ELLIPTICCPI Complementary complete elliptic integral of the third kind. 
%   ELLIPTICCPI(N,K) is the complementary complete elliptic integral 
%   of the 3rd kind of elements of N and modulus K. N and K must be real
%   and of the same size or any of them can be real scalar. 
%
%   See also
%       mEllipticCPi 

%   ELLIPTICCPi is a wrapper function which mimics the elemental behaviour
%   of function elCPi.

%   Functions called:
%       elCPi, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@elCPi, N, K);
    
end

