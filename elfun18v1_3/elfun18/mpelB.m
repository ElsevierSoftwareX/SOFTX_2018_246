function result = mpelB( phi, m)
%MPELB Evaluate the Legendre elliptic integral B.
%  
%                      phi
%                      | |  
%                      |       cos(t)^2 dt
%       B(phi,m)   =   |  ----------------------   
%                      |  sqrt(1 - m*sin(t)^2) 
%                    | | 
%                     0
%
%   Result:
%       mpelB(phi,k) -- real scalar or NaN if either argument is invalid 
%           or convergenece failed.
%
%   Arguments:
%       phi -- real scalar, amplitude
%       m   -- real scalar, parameter
%
%   Functions called:
%       mcelB, el2, pmelE, umodpi
%
%   Matlab functions called:
%       abs, asin, isinf, isnan, sign, sqrt, tan
%
%   References:
%   [1] R. Bulirsch, "Numerical calculation of elliptic integrals and 
%       elliptic functions", Numerische Mathematik 7, 1965, pp 78-90
%   [2] B.C.Carlson, "Elliptic Integrals" In: F.W.J.Olver et al., NIST
%       Handbook of Mathematical Functions, Sec.19.16(i), Cambridge, 2010.
%   [3] W.Ehrhardt, "The AMath and DMath Special functions", 2016

    
    % Check input
    
    if isnan(phi) || isinf(phi) || isnan(m) || isinf(m)
        result = NaN;
        return
    end
    
    % Special cases

    if isinf(m)
        result = 0;
        return
    end
    
    if phi == 0
        result = 0;
        return
    end
   
    if m > 1
        if abs(phi) > pi/2
            result = NaN;
            return
        end
        % [2] 19.7.4 Reciprocal-modulus transformation 
        k = sqrt(m);
        t = k*sin(phi);
        if abs(t) > 1 
            result = NaN;
            return
        end
        result = mpelE( asin(t), 1/m)/k;
        return
    end

    % General case is based on Pascal procedure ellint_b from AMath [3]
    
    s = sign(phi);
    [a, x] = umodpi(phi);
    
    if x == 0
        result = s*a*mcelB(m);
        return
    end
    
    if a ~= 0
        w = mcelB(m);
        a = a*w;
    end
        
    result = s*(a + el2( tan(x), sqrt(1 - m), 1, 0));

end

