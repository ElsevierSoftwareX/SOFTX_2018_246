function result = el1( x, kc )
%EL1 Evaluates the Bulirsch's elliptic integral of 1st kind
%
%                     x
%                    | |  
%                    |              dt
%       el1(x,kc) =  |  ------------------------------
%                    |  sqrt((1 + t^2)*(1 + kc^2*t^2)) 
%                  | | 
%                   0
%
%   Result:
%       el1(x,kc) -- real scalar or NaN if either argument is invalid or 
%           convergence failes.
%
%   Arguments:
%       x  -- real scalar
%       kc -- real scalar, complementary modulus
%
%   Functions called:
%       cel1
%
%   Matlab functions called:
%       abs, asinh, atan, isinf, isnan, pi, sqrt
%
%   Reference:
%   [1] R.Bulirsch, "Numerical calculation of elliptic integrals and 
%       elliptic functions", Numerische Mathematik 7, 1965, pp 78-90
%

    % Check input

    if isnan(x) || isnan(kc)
        result = NaN;
        return
    end

    % Special cases

    if isinf(kc) 
        result = 0;
        return
    end
    
    if isinf(x) %|| abs(x) > 1e-16*max(1,1/abs(kc))
        result = sign(x)*cel1(kc);
        return
    end
    
    if x == 0
        result = 0;
        return
    end
    
    if kc == 0
        result = asinh(x);
        return
    end
    
    kc = abs(kc);
        
    if kc == 1
        result = atan(x);
        return
    end

    % General case is translation on Algol procedure el1 from [1]. 
    %   CA = 10^(-D/2) and CB = 10^(-(D+2)) where D is number of 
    %   significant digits.

    CA = 0.5e-8; % by tests. 
    CB = 1e-19;   

    y  = abs(1/x);
    m  = 1;
    n  = 0;
    while true
        e = m*kc;
        g = m;
        m = m + kc;
        y = y - e/y;
        if y == 0
            y = sqrt(e)*CB;
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
    e = (atan(m/y) + pi*n)/m;
    if x < 0
        y = -e;
    else
        y = e;
    end
    
    result = y;

end
