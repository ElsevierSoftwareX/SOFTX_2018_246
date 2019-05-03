path = 'C:\Program Files\MATLAB\R2018a\toolbox\symbolic\symbolic';
addpath(path)
k = 0.4;
ellipticK(k^2)
K(k)
ellipticK(0.81)
K(0.9)
% random input
nrun = 100;
er = zeros(nrun,1);
k  = zeros(size(er));
for n = 1:nrun
    k(n) = rand();
    m = k(n)^2;
    er(n) = ellipticK(m) - mK(m);
end
fprintf('MAE = %g\n',mean(er))

tic
for n = 1:nrun
    K(k(n));
end
toc
tic
for n = 1:nrun
    elK(k(n));
end
toc
tic
for n = 1:nrun
    K(k(n));
end
toc

function result = K(k)

    if isnan(k)
        result = NaN;
        return
    end

    k = abs(k);
    if k > 1
        result = NaN;
        return
    end

    if k == 1
        result = inf;
        return
    end

    if k <= 0.5
        kp  = sqrt(1 - k^2);
        sqrtkp = sqrt(kp);
        e   = (1 - sqrtkp)/(2*(1 + sqrtkp));
        e4  = e*e*e*e;
        e5  = e4*e;
        e9  = e4*e5;
        e13 = e9*e4;
        q   = e + 2*e5 + 15*e9 + 150*e13;
        q4  = q*q*q*q;
        q9  = q4*q4*q;
        result = pi/2*(1 + 2*(q + q4 + q9))^2;
    else
        sqrtk = sqrt(k);
        e   = (1 - sqrtk)/(2*(1 + sqrtk));
        e4  = e*e*e*e;
        e5  = e4*e;
        e9  = e4*e5;
        e13 = e9*e4;
        q1  = e + 2*e5 + 15*e9 + 150*e13;
        q14 = q1*q1*q1*q1;
        q19 = q14*q14*q1;
        Kp  = pi/2*(1 + 2*(q1 + q14 + q19))^2;
        result = - Kp*log(q1)/pi;
    end
    
end

function result = mK(m)

    if isnan(m)
        result = NaN;
        return
    end

    if m > 1
        result = NaN;
        return
    end

    if m == 1
        result = inf;
        return
    end

    if m <= 0.25
        kp  = sqrt(1 - m);
        sqrtkp = sqrt(kp);
        e   = (1 - sqrtkp)/(2*(1 + sqrtkp));
        e4  = e*e*e*e;
        e5  = e4*e;
        e9  = e4*e5;
        e13 = e9*e4;
        q   = e + 2*e5 + 15*e9 + 150*e13;
        q4  = q*q*q*q;
        q9  = q4*q4*q;
        result = pi/2*(1 + 2*(q + q4 + q9))^2;
    else
        e   = (1 - m)/(2*(1 + m));
        e4  = e*e*e*e;
        e5  = e4*e;
        e9  = e4*e5;
        e13 = e9*e4;
        q1  = e + 2*e5 + 15*e9 + 150*e13;
        q14 = q1*q1*q1*q1;
        q19 = q14*q14*q1;
        Kp  = pi/2*(1 + 2*(q1 + q14 + q19))^2;
        result = - Kp*log(q1)/pi;
    end
    
end

function result = nome(k)
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




