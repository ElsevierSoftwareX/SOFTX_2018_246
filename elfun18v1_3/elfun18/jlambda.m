function result = jlambda( x, nu, k)
%JLLAMBDA Evaluation Jacobi's form of elliptic integral of 3rd kind
%
%                           x
%                          | |  
%                          |        dt
%       Lambda(x,n,k)  =   |  ---------------
%                          |  1 - n*sn(t,k)^2
%                        | | 
%                         0
%   Result:
%       jlambda(x,k) -- real scalar or NaN if either argument is invalid 
%           or convergence failed.
%
%   Arguments: 
%       x   -- real scalar 
%       nu  -- real scalar, characteristics 1 - n*sn(t,k)^2 >= 0
%       k   -- real scalar, modulus 
%
%   Functions called:
%       mjlambda
%
%   Matlab functions called:
%       NONE
%

    result = mjlambda( x, nu, k^2);
       
end
