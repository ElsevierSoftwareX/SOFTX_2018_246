function result = mielnome(q)
%MIELMODULUS Evaluate the elliptic parameter m(q)
%
%  Nonefficient function !!!
%

    % Check input
    
    if isnan(q) || isinf(q) || q < -1 || q > 1
        result = NaN;
        return
    end

    % Special cases
    
    if q == 0
        result = 0;
        return
    end
    
    if q < 0.75e-4
        s = 1 + q*(-4 + q*(14 - 40*q));
        result = 16*q*s^2;
        return
    end
           
    if q > 0.78 
        result = 1; % err <= 4.5e-17
        return
    end
    
    % General case (numerical solution)
    
    try
        if q > 0
            result = fzero(@fun,[0.7e-4,1]);
        else
            result = fzero(@fun,[-1e153,0]);
        end
    catch
        result = NaN;
    end
    return
    
    function err = fun(m)
        err = q - melnome(m);
    end

end


