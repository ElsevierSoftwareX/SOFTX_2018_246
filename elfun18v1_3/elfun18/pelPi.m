function result = pelPi( phi, nu, k)
%PELPI Evaluates the Legendre elliptic integral Pi of the 3rd kind.
%
%                         phi
%                         | |  
%                         |           dt
%       Pi(phi,nu,k)  =   |  ----------------------------------------  
%                         |  (1 - nu*sin(x)^2)*sqrt(1 - k^2*sin(t)^2) 
%                       | | 
%                        0
%
%   Result:
%       Pi(phi,nu, k) -- real scalar or NaN if either argument is invalid 
%           or convergence filed.
%
%   Arguments:
%       phi -- real scalar, amplitude
%       nu  -- real scalar, characteristic, 1 - nu*sin(x)^2 >= 0 
%       k   -- real scalar, modulus, 1 - k^2*sin(t)^2 >= 0
%
%   Functions called:
%       mpelPi
%

    result = mpelPi( phi, nu, k^2);
            
end

