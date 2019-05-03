function result = mjzeta( x, m)
%MJZETA Evaluates the values of the Jacobi elliptic Zeta functions for 
%   argument x and parameter -inf < m <= 1. x and m are assumed
%   to be real scalars without check. If convergence failed then NaN is
%   returned.
%
%   Matlab functions called:
%       abs, isinf, isnan, sqrt
%
%   Functions called:
%       sndncn
%
%   References:
%   [1] W.P.Reinhardt,P.L.Walker, "Jacobian Elliptic Functions" In: 
%       F.W.J.Olver et al., NIST Handbook of Mathematical Functions, 
%       Cambridge, 2010.
%   [2] R.Bulirsch, "Numerical Calculation of Elliptic Integrals and 
%       Elliptic Functions". Numerische Mathematik 7, 78-90, 1965.
%

    % Check input
    
    if isnan(x) || isinf(x) || isnan(m) || isinf(m) || m > 1
        result = NaN;
        return
    end
    
    % Specila cases
    
    if x == 0 || m == 0
        result = 0;
        return
    end
    
    if m == 1
        result = tanh(x);
        return
    end
           
    % The general case is based on the Algol procedure
    % cel and the formulas (1.2.3), (1.2.4a) from Bulirsch [11].

    ERRTOL = 1e-10;
    
    mc  = 1 - m;
    [a, b, ~] = sncndn( x, mc); % change sin/cos to sn/cn
    if isnan(a)
        result = NaN;
        return
    end
    p  = b*b + a*a*mc;
    t  = m*a*b;
    kc = sqrt(mc);
    e  = kc;      
    p  = sqrt(p);
    a  = 0;
    b  = 1;
    m  = 1;
    i  = 0;
    while true
        i = i + 1;
        f = a;
        a = b/p + a;
        g = e/p;
        b = 2*(f*g + b);
        p = g + p;
        g = m;
        m = kc + m;
        if abs(g - kc) <= ERRTOL*g
            break
        end
        kc = 2*sqrt(e);
        e  = kc*m;
    end
    
    result = t*a*2^(-i);
    
end


