function result = InverseGaussSL( X )
%INVERSEGAUSSSL Inverse Gauss lemniscate sin.
%   INVERSEGAUSSSL(X) is the inverse of lemniscate sin of the elements of 
%   X. The elements of X must be real.

%   INVERSEGAUSSSL is a wrapper function which mimics the elemental 
%   behaviour of function igsl.

%   Functions called:
%       igsl, ufun1

    if nargin < 1
        error('Not enough input arguments.');
    end
    
    result = ufun1(@igsl, X);
    
end

