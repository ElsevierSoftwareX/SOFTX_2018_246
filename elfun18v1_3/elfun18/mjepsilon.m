function result = mjepsilon( x, m)
%MJEPSILON Compute value of the Jacobi's second form of the elliptic integral 
%   of 2nd kind for argument x and parameter m. Returns NaN if any of
%   the arguments is invalid. It is assumed that arguments are real scalars
%   without check.
%
%   Functions called:
%      melE, melK, mjeps, msn, mjzeta
%
%   Matlab functions called:
%       isinf, isnan, sqrt, tanh

    % Check input
    
    if isnan(x) || isinf(x) || isnan(m)
        result = NaN;
        return
    end
      
    % Special cases ------------------------------------------------------

    if isinf(m) 
        if m < 0
            result = sign(x)*inf;
        else
            result = 0;
        end
        return
    end
    
    if m == 0
        result = x;
        return
    end
    
    if m == 1
       result = tanh(x);
       return
    end
    
    % General case -------------------------------------------------------
    
    if m > 1
        k = sqrt(m);
        K = melK(1/m)/k;
        if abs(x) > K
            %result = NaN;
            %return
        end
        result = k*mjepsilon(k*x,1/m) + (1 - m)*x;
        return
    end   
    
    s = sign(x);
    x = abs(x);   
        
    % General case ([1] Eq. 3.7.9)
       
    K = melK(m);
    n = fix(x/K);
    t = x - n*K;
    if mod(n,2) == 0
        result = n*mcelE(m) + melE(mjsn(t,m),m);
    else
        result = (n + 1)*mcelE(m) - melE(mjsn(K - t,m),m);
    end
    
    result = s*result;
    return
    
    
    if m < 0
        m1 =  1/(1 - m);
        mu = -m/(1 - m);
        E  = melE(mu);
        K  = m1*melK(mu);
    else
        K = melK(m);
        E = melE(m);
    end

    Z = mjzeta( x, m);
    result = E*x/K  + Z;
    
end


