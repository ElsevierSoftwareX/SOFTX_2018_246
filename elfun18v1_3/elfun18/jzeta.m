function result = jzeta( x, k)
%JZETA Evaluates the values of the Jacobi elliptic Zeta functions for 
%   argument x and elliptic modulus k. x and k are assumed
%   to be real scalars without check. If convergence failed then NaN is
%   returned.
%
%   Functions called:
%       mjzeta
%

    result = mjzeta( x, k^2);
        
end


