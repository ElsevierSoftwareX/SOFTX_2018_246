function result = pjomega( phi, nu, k)
%PJOMEGA Elliptic omega function i.e. periodic part of the Legendre 
%   elliptic integral of the third kind.
%
%                                        Pi(nu,k)
%       Omega(phi,nu,k) = Pi(phi,nu,k) - ------- F(phi,k)
%                                          K(k)
%
%   Result:
%       mpjomega(phi,nu,k) -- real scalar or NaN if either argument is 
%           invalid or convergence failed.
%
%   Arguments: 
%       phi -- real scalar, the argument
%       nu  -- real scalar, the characteristic 
%       k   -- real scalar, the modulus 
%
%   Functions called:
%       mpjomega
%
    
    result = mpjomega( phi, nu, k^2);
 
end
