function result = theta1p(q)
%THETA1P Derivative of  theta1 at x=0
%
%   Translation from AMath
%

    if isnan(q) || isinf(q) || q < 0 || q >= 1
        result = NaN;
        return
    end

    if q <= 0.1
        result = theta1psmall(q);
    else
        z = log(q);
        if q >= 0.7
            s = 2*exp(0.25*pi^2/z);
        else
            s = exp(pi^2/z);
            s = theta1psmall(s);
        end
        z = abs(pi/z);
        result = s*z*sqrt(z);
    end
    
end

function f = theta1psmall(q)
    s = 0;
    if q ~= 0
        t = q^2;
        p = -1;
        f = 2*sqrt(sqrt(q));
        r = f;
        n = 1;
        while abs(r) >= eps*abs(s)
            n = n + 2;
            s = s + r;
            p = p*t;
            f = f*p;
            r = f*n;
        end
    end
    f = s;
end

