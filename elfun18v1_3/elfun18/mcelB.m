function result = mcelB( m)
%MCELB Evaluates the complete elliptic integral B.
%
%                1
%               | |  
%               |            (1 - t^2) dt
%       B(m) =  |  --------------------------- = (E(m) - (1 - m)*K(m))/m
%               |  sqrt((1 - t^2)*(1 - m*t^2)) 
%             | | 
%              0
%
%   Result:
%       B(m) -- real scalar or NaN if the argument is invalid or 
%               convergenece failed.
%
%   Arguments:
%       m    -- real scalar, parameter -inf<m<=1
%
%   Functions called:
%       rd, rf
%
%   Matlab functions called:
%       abs, isinf, isnan, log, pi
%
%   Reference:
%   [1] B.C.Carlson,"Computing Elliptic Integrals by Duplication", Numer. 
%       Math. 33, 1979, pp 1-16.
%

    % Check input

    if isnan(m) || m > 1
        result = NaN;
        return
    end

    % Special cases (Maple)

    if isinf(m) || m < -1e206
        result = 0;
        return
    end

    if abs(m) < 1e-16
        result = pi/4;
        return
    end

    if m == 1
        result = 1;
        return
    end

    if  m < -2.5e16 % rerr < 3.76e-17
        m = abs(m);
        result = (-m + log(16*m)*(1/8 + 1/2*m))/m^(3/2);
        return
    end

    if abs(m) < 1e-5 % aerr < 1.9e-17
        result = (pi/4)*(1 + m*(1/8 + 3*m/64));
        return
    end

    % General case (by definition using E and K from [1] Eq 4.5-4.6)

    result = rf( 0, 1 - m, 1) - rd(0, 1 - m, 1)/3;
  
end



