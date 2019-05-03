function result = nthetac( u, q)
%NTHC Neville theta function C
    if isnan(u) || isnan(q) || q > 1 || q < 0
        result = NaN;
        return
    end
    u = abs(u);
    k = ielnome(q);
    v = pi*u/2/elK(k);
    result = jtheta2(v,q)/theta2(q);
end