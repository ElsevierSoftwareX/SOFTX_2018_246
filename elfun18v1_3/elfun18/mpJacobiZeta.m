function result = mpJacobiZeta( Phi, M )
%MPJACOBIZETA  Jacobi Zeta function. 
%   MPJACOBIZETA(Phi,M) is the Jacobi Zeta function of the elements of Phi 
%   (argument) and M (parameter). Phi and M must be real and the same size
%   or any of them can be scalar.
%
%   See also
%       PJACOBIZETA

%   MPJACOBIZETA is a wrapper function which mimics the elemental behaviour
%   of function mpjzeta.

%   Functions called:
%       mpjzeta, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end
    
    result = ufun2(@mpjzeta, Phi, M);
       
end

