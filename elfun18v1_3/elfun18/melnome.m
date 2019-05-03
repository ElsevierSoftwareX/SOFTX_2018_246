function result = melnome(m)
%MELNOME Compute the elliptic nome 
%
%       q(m) = exp(-pi*K'(m)/K(m))
%
%   Result:
%       q(m) -- real scalar or NaN if argument is invalid.
%
%   Arguments:
%       m    -- real scalar, parameter m <= 1
%
%   Functions called:
%       melCK, melK
%
%   Matlab functions called:
%       abs, exp, isinf, isnan, pi
%

    % Check input
    
    if isnan(m) || isinf(m) || m > 1
        result = NaN;
        return
    end

    % Special cases
    
    if m == 0
        result = 0;
        return
    end
    
    if m == 0.5
        result = exp(-pi);
        return
    end
    
    if m == 1
        result = 1;
        return
    end
    
    if abs(m) <= 0.01  % aerr = 7.3e-17
        result = (m/16)*(1 + m*(0.5 + m*(21/64 + ...
            m*(31/128 + m*(6257/32768 + m*(10293/65536 + ...
            m*279025/33554432))))));
       return
    end
       
    % General case
    
    if m > 0
        a = melCK(m)/melK(m);
    else
        a = melK(1/(1-m))/melK(m)/sqrt(1 - m);
    end
    
    result = sign(m)*exp(-pi*a);
    
end

