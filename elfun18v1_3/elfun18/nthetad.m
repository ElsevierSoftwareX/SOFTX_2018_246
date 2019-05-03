function result = nthetad( u, q)
%NTHD Neville theta function D
    if isnan(u) || isnan(q) || q >= 1 || q < 0
        result = NaN;
        return
    end
    u = abs(u);
    k = ielnome(q);
    v = pi*u/2/elK(k);
    result = jtheta3(v,q)/theta3(q);
end