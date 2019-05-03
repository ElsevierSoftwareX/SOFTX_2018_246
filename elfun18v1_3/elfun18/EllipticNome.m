function result = EllipticNome( K )
%ELLIPTICNOME Elliptic nome function. 
%   ELLIPTICNOME(K) is the elliptic nome of the elements of 
%   modulus K. Elements of K must all be real and are limited to the 
%   interval [-1,1]. 
%

%   ELLIPTICNOME is a wrapper function which mimics the elemental behaviour
%   of function elnome.

%   Functions called:
%       elnome, ufun1

    if nargin < 1
        error('Not enough input arguments.');
    end
    
    result = ufun1(@elnome, K);
    
end

