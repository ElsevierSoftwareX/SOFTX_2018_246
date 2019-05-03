function result = mpelE( phi, m)
%MPELE Evaluates the Legendre elliptic integral E of the second kind
%  
%
%               phi
%               | |  
%               |        
%       E   =   |  sqrt(1 - m*sin(t)^2) dt 
%               | 
%             | | 
%              0
%
%   Result:
%       mpelE(phi,m) -- real scalar or NaN if either argument is invalid 
%           or convergenece failed.
%
%   Arguments:
%       phi -- real scalar, amplitude
%       m   -- real scalar, parameter
%
%   Functions called:
%       cel2, celE, el2, umodpi
%
%   Matlab functions called:
%       abs, floor, isinf, isnan, mod, pi, sign, sqrt, tan
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
    
    % Special cases
    
    if phi == 0 
        result = 0;
        return
    end
    
    if m == 0
        result = phi;
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
        % [1] pp 80
        kc = sqrt(m - 1)/k;
        w  = sqrt((1 - t)*(1 + t));
        if w == 0
            result = sign(phi)*cel2( kc, 1, 0)/k;
        else
            result = el2( t/w, kc, 1, 0)/k;
        end
        return
    end
             
    % General case is based on Pascal procedure ellint_2 from AMath [3]
       
    s = sign(phi);
    [a, x] = umodpi(phi);
    
    if x == 0
        result = s*a*mcelE(m);
        return
    end
    
    kc2 = (1 - m);  
    if kc2 == 0
        % [2] 19.6.9
        t = sin(x);
    else
        if a ~= 0
            w = mcelE(m);
            a = a*w;
        end      
        % [1] pp 80
        t  = el2( tan(x), sqrt(kc2), 1, kc2);
    end
    
    result = s*(a + t);
    
end

