function result = th3(q)
    q2 = q*q;
    q2n = 1;
    p = 1;
    while true
        q2n = q2n*q2;
        if 1 + q2n == 1
            break
        end
        p = p*(1  - q2n)*(1 + q2n/q)^2;
    end
    result = p;
end