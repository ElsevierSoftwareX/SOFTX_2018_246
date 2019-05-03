function result = th2(q)
    q2 = q*q;
    q2n = 1;
    p = 1;
    while true
        q2n = q2n*q2;
        if 1 + q2n == 1
            break
        end
        p = p*((1  - q2n)*(1 + q2n))*(1 + q2n);
    end
    result = 2*sqrt(sqrt(q))*p;
end