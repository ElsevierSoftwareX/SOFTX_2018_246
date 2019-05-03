function result = pelD( phi, k)
%PELD Evaluates the Legendre elliptic integral D
%
%
%               phi
%               | |  
%               |        sin(t)^2 dt
%       D   =   |  ----------------------  = (F(phi,k) - E(phi,k))/k^2 
%               |  sqrt(1 - k^2*sin(t)^2) 
%             | | 
%              0
%
%   Result:
%       D(phi,k) -- real scalar or NaN if either argument is invalid 
%           or convergenece failed.
%
%   Arguments:
%       phi -- real scalar, argument
%       k   -- real scalar, modulus, 1 - k^2*sin(t)^2 >= 0
%
%   Functions called:
%       mpelD

    result = mpelD( phi, k^2);
    
end

