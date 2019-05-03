function result = nthetas( u, q)
%NTS Neville theta function S
    if isnan(u) || isnan(q) || q >= 1 || q < 0
        result = NaN;
        return
    end
    if u == 0
        result = 0;
        return
    end
    s = sign(u);
    u = abs(u);
    k = ielnome(q);
    v = pi*u/2/elK(k);
    result = 2*s*elK(k)*jtheta1(v,q)/theta1p(q)/pi;
end