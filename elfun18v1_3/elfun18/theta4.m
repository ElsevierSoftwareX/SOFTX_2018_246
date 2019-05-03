function f = theta4(q)
%THETA4 Jacobi theta4(0,q)

    if isnan(q) || isinf(q) || abs(q) >= 1
        f = NaN;
        return
    end

    if q <0
        f = theta3(-q);
    elseif q <0.1
        f = theta3small(-q);
    else
        z = log(q);
        if q >= 0.7
            s = 2*exp(0.25*pi^2/z);
        else
            s = exp(pi^2/z);
            s = theta2small(s);
        end
        f = s*sqrt(-pi/z);
    end
    
end

