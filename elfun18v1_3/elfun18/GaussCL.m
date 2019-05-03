function result = GaussCL( X )
%GAUSSCL Gauss lemniscate cos.
%   GAUSSCL(X) is Gauss's lemniscate cos of the elements of X. The elements
%   of X must be real.

%   GAUSSCL is a wrapper function which mimics the elemental behaviour of
%   function gcl.

%   Functions called:
%       gcl, ufun1

    if nargin < 1
        error('Not enough input arguments.');
    end
    
    result = ufun1(@gcl, X);
    
end

