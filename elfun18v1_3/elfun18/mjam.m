function  result = mjam( x, m )
%MJAM Jacobi amplitude function am ([1] 22.16.1)
%
%                    x
%                   | |          
%       am(x,m) =   |  dn(t,m) dt  
%                 | | 
%                  0
%   Result:
%       mjam(x,k) -- real scalar or NaN if either argument is invalid or
%           convergence failed.
%
%   Arguments: 
%       x   -- real scalar
%       m   -- parameter, real scalar 
%
%   Functions called:
%       gd, melK, sndncn 
%
%   Matlab functions called:
%       abs, atan2, floor, isinf, isnan
%
%   References:
%   [1] W.P.Reinhardt,P.L.Walker, "Jacobian Elliptic Functions" In: 
%       F.W.J.Olver et al., NIST Handbook of Mathematical Functions, 
%       Cambridge, 2010.
%   [2] R.Bulirsch, "Numerical Calculation of Elliptic Integrals and 
%       Elliptic Functions". Numerische Mathematik 7, 78-90, 1965.
%

    % Check input
    if isnan(x) || isnan(m) || isinf(x) || isinf(m)
        result = NaN;
        return
    end

    % Special values
    
    if m == 0
        result = x; % [1] 22.16.4
        return
    end
   
    if m == 1
        result = gd(x); % [1] 22.16.5
        return
    end

    if m > 1
        % Periodic
        [ sn, cn, ~] = sncndn( x,1 - m);
        result = atan2(sn,cn);
        return
    end
    
    % Quasi-periodic ([1] 22.16.2)
    s = sign(x);
    x = abs(x);
    if x < pi/2
        a = 0;
    else
        a = 2*melK(m);
        t = floor(x/a + 0.5);
        x = x - t*a; 
        a = t*pi;
    end

    [ sn, cn, ~] = sncndn( x, 1 - m);
    t = atan2(sn,cn);
    result = s*(a + t);
    
end


