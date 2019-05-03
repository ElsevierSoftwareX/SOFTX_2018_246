function result = mpJacobiOmega( Phi, NU, M )
%MPJACOBIOMEGA  Jacobi Omega function. 
%   MPJACOBIOMEGA(Phi,K) is the Jacobi Omega function of the elements of Phi 
%   (argument), NU (the characteristic) and M (the parameter). Phi, NU and
%   M must be real and the same size or any of them can be scalar.
%
%   See also
%       MPJACOBIOMEGA

%   MPJACOBIOMEGA is a wrapper function which mimics the elemental behaviour
%   of function mpjomega.

%   Functions called:
%       mpjomega, ufun3

    if nargin < 3
        error('Not enough input arguments.');
    end
    
    result = ufun3(@mpjomega, Phi, NU, M);
       
end

