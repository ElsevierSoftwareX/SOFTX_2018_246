function result = InverseGaussCL( X )
%INVERSEGAUSSCL Inverse of Gauss lemniscate cos.
%  INVERSEGAUSSCL(X) is inverse of lemniscate cos of the elements of X. The 
%   elements of X must be real.

%   INVERSEGAUSSCL is a wrapper function which mimics the elemental 
%   behaviour of function igcl.

%   Functions called:
%       igcl, ufun1

%   Reference:
%       http://mathworld.wolfram.com/LemniscateFunction.html

    if nargin < 1
        error('Not enough input arguments.');
    end
    
    result = ufun1(@igcl, X);
    
end

