function result = cel2( kc, a, b)
%CEL2 Evaluates the complete Bulirsch's elliptic integral of the 2nd kind
%
%            inf
%            | |  
%            |            (a + b*t^2) dt
%   cel2 =   |  ----------------------------------------
%            |  (1 + t^2)*sqrt((1 + t^2)*(1 + kc^2*t^2)) 
%          | | 
%           0
%
%   Result:
%       cel2(kc,a,b) -- real scalar or NaN if either argument is invalid or
%           convergence filed.
%
%   Arguments:
%       kc   -- real scalar, complementary modulus
%       a    -- real scalar
%       b    -- real scalar  
%
%   Functions called:
%       cel
%
%   Matlab functions called
%       abs, isinf, isnan, pi, sqrt
%
%   Reference--
%   [1] R. Bulirsch -- Numerical calculation of elliptic
%           integrals and elliptic functions, Numerische Mathematik 7,
%           1965, pp 78-90
%
  
    % Check input
    
    if isnan(kc) || isnan(a) || isnan(b)
        result = NaN;
        return
    end
    
    % Special cases
    
    if isinf(a) || isinf(b)
        if isinf(kc)
            result = NaN;
        else
            result = inf;
        end
        return
    end
    
    %if a == 1 && b == 1
    %  result = cel1(kc);
    %  return
    %end
    
    if isinf(kc) || (a== 0 && b == 0)
        result = 0;
        return
    end
       
    if kc == 0
        if b == 0
            result = a;
        else
            result = sign(b)*inf;
        end
        return
    end
    
    kc = abs(kc);
    
    if kc == 1
        result = 0.25*pi*(a + b);
        return
    end
       
    %if a*b < 0 
      %  result = cel( kc, 1, a, b);
      %  return
    %end
         
    % General case is translation of Algol procedure cel2 from [1]. 
    
    % D = 16;         % number of significant digits for a*b >= 0
    % CA = 10^(-D/2); % relative error    

    CA = 2e-10;  % by test    
    
    m = 1;
    c = a;
    a = a + b;
    while true
        b  = (b + c*kc)*2;
        c  = a;
        m0 = m;
        m  = m + kc;       
        a  = a + b/m;
        if abs(m0 - kc) <= CA*m0
            break
        end
        kc = sqrt(kc*m0)*2;
        if isinf(kc) || kc == 0
            result = NaN;
            return
        end             
    end

    result = (pi/4)*a/m;

end

