function result = cel3( kc, p )
%CEL3 Evaluates the complete Bulirsch's elliptic integral of the 3rd kind.
%
%            inf
%            | |  
%            |            (1 + t^2) dt
%   cel3 =   |  ------------------------------------------
%            |  (1 + p*t^2)*sqrt((1 + t^2)*(1 + kc^2*t^2)) 
%          | | 
%           0
%
%   Result:
%       cel3(kc,p) -- real scalar or NaN if either argument is invalid. 
%           If p < 0 the result is Cauchy principal value.
%
%   Arguments:
%       kc   -- real scalar, complementary modulus 
%       p    -- real scalar   
%
%   Functions called:
%       NONE
%
%   Matlab functions called:
%       abs, isinf, isnan, pi, sqrt
%
%   References:
%   [1] R. Bulirsch -- Numerical calculation of elliptic
%           integrals and elliptic functions. II, Numerische Mathematik 7,
%           1965, pp 353-354
%

    % Check input
    
    if isnan(kc) || isnan(p) 
        result = NaN;
        return
    end
    
   
    % Special cases
    
    if isinf(kc) || isinf(p)
        result = 0;
        return
    end
    
    if p == 0 
        result = NaN; 
        return
    end
    
    if kc == 0 
        result = inf;
        return
    end
    
    %if p == 1
    %    result = cel1(kc);
    %    return
    %end
    
    kc = abs(kc);
    
    if kc == 1 && p >= 0
        result = pi/(2*sqrt(p)); % calculated by Maple
        return
    end
        
    % General case is translation of Algol procedure cel3 from [1].
    
    % D = 16;         % number of significant digits for a*b >= 0
    % CA = 10^(-D/2); % relative error    

    CA = 0.5e-8;
 
    e  = kc;
    m0 = 1;
    if p > 0
        c = 1;
        p = sqrt(p);
        d = 1/p;
    else
        g = 1 - p;
        f = kc*kc - p;
        p = sqrt(f/g);
        m = (1 - kc)*(1 + kc);
        d = - m/(g*p);
        c = 0;
    end
    
    while true
        f = c;
        c = d/p + c;
        g = e/p;
        d = (d + f*g)*2;
        p = g + p;
        g = m0;
        m0 = kc + m0;
        if abs(g - kc) <= CA*g
            break
        end
        kc = sqrt(e)*2;
        if isinf(kc) || kc == 0
            result = NaN;
            return
        end             
        e = kc*m0;
    end
    
    result = (pi/2)*(c*m0 + d)/(m0*(m0 + p));

end

