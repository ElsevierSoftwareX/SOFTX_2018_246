function result = elmodulus(q)
%ELMODULUS Evaluate the elliptic modulus k(q)

    % Check input
    
    if isnan(q) || isinf(q) || (q < 0 || q > 1)
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
        result = (4*sqrt(q))*s;
        return
    end
           
    if q > 0.78 
        result = 1; % err <= 4.5e-17
        return
    end
    
    % General case (numerical solution)
    
    try
        result = fzero(@fun,[0.7e-4,1]);
    catch
        result = NaN;
    end
    return
    
    function err = fun(k)
        err = q - elnome(k);
    end
end


