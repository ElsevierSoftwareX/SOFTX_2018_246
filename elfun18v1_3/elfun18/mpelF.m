function result = mpelF( phi, m )
%MPELF Evaluates the Legendre elliptic integral F of the 1st kind
%
%                      phi
%                      | |  
%                      |           dt
%       F(phi,m)   =   |  ----------------------   
%                      |  sqrt(1 - m*sin(t)^2) 
%                    | | 
%                     0
%
%   Result:
%       mpelF(phi,m) -- real scalar
%
%   Arguments:
%       phi -- real scalar, amplitude
%       m   -- real scalar, parameter
%
%   Functions called:
%       el1, elK, igd, umodpi
%
%   Matlab functions called:
%       abs, isinf, isnan, sqrt, tan
%
%   References:
%   [1] R. Bulirsch, "Numerical calculation of elliptic integrals and 
%       elliptic functions", Numerische Mathematik 7, 1965, pp 78-90
%   [2] B.C.Carlson, "Elliptic Integrals" In: F.W.J.Olver et al., NIST
%       Handbook of Mathematical Functions, Sec.19.16(i), Cambridge, 2010.
%   [3] W.Ehrhardt, "The AMath and DMath Special functions", 2016
%
%   Note:
%       Bulirsch integrals give more accurate results than Carlson's.

    % Check input
    
    if isnan(phi) || isinf(phi) || isnan(m) || isinf(m)
        result = NaN;
        return
    end
    
    % Special cases ([2] 19.6(ii))
    
    if phi == 0
        result = 0;
        return
    end
    
    if m == 0
        result = phi;
        return
    end
        
    if m == 1
        result = igd(phi);
        return
    end
    
    if m > 1
        if abs(phi) > pi/2
            result = NaN;
            return
        end
        %[2] 19.7.4 Reciprocal-modulus transformation
        k = sqrt(m);
        t = k*sin(phi);
        if abs(t) > 1
            result = NaN;
            return
        end
        x = sqrt((1 - t)*(1 + t));
        % [1] pp 80
        if x == 0
            result = sign(phi)*melK(1/m)/k;
        else
            kc = sqrt(m - 1);
            result = el1( t/x, kc/k)/k;
        end
        return
    end
    
    % General case is based on Pascal procedure ellint_1 from AMath [3]

    s = sign(phi);
    [a, x] = umodpi(phi);
    
    if x == 0 
        result = s*a*melK(m);
        return
    end
    
    if  a ~= 0
        a = a*melK(m);
    end
      
    result = s*(a + el1( tan(x), sqrt(1 - m)));

end


