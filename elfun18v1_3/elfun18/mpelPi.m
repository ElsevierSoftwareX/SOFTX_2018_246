function result = mpelPi( phi, nu, m)
%MPELPI Evaluates the Legendre elliptic integral Pi of the 3rd kind.
%
%                         phi
%                         | |  
%                         |           dt
%       Pi(phi,nu,m)  =   |  ----------------------------------------  
%                         |  (1 - nu*sin(x)^2)*sqrt(1 - m*sin(t)^2) 
%                       | | 
%                        0
%
%   Result:
%       mpelPi(phi,nu,m) - real scalar or NaN if either argument is invalid 
%           or convergence filed.
%
%   Arguments:
%       phi -- real scalar, amplitude
%       nu  -- real scalar, characteristic 
%       m   -- real scalar, parameter
%
%   Functions called:
%       cel3, el3, pmelF
%
%   Matlab functions called:
%       abs, asin, isinf, isnan, sin, sqrt, tan
%
%   References:
%   [1] R. Bulirsch, "Numerical calculation of elliptic integrals and 
%       elliptic functions. III", Numerische Mathematik 13, 1969, 
%       pp 305 - 315
%   [2] B.C.Carlson, "Elliptic Integrals" In: F.W.J.Olver et al., NIST
%       Handbook of Mathematical Functions, Sec.19.16(i), Cambridge, 2010.
%   [3] W.Ehrhardt, "The AMath and DMath Special functions", 2016
%
%
    % Check input

    if isnan(phi) || isinf(phi) || isnan(m) || isinf(m) || isnan(nu)
        result = NaN;
        return
    end

    % Specila cases
    
    if phi == 0
        result = 0;
        return
    end

    if isinf(nu)
        result = 0;
        return
    end
    
    if nu == 0        
        if m == 0
            % [1] 19.6.11 (2)
            result = phi;
        else
            % [1] 19.6.13 (1)
            result = mpelF(phi,m);
        end
        return
    end

    if m == 0 && nu == 1
        % [1] 19.6.11 (3)
        result = tan(phi); 
        return
    end
       
    if m > 1
        if abs(phi) > pi/2
            result  = NaN;
            return
        end
        % [1] 19.7.4 (3) Reciprocal-modulus transformation
        k = sqrt(m);
        t = sin(phi);
        if m*t^2 > 1 || nu*t^2 > 1
            result  = NaN;
            return
        end
        t = k*t;
        nu = nu/m;
        kc = sqrt(m - 1)/k;
        w  = sqrt((1 - t)*(1 + t));
        % [1] Eqs 1.1.2, 1.2.2
        if w == 0
            result = cel3( kc, 1 - nu)/k;
        else
            result = el3( t/w, kc, 1 - nu)/k;
       end
       return
    end
    
    if nu >= 1
        if abs(phi) > pi/2 || nu*sin(phi)^2 >= 1
            result = NaN;
            return
        end
        result = el3( tan(phi),  sqrt(1 - m), 1 - nu);
        return
    end
  
    % General case is based on Pascal procedure ellint_3 from AMath [3]
    
    % Here m < 1 and nu < 1
    
    s   = sign(phi);
    [a, x] = umodpi(phi);
    
    if x == 0
        if a == 0
            result = 0;
        else
            result = s*a*mcelPi( nu, m);
        end
        return
    end
    
    if a ~= 0
        a = a*mcelPi( nu, m);
    end
    
    result = s*(a + el3( tan(x),  sqrt(1 - m), 1 - nu));
    return

    x = sin(x);
    x2 = x*x;
    if  m*x2 > 1 || nu*x2 > 1
        result = NaN;
        return
    end

    p  = (1 - x)*(1 + x);
    q  = 1 - m*x2;

    result = s*( a + x*(rf( p, q, 1) + nu*x2*rj( p, q, 1, 1 - nu*x2)/3));
        
end

