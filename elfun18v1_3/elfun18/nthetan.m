function result = nthetan( u, q)
%NTHN Neville theta function N
    if isnan(u) || isnan(q) || q >= 1 || q < 0
        result = NaN;
        return
    end
    u = abs(u);
    k = ielnome(q);
    v = pi*u/2/elK(k);
    result = jtheta4(v,q)/theta4(q);
end