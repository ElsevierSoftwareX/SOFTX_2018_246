function result = mpelD( phi, m)
%MPELD Evaluates the Legendre elliptic integral D
%
%
%               phi
%               | |  
%               |        sin(t)^2 dt
%       D   =   |  ----------------------  = (F(phi,m) - E(phi,m))/m 
%               |  sqrt(1 - m*sin(t)^2) 
%             | | 
%              0
%
%   Result:
%       mpelD(phi,m) -- real scalar or NaN if either argument is invalid 
%           or convergenece failed.
%
%   Arguments:
%       phi -- real scalar, argument
%       m   -- real scalar,parameter 
%
%   Functions called:
%       celD, rd, umodpi
%
%   Matlab functions called:
%       abs, asin, cos, isinf, isnan, sign, sin, sqrt
%
%   References:
%   [1] B.C.Carlson,"Computing elliptic integrals by duplication", 
%       Num. Math. 33, 1979, pp 1-16.
%   [2] B.C.Carlson, "Elliptic Integrals" In: F.W.J.Olver et al., NIST
%       Handbook of Mathematical Functions, Sec.19.16(i), Cambridge, 2010.
%   [3] W.Ehrhardt, "The AMath and DMath Special functions", 2016

    
    % Check input
    
    if isnan(phi) || isinf(phi) || isnan(m) 
        result = NaN;
        return
    end
    
    % Special cases
       
    if isinf(m)
        result = 0;
        return
    end
    
    if phi == 0
        result= 0;
        return
    end
        
    if m > 1
        if abs(phi) > pi/2
            result = NaN;
            return
        end
        % [2] 19.7.4 Reciprocal-modulus transformation 
        k = sqrt(m);
        t = k*sin(phi);
        if abs(t) > 1 
            result = NaN;
            return
        end
        % [1], Eq 4.4
        c = (1 - t)*(1 + t); 
        x = t/k;
        t = rd( c, (1 - x)*(1 + x), 1);
        result = x*x*x*t/3;
        return
    end
    
    % General case is based on Pascal procedure ellint_d from AMath [3]
    
     s = sign(phi);
    [a, x] = umodpi(phi);

    if x == 0
        result = s*a*mcelD(m);
        return
    end
    
    if a ~= 0
        a = a*mcelD(m);
    end
    
    % [1], Eq 4.4
    w = sin(x);
    t = cos(x); 
    x = w*sqrt(m);
    x = rd( t*t, (1 - x)*(1 + x), 1);
    t = w*w*w*x/3;
    
    result = s*(a + t);
    
end

