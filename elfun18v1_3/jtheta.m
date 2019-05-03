function result = mjtheta(u,k)
%JTHETA Jacobian Theta function

    if isnan(u) || isnan(k) || abs(k) > 1
        result = NaN;
        return
    end
    
    v = pi*u/2/elK(k);
    q = elnome(k);
    result = jtheta4(v,q);
    
end