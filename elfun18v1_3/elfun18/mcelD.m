function result = mcelD( m)
%MCELD Evaluates the complete elliptic integral D.
%
%                  1
%                 | |  
%                 |            t^2 dt
%         D(m) =  |  ---------------------------- = (K - E)/m
%                 |  sqrt((1 - t^2)*(1 - m*t^2)) 
%               | | 
%                0
%
%   Result:
%       D(m) -- real scalar or NaN if argument is invalid or convergenece
%               failed.
%
%   Arguments:
%       m    -- real scalar, parameter, m <= 1
%
%   Functions called:
%       rd
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
    
    if m == 0
        result = pi/4;
        return
    end
          
    if m == 1
        result = inf;
        return
    end 
    
    if m > 0.999999 
        % for m = 1 - 1e-6  the result given by series and rd is correct to
        %   11 digits 
        % for m = 1 - 1e-9  the result is correct to 8 digits; Maple
        %   aerr < 7.36e-18 
        % for m = 1 - 1e-16 the result is correct to 3 digits
        a = 0.386294361119890618834;    % = 2*log(2)-1
        b = 0.39720770839917964126e-1;  % = 3*log(2)*(1/2)-1
        m1 = 1 - m;
        result = a + b*m1 - (4 + 3*m1)*log(m1)/8;
        return
    end
    
    if abs(m) < 5e-6 % aerr < 1.67e-17
        result = (pi/4)*(1 + m*(3 + (15*m)/8)/8);
        return
    end
    
    if m < -5e6 % rerr < 2.68e-17
        m = abs(m);
        result = (4*m + 1 - log(16*m))/(4*m*sqrt(m));
        return
    end
    
    % General case (by definition using E and K from [1] Eq 4.5-4.6)
    % for m <= 0.998 the result is correct to 16 digits 
    
    result = rd( 0, 1 - m, 1)/3;

end



