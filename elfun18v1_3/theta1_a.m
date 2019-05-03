function result = theta1_a(x,q)
    s2x = sin(2*x);
    c2x = cos(2*x);
    sx  = sin(x);
    cx  = cos(x);
    sn  = 0;
    cn  = 1;
    rn  = 1/q;
    pn  = 1;
    q2  = q^2;
    s   = 1;
    sum = 0;    
    while true
        pn = pn*q2;
        rn = rn*pn;
        an = rn*(sn*cx + cn*sx);
        if abs(an) < sum*eps
            break
        end
        sum = sum + s*an;
        s = -s;
        snn = sn*c2x + cn*s2x;
        cnn = cn*c2x - sn*s2x;
        sn = snn;
        cn = cnn;
    end
    result = 2*sqrt(sqrt(q))*sum;
end