function result = mInverseJacobiSD( X, M )
%MINVERSEJACOBISD Inverse of the Jacobi function SD.
%   MINVERSEJACOBISD(X,M) is the inverse of Jacobi function SD for the
%   elements of argument X and parameter M. X and M must all be real and  
%   the same size or any of them can be scalar. 
%
%   See also INVERSEJACOBISD

%   MINVERSEJACOBISD is a wrapper function which mimics the elemental 
%   behaviour of function MIJSD.

%   Functions called:
%       mijsd, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@mijsd, X, M);
    
end

