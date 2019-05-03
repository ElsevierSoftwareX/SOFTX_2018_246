function result = pJacobiOmega( Phi, NU, K )
%PJACOBIOMEGA  Jacobi Omega function. 
%   PJACOBIOMEGA(Phi,K) is the Jacobi Omega function of the elements of Phi 
%   (argument), NU (the characteristic) and K (modulus). Phi, NU and K must
%   be real and the same size or any of them can be scalar.
%
%   See also
%       MPJACOBIOMEGA

%   PJACOBIOMEGA is a wrapper function which mimics the elemental behaviour
%   of function pjomega.

%   Functions called:
%       pjomega, ufun3

    if nargin < 3
        error('Not enough input arguments.');
    end
    
    result = ufun3(@pjomega, Phi, NU, K);
       
end

