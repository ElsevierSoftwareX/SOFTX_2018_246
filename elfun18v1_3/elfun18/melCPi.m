function result = melCPi( nu, m)
%MCELCPI Evaluates complementary complete elliptic integrals of the 3th kind
%
%     Pi'(n,m) = Pi(n,m') 
%
%   Result:
%       mcelCPi(n,m) -- real scalar or NaN if either argument is invalid 
%           or convergenece failed.
%
%   Arguments:
%       m    -- parameter, real scalar > 0
%       n    -- real scalar, characteristic < 1
%
%   Functions called:
%       rf
%
%   Matlab functions called:
%       abs, asin, atanh, isinf, isnan, log, sqrt
%
%   Reference:
%   [1] B.C.Carlson,"Numerical computation of real or complex elliptic 
%       integrals", Numerical Algorithms 10, 1995, pp 13-26.
%   [2] B.C.Carlson, "Elliptic Integrals" In: F.W.J.Olver et al., NIST 
%       Handbook of Mathematical Functions, Cambridge, 2010.
%

    % Check input
    
    if isnan(m) || isnan(nu) || m < 0 || nu > 1
        result = NaN;
        return
    end
        
    % Special cases 
    
    if isinf(m) || isinf(nu)
        result = 0;
        return
    end
    
    if m == 0 || nu == 1
        result = inf;
        return
    end
    
    if m == 1
        if nu == 0
            result = pi/2; % [2] 19.6.11 (2)        
        else
            result = pi/(2*sqrt(1 - nu));
        end
        return
    end
    
    if nu == 0
        result = melCK(m);
        return
    end
       
    % General case ( [1] Eq 4.7, n -> -n !!!!)
    
    result = rf(0, m, 1) + nu*rj( 0, m, 1, 1 - nu)/3;
    
    
end

