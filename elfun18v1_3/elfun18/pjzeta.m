function result = pjzeta( phi, k)
%PJZETA Evaluates the values of the Jacobi Zeta functions for 
%   amplitude phi and elliptic modulus k. phi and k are assumed
%   to be real scalars without check. If convergence failed then NaN is
%   returned.
%
%   Matlab functions called:
%       abs, cos, isinf, isnan, sign, sin, sqrt
%
%   Functions called:
%       mpjzeta

    result = mpjzeta( phi, k^2);
    
end


