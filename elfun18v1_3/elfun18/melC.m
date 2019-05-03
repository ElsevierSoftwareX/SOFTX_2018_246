function result = melC( m)
%MCELC Evaluates the complete elliptic integral C.
%
%                  1
%                 | |  
%                 |            t^2*(1 - t^2) dt
%       C(m)   =  |  --------------------------- = ((2 - m)*K - 2*E)/m^2
%                 |  sqrt((1 - t^2)*(1 - m*t^2)) 
%               | | 
%                0
%
%   Result:
%       C(m) -- real scalar or NaN if argument is invalid 
%           or convergenece failed.
%
%   Arguments:
%       m    -- real scalar, parameter (m = k^2)
%
%   Functions called:
%       rd, rf
%
%   Matlab functions called:
%       abs, isinf, isnan, log, pi, sqrt
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

    if isinf(m) || m < -1e123
        result = 0;
        return
    end
    
    if abs(m) < 1e-16
        result = pi/16;
        return
    end
    
    if m == 1
        result = inf;
        return
    end
    
    if m > 0.999999999 %= 1 - 1e-9, aerr < 3.60e-17
        % result is correct to 10 digits for m=1-1e-10, and 3 digit for
        % m=1-1e-16
        a = -0.613705638880109381166; % = 2*log(2)-2
        b = -0.63083768748024610762;  % = (9*log(2)*(1/2)-15/4)
        result = (-13 + 9*m)*log(1 - m)/8 + a + b*(1 - m);
        return
    end
    
    if abs(m) < 5e-6 % aerr < 1.17e-17
        result = (pi/16)*(1 + m*(3/4 + 75/128*m));
        return
    end
    
    if  m < -1e12  % rerr < 2.64e-19
        m = abs(m);
        result = ((4*m + 3)*log(16*m) - 2*(8*m + 1))/(8*m*m*sqrt(m)); 
        return
    end

    % General case (by definition using E and K from [1] Eq 4.5-4.6)
    % result is correct to 16 digits for m <= 0.993
    
    result = (2*rd( 0, 1 - m, 1)/3 - rf(0, 1 - m, 1))/m;
   
   
end



