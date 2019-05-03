function result = mijam( x, m)
%MIJAM inverse of the Jacobi amplitude function AM.
%
%       invam(x,m) = F(sin(x),m)
%
%   Result:
%       mijam(x,m) -- real scalar or NaN if either argument is invalid 
%           or convergenece failed.
%
%   Arguments:
%       x    -- real scalar 
%       m    -- real scalar, parameter (m = k^2)
%
%   Functions called:
%       melK, melF, umodpi
%
%   Matlab functions called:
%       abs, isnan, isinf, sin
%

    result = mpelF(x,m);
    return
    
    % check input
    
    if isnan(x) || isinf(x) || isnan(m) || isinf(m)
        result = NaN;
        return
    end
    
    % Special cases
    
    if m == 0
        result = x;
        return
    end
    
    if m == 1
        result = igd(x);
        return
    end
    
    % General case
    
    if m > 1
       % if abs(x) > pi/2
       %     result = NaN;
       %     return
       % end
       % result = mijsd(sqrt(m)*tan(x),1/m)/sqrt(m);
       % return
        
        % Reciprocal-modulus transformation ([1], 22.17)
        k = sqrt(m);
        if abs(k*sin(x)) > 1 || abs(x) > pi/2
            result = NaN;
            return
        end
        % based on [1] 22.16.12        
        result = melF(k*sin(x),1/m)/k;
        return
    end    
    
    s = sign(x);
    [a, x] = umodpi(x);
    
    if x == 0 
        result = s*a*melK(m);
        return
    end
    
    if  a ~= 0
        a = a*melK(m);
    end
  
    result = s*(a + melF( sin(x), m));
    
    %pi2 = pi/2;
    %K   = melK(m);
    %n   = floor(x/pi2);
    %r   = x - n*pi2;
    %if mod(n,2) == 0
    %    result = n*K + melF( sin(r), m);
    %else
    %    result = (n + 1)*K - melF( sin(pi2 - r), m);
    %end

end
