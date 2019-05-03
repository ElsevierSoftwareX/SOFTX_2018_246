function result = jeta(u,k)
%JETA Jacobian Eta function

    if isnan(u) || isnan(k) || abs(k) > 1
        result = NaN;
        return
    end
    v = pi*u/2/elK(k);
    q = elnome(k);
    result = jtheta1(v,q);
end