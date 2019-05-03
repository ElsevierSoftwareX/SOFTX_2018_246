function result = pelB( phi, k)
%PELB Evaluate the Legendre elliptic integral B.
%  
%                      phi
%                      | |  
%                      |       cos(t)^2 dt
%       B(phi,k)   =   |  ----------------------   
%                      |  sqrt(1 - k^2*sin(t)^2) 
%                    | | 
%                     0
%
%   Result:
%       B(phi,k) -- real scalar or NaN if either argument is invalid 
%           or convergenece failed.
%
%   Arguments:
%       phi -- real scalar, amplitude
%       k   -- real scalar, modulus, 1 - k^2*sin(t)^2 >= 0
%
%   Functions called:
%       mpelB

    result = mpelB( phi, k^2);

end

