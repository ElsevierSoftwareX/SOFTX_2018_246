function f = theta3small(q)
%  theta3(0,q) for small q
%
%   From Amath
%

    t = q^2;
    p = q;
    f = 2*q;
    s = 1;
    while abs(f) >= eps*s
        s = s + f;
        p = p*t;
        f = f*p;
    end
    f = s;
    
end
