function result = el2( x, kc, a, b )
%EL2 Evaluates the Bulirsch's elliptic integral of 2nd kind
%
%                      x
%                     | |  
%                     |            (a + b*t^2) dt
%   el2(x,kc,a,b) =   |  ---------------------------------------
%                     |  (1 + t^2)*sqrt((1 + t^2)*(1 + kc^2*t^2)) 
%                   | | 
%                    0
%
%   Result:
%       el2(x,kc,a,b) -- real scalar or NaN if either argument is invalid 
%           or convergenece failed.
%
%   Arguments:
%       x    -- real scalar
%       kc   -- real scalar, complementary modulus
%       a, b -- real scalars
%
%   Functions called:
%       cel2, el1
%
%   Matlab functions called:
%       abs, asinh, atan, isinf, isnan, pi, sqrt
%
%   Reference:
%   [1] R. Bulirsch -- Numerical calculation of elliptic integrals and
%           and elliptic functions, Numerische Mathematik 7,1965, pp 78-90
%

    % Check input
    
    if isnan(x) || isnan(kc) || isnan(a) || isnan(b)
        result = NaN;
        return
    end
    
    % Special cases 
    
    if x == 0 || (a == 0 && b == 0) || isinf(kc)
        result = 0;
        return
    end
    if isinf(a) || isinf(b)
        result = Inf;
        return
    end
    if isinf(x) % %|| abs(x) > 1e-16*max(1,1/abs(kc))
        result = sign(x)*cel2( kc, a, b);
        return
    end  
    if a == b
        if a == 0
            result = 0;
        else
            result = a*el1( x, kc);
        end
        return
    end
    if kc == 0  % calculated by Maple
        y = x*(a - b)/sqrt(1 + x*x);
        z = b*asinh(x);
        result = y + z;
        return
    end
    
    kc = abs(kc);
    
    if kc == 1 % calculated by Maple
        y = x*(a - b)/(1 + x*x);
        z = (a + b)*atan(x);
        result = (y + z)/2;
        return
    end
        
    % General case is translation of Algol procedure el2 from [1]). 
    %   CA = 10^(-D/2) where D is number of significant digits.
    
    CA = 0.5e-8;

    c = x*x;
    d = 1 + c;
    p = sqrt((1 + kc*kc*c)/d);
    d = x/d;
    c = d/(p*2);
    z = a - b;
    i = a;
    a = (a + b)/2;
    y = abs(1/x);
    f = 0;
    n = 0;
    m = 1;
    while true
        b = i*kc + b;
        e = m*kc;
        g = e/p;
        d = f*g + d;
        f = c;
        i = a;
        p = p + g;
        c = (d/p + c)/2;
        g = m;
        m = kc + m;
        a = (b/m + a)/2;
        y = -e/y + y;
        if y == 0
            y = sqrt(e)*2;
        end
        if abs(g - kc) <= CA*g
            break
        end
        kc = sqrt(e)*2;
        if isinf(kc) || kc == 0
            result = NaN;
            return
        end
        n = n + n;
        if y < 0
            n = n + 1;
        end
    end
    if y < 0
        n = n + 1;
    end
    e = (atan(m/y) + pi*n)*a/m;
    if x < 0
        e = -e;
    end
    result = e + c*z;

end

