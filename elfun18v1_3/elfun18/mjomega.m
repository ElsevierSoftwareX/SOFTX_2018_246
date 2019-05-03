function result = mjomega( x, nu, m)
%MJOMEGA Evaluation of omega function i.e. periodic part of elliptic Lambda
% function ([2]).
%
%                                      Pi(n,m)
%       Omega(x,n,m) = Lambda(x,n,m) - ------- m
%                                       K(m)
%
%   Result:
%       mjomega(x,nu,m) -- real scalar or NaN if either argument is 
%           invalid or convergence failed.
%
%   Arguments: 
%       x   -- real scalar
%       n   -- real scalar, characteristic 
%       m   -- real scalar , parameter 
%
%   Functions called:
%       melK, mcelPi, mjlambda 
%
%   Matlab functions called:
%       isinf, isnan
%
%   References:
%   [1] W.P.Reinhardt,P.L.Walker, "Jacobian Elliptic Functions" In: 
%       F.W.J.Olver et al., NIST Handbook of Mathematical Functions, 
%       Cambridge, 2010.
%   [2] R.G.Langebartel, "Fourier expansions of rational fractions of 
%       elliptic integrals and Jacobian elliptic functions". SIAM 
%       J. Math. Anal. 11, 3, 1980, pp 506-513
%
    
    % Check input
    
    if isnan(x) || isinf(x)  || isnan(nu) || isinf(nu) || ...
            isnan(m) || isinf(m)
        result = NaN;
        return
    end
    
    if nu >= 1 || m >= 1
        result = NaN;
        return
    end
    
    % Special cases
    
    if x == 0 || nu == 0 || (nu == 0 && m == 0)
        result = 0;
        return
    end
       
    % General case ([2])
    
    result = mjlambda(x,nu,m) - mcelPi(nu,m)*x/melK(m);
    
end
