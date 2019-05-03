function result = jtheta0( n, x, q)
%JTHETA0 Calculate Jacobi theta(n,x,q) for n=1..4 and 0 <= q < 1.
%
%   Translation of Pascal procedures jacobi_theta from AMath [1].
%
%   References:
%   [1] W.Ehrhardt, "The AMath and DMath Special functions", 2016
%   [2] J.D. Fenton, R.S. Gardiner-Garden, "Rapidly-convergent methods for
%   evaluating elliptic integrals and theta elliptic functions", J.
%   Austral. Math. Soc B 24, 1984, pp 47-58

    % Check input
    
    if n < 1 || n > 4 || isnan(x) || isinf(x) || isnan(q) || isinf(q) 
        result = NaN;
        return
    end
    
    if q < 0 || q >= 1
        result = NaN;
        return
    end

    % Calculation
    
    if q <= 0.25
        result = theta_fs( n, x, q);
    else
        result = theta_ts( n, x, q);
    end
    
end

%%-------------------------------------------------------------------------

function result = theta_fs( n, x, q)
%THETA_FS Return theta_n(x,q) via Fourier series, |q| should be < about 0.25

    TOL = eps;
    
    s2 = sin(2*x);
    c2 = cos(2*x);
    if n == 1 || n == 2
        s  = 0;
        fk = 2*sqrt(sqrt(q));
        if n == 1
            qk = -1;
        else
            qk = 1;
        end
        sk = sin(x);
        ck = cos(x);
    else
        % n=3 or n=4
        s  = 1;
        fk = 2*q;
        qk = q;
        if n ~= 3
            fk = -fk;
            qk = -qk;
        end
        ck = c2;
        sk = s2;
    end
    q2 = q^2;
    while abs(fk) > TOL*abs(s)
        if n==1
            s = s + fk*sk;
        else
            s = s + fk*ck;
        end
        %Use addition theorems for sin/cos to get sin/cos((2k+1)*x)
        t  = ck*c2 - sk*s2;
        sk = sk*c2 + ck*s2;
        ck = t;
        qk = qk*q2;
        fk = fk*qk;
    end
    result = s;
end

%-------------------------------------------------------------------------

function result = theta_ts(n, x, q)
%THETA_TS Return theta_n(x,q) via transformed series, q should be > ~ 0.25

PiSqr = pi*pi;

    j = floor((0.5*x)/(pi/2));
    j = floor(x/pi);
    w = 0.5*x - j*pi/2;

    x = 2*w;
    if n ==1 && x==0
        result = 0;
        return
    end

    p = log(q);
    w = pi*abs(x/p);
    if w >= log(realmax) %ln_MaxDbl then begin
        %Hack: exp(w) will overflow, q is very close to 1. Set result=0 is OK for}
        %most (x,q) but not for theta_1((2k+1)*Pi/2,1) or theta_2((k*Pi,1), where}
        %the results are undefined. n=2, x=k*Pi should not arrive here for q < 1.}
        if n ~= 1 || abs(x) ~= pi/2
            result = 0;
            return
        end
        %exp(w) will overflow}
    end

    y = PiSqr/p;
    n = mod(n,4); % && 3 %????
    if n == 0
        % theta_4
        if w > 19
            %Here cosh(k*z) = 0.5*exp(k*z). This is very handy because separately}
            %the cosh term(s) may overflow and/or the exp term(s) may underflow! }
            s  = exp(w);
            t1 = exp(2*y + 3*w);
            t2 = exp(6*y + 5*w);
            s  = 0.5*((t2 + t1) + s);
        else
            s  = cosh(w);
            t1 = exp(2*y)*cosh(3*w);
            t2 = exp(6*y)*cosh(5*w);
            s  = (t2 + t1) + s;
        end
        y = x^2 + (pi/2)^2;
        y = 2*exp(y/p);
    elseif n == 1
        %theta_1(x+j*Pi,q) = (-1)^j*theta_1(x,q), theta_1(-x,q) = -theta_1(x,q)}
        %Combine multiples of Pi from reduction and sign change for odd function}
        if mod(j,2) == 1 %odd(j)
            j = -sign(x);
        else
            j =  sign(x);
        end
        if w > 19.0
            %here sinh(k*z) = 0.5*exp(k*z)}
            s  =  exp(w);
            t1 = -exp(2*y + 3*w);
            t2 =  exp(6*y + 5*w);
            s  =  0.5*((t2 + t1) + s);
        else
            s  =  sinh(w);
            t1 = -exp(2*y)*sinh(3*w);
            t2 =  exp(6*y)*sinh(5*w);
            s  =  (t2 + t1)+s;
        end
        y = x^2 + (pi/2)^2;
        y = 2*j*exp(y/p);
    else
        %n=2 or n=3}
        if w > 19
            %here cosh(k*z) = 0.5*exp(k*z)}
            t1 = 0.5*exp(y + 2*w);
            t2 = 0.5*exp(4*y + 4*w);
        else
            t1 = exp(y)*cosh(2*w);
            t2 = exp(4*y)*cosh(4*w);
        end
        y = exp(x^2/p);
        if n == 2
            s = 1 + 2*(t2 - t1);
            %theta_2(x+j*Pi,q) = (-1)^j*theta_2(x,q)}
            if mod(j,2) == 1
                s = -s;
            end
        else
            s = 1 + 2*(t2 + t1);
        end
    end
    
    result = sqrt(-pi/p)*s*y;
    
end

