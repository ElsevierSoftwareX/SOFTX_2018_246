function  result = jam( x, k )
%JAM Jacobi amplitude function 
%
%                    x
%                   | |          
%       am(x,k) =   |  dn(t,k) dt  
%                 | | 
%                  0
%   Result:
%       jam(x,k) -- real scalar or NaN if either argument is invalid or
%           convergence failed.
%
%   Arguments: 
%       x   -- real scalar
%       k   -- real scalar, modulus 
%
%   Functions called:
%       mjam 
%

    result = mjam( x, k^2);
    
end


