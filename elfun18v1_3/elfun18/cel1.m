function result = cel1( kc )
%CEL1 Evaluates the complete Bulirsch's elliptic integral of the 1st kind
%  
%            inf
%            | |  
%            |               dt
%   cel1 =   |  ------------------------------
%            |  sqrt((1 + t^2)*(1 + kc^2*t^2)) 
%          | | 
%           0
%
%   Result:
%       cel1(kc) -- real scalar or NaN if the argument is invalid or
%           convergence failed.
%     
%   Arguments:
%       kc -- real scalar, complementary modulus
%
%   Matlab functions called:
%       abs, isinf, isnan, pi, sqrt
%
%   Reference:
%   [1] R. Bulirsch -- Numerical calculation of elliptic
%           integrals and elliptic functions, Numerische Mathematik 7,
%           1965, pp 78-90
%

    % Check input

    if isnan(kc)
        result = NaN;
        return
    end

    % Special cases

    if kc == 0
        result = Inf;
        return
    end
    if isinf(kc)
        result = 0;
        return
    end
    kc = abs(kc);
    if kc == 1
        result = pi/2;
        return
    end

    % General case is translation of Algol procedure cel1 from [1]. 

    % D = 16;         % number of significant digits 
    % CA = 10^(-D/2); % relative error    

    CA = 2e-10;  

    m = 1;
    while true
        h = m;
        m = kc + m;
        if abs(h - kc) <= CA*h
            break
        end
        kc = sqrt(h*kc);
        if isinf(kc) || kc == 0
            result = NaN;
            return
        end
        m  = m/2;
    end

    result = pi/m;

end

