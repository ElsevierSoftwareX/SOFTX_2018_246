function result = mpjzeta( phi, m)
%MPJZETA Evaluates the values of the Jacobi Zeta functions for the
%   amplitude phi and parameter m. phi and m are assumed
%   to be real scalars without check. If convergence failed then NaN is
%   returned.
%
%   Matlab functions called:
%       abs, cos, isinf, isnan, sign, sin, sqrt
%
%   Functions called:
%       NONE
%
%   References:
%   [1] R.Bulirsch, "Numerical Calculation of Elliptic Integrals and 
%       Elliptic Functions". Numerische Mathematik 7, 78-90, 1965.
%   [2] W.Ehrhardt, "The AMath and DMath Special functions", 2016

    % Check input
    
    if isnan(phi) || isinf(phi) || isnan(m) || isinf(m) || m > 1
        result = NaN;
        return
    end
    
    % Specila cases
    
    if phi == 0 || m == 0
        result = 0;
        return
    end
        
    if m == 1
        result = sin(phi);
        return
    end
           
    % The general case is based on formulas (1.2.3), (1.2.4a) from [1]. See
    % also [2] procedure jacobi_zeta.

    s   = sign(phi);
    phi = abs(phi);
    
    ERRTOL = 1e-10;
    
    mc  = 1 - m;
    a = sin(phi);
    b = cos(phi);
    p  = b*b + a*a*mc;
    t  = m*a*b;
    kc = sqrt(mc);
    e  = kc;      
    p  = sqrt(p);
    a  = 0;
    b  = 1;
    m  = 1;
    n  = 0;
    while true
        n = n + 1;
        f = a;
        a = b/p + a;
        g = e/p;
        b = 2*(f*g + b);
        p = g + p;
        g = m;
        m = kc + m;
        if isinf(m)
            result = NaN;
            return
        end        
        if abs(g - kc) <= ERRTOL*g
            break
        end
        kc = 2*sqrt(e);
        if kc == 0
            result = NaN;
            return
        end        
        e  = kc*m;
    end
    
    result = s*t*a*2^(-n);
    
end


