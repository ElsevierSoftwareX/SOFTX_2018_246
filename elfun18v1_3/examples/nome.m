function result = nome(k)
    if k <= 0.5
        kp  = sqrt(1 - k^2);
        sqrtkp = sqrt(kp);
        e   = (1 - sqrtkp)/(2*(1 + sqrtkp));
        e4  = e*e*e*e;
        e5  = e4*e;
        e9  = e4*e5;
        e13 = e9*e4;
        q   = e + 2*e5 + 15*e9 + 150*e13;
        result = q;
    end
end