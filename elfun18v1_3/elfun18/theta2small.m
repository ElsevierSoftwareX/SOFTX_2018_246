function f = theta2small(q)
%  theta2(0,q) for small q >= 0
%  From AMath

    s = 0;
    if q ~= 0
        t = q^2;
        p = 1;
        f = 2*sqrt(sqrt(q));
        while f >= eps*s
            s = s + f;
            p = p*t;
            f = f*p;
        end
    end
    f= s;
    
end

