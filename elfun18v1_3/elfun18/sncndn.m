function [ sn, cn, dn ] = sncndn( x, mc )
%SNCNDN Evaluates the values of the Jacobi elliptic functions sn,cn,dn for 
%   argument x and complementary parameter mc. x and mc are assumed
%   to be real scalars without check. If eather argument is invalid or if
%   convergence failed then NaN is returned.
%
%   Matlab functions called:
%       abs, cos, cosh, isinf, isnan, sin, sqrt, tanh
%
%   References:
%   [1] W.P.Reinhardt,P.L.Walker, "Jacobian Elliptic Functions" In: 
%       F.W.J.Olver et al., NIST Handbook of Mathematical Functions, 
%       Cambridge, 2010.
%   [2] R.Bulirsch, "Numerical Calculation of Elliptic Integrals and 
%       Elliptic Functions". Numerische Mathematik 7, 78-90, 1965.
%
    
    % Check input
    
    if isnan(x) || isinf(x) || isnan(mc) || isinf(mc)
        sn = NaN;
        cn = NaN;
        dn = NaN;
        return
    end

    % Specila cases
    
    % [1], Table 22.5.1
    if x == 0
        sn = 0;
        cn = 1;
        dn = 1;
        return
    end
    
    % [1], Table 22.5.3
    if mc == 1 % m == 0
        sn = sin(x);
        cn = cos(x);
        dn = 1;
        return
    end
    
    % [1], Table 22.5.4
    if mc == 0  % m == 1
        sn = tanh(x);
        cn = 1/cosh(x);
        dn = cn;
        return
    end
    
    % General case is based on Algol procedure sncndn from [2]. 
    % CA = 10^(-D/2), for |x|<= K the rerr is of order 10^(-D), D is
    % number of valid figures.

    CA = 0.5e-8;  % by tests
    NA = 14; 
    
    m  = zeros(NA,1);
    n  = zeros(NA,1);
    
    bo = mc < 0;
    if bo  
        d  = 1 - mc;
        mc = -mc/d;
        d  = sqrt(d);
        x  = d*x;
    end
   
    a  = 1;
    dn = 1;
    j  = 0;
    for i = 1:NA
        m(i) = a;
        mc   = sqrt(mc);
        n(i) = mc;
        c    = 0.5*(a + mc);
        if abs(a - mc) <= CA*a
            j = i;
            break
        end
        mc = a*mc;
        a  = c;
    end
    if j == 0
        sn = NaN;
        cn = NaN;
        dn = NaN;
        return
    end
    
    x  = c*x;
    sn = sin(x);
    cn = cos(x);
    if sn ~= 0
        a = cn/sn;
        c = a*c;
        for i = j:-1:1
            b  = m(i);
            a  = c*a;
            c  = dn*c;
            dn = (n(i) + a)/(b + a);
            a  = c/b;
        end
        a = 1/sqrt(c*c + 1);
        if sn < 0
            sn = -a;
        else
            sn = a;
        end
        cn = c*sn;
    end
    
    if bo
        a  = dn;
        dn = cn;
        cn = a;
        sn = sn/d;
    end
    
end
