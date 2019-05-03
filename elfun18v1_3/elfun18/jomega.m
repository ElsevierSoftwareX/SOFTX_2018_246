function result = jomega( x, nu, k)
%JOMEGA Evaluation of elliptic Omega function i.e. periodic part of the
%   elliptic Lambda function.
%
%                                      Pi(n,k)
%       Omega(x,n,k) = Lambda(x,n,k) - ------- x
%                                       K(k)
%
%   Result:
%       jomega(x,k) -- real scalar or NaN if either argument is invalid or
%           convergence failed.
%
%   Arguments: 
%       x   -- real scalar
%       n   -- real scalar, characteristic n <= 1
%       k   -- real scalar , modulus |k| <= 1
%
%   Functions called:
%       mjomega 
%

    result = mjomega( x, nu, k^2);
    
end
