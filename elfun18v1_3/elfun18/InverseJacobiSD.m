function result = InverseJacobiSD( X, K )
%INVERSEJACOBISD Inverse of the Jacobi function SD.
%   INVERSEJACOBISD(X,K) is the inverse of Jacobi function SD for 
%   elements of argument X and modulus K. X and K must all be real and the 
%   same size or any of them can be scalar. 
%
%   See also MINVERSEJACOBISD

%   INVERSEJACOBISD is a wrapper function which mimics the elemental 
%   behaviour of function IJSD.

%   Functions called:
%       ijsd, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@ijsd, X, K);
    
end

