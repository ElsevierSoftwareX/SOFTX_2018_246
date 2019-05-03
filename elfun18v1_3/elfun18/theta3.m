function f = theta3(q)
% theta3(0,q)

    if isnan(q) || isinf(q) || abs(q) >= 1
        f = NaN;
        return
    end

    if q < 0
        f = theta4(-q);
    elseif q < 0.1
        f = theta3small(q);
    else
        z = log(q);
        s = exp(pi^2/z);
        s = theta3small(s);
        f = s*sqrt(-pi/z);
    end
    
end
