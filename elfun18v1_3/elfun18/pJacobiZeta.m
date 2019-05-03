function result = pJacobiZeta( Phi, K )
%PJACOBIZETA  Jacobi Zeta function. 
%   PJACOBIZETA(Phi,K) is the Jacobi Zeta function of the elements of Phi 
%   (argument) and K (modulus). Phi and K must be real and the same size
%   or any of them can be scalar.
%
%   See also
%       JACOBIZETA, MJACOBIZETA

%   PJACOBIZETA is a wrapper function which mimics the elemental behaviour
%   of function pjzeta.

%   Functions called:
%       pjzeta, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end
    
    result = ufun2(@pjzeta, Phi, K);
       
end

