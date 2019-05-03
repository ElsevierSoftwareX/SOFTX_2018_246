function result = mpjomega( phi, nu, m)
%MPJOMEGA Evaluation of omega function i.e. periodic part of the Legendre 
%   elliptic integral of the third kind.
%
%                                        Pi(nu|m)
%       Omega(phi,nu|m) = Pi(phi,nu|m) - ------- F(phi|m)
%                                          K(m)
%
%   Result:
%       mpjomega(phi,nu,m) -- real scalar or NaN if either argument is 
%           invalid or convergence failed.
%
%   Arguments: 
%       phi -- real scalar, the argument
%       n   -- real scalar, the characteristic 
%       m   -- real scalar, the parameter 
%
%   Functions called:
%       igd, melK, mcelPi, mpelPi
%
%   Matlab functions called:
%       isinf, isnan
%
%   References:
%   [1] R.G.Langebartel, "Fourier expansions of rational fractions of 
%       elliptic integrals and Jacobian elliptic functions". SIAM 
%       J. Math. Anal. 11, 3, 1980, pp 506-513
%
    
    % Check input
    
    if isnan(phi) || isinf(phi)  || isnan(nu) || isinf(nu) || ...
            isnan(m) || isinf(m)
        result = NaN;
        return
    end
    
    if nu > 1 || m > 1 || (nu == 1 && m == 1)
        result = NaN;
        return
    end
    
    % Special cases
    
    if phi == 0 || nu == 0 
        result = 0;
        return
    end
    
    if nu == 1 && m == 0
        result = -inf;
        return
    end
    
    if m == 1
        if nu < 0
            result = mpelPi(phi,nu,1);
        else
            result = -inf;
        end
        return
    end
    
    % General case ([2])
    
    result = mpelPi(phi,nu,m) - mcelPi(nu,m)*mpelF(phi,m)/melK(m);
    
end
