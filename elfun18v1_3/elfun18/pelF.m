function result = pelF( phi, k )
%PELF Evaluates the Legendre elliptic integral F of the 1st kind
%
%                      phi
%                      | |  
%                      |           dt
%       F(phi,k)   =   |  ----------------------   
%                      |  sqrt(1 - k^2*sin(t)^2) 
%                    | | 
%                     0
%
%   Result:
%       F(phi,k) -- real scalar
%
%   Arguments:
%       phi -- real scalar, amplitude
%       k   -- real scalar, modulus 1 - k^2*sin(t)^2 >= 0 
%
%   Functions called:
%       mpelF

    result = mpelF( phi, k^2);
    
end


