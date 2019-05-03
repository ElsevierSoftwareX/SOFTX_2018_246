function result = pelE( phi, k)
%PELE Evaluates the Legendre elliptic integral E of the second kind
%  
%
%               phi
%               | |  
%               |        
%       E   =   |  sqrt(1 - k^2*sin(t)^2) dt 
%               | 
%             | | 
%              0
%
%   Result:
%       E(phi,k) -- real scalar or NaN if either argument is invalid 
%           or convergenece failed.
%
%   Arguments:
%       phi -- real scalar, amplitude
%       k   -- real scalar, modulus, 1 - k^2*sin(t)^2 >= 0
%
%   Functions called:
%       mpelE
%

    result = mpelE( phi, k^2);
    
end

