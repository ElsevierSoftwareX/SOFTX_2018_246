function result = melCK( m )
%MELCK  Evaluates the complementary complete elliptic integral of the 
%   1st kind 
%
%       K'(m) = K(m') 
%
%   Result:
%       melCK(m) -- real scalar or NaN if argument is invalid or 
%           convergence failes.
%
%   Arguments:
%       m    -- parameter, real scalar
%
%   Functions called:
%      NONE 
%
%   Matlab functions called:
%       abs, isinf, isnan, pi, sqrt
%
%   Reference:
%   [1] B.C.Carlson, "Elliptic Integrals" In: F.W.J.Olver et al., NIST
%       Handbook of Mathematical Functions, Chap.19, Cambridge, 2010.
%
    
    % Check input
    
    if isnan(m) || m < 0
        result = NaN;
        return
    end
    
    % Specila cases
    
    if isinf(m)
        result = 0;
        return
    end
    
    if m == 0
        result = inf;
        return
    end
    
    if m == 1
        result = pi/2;
        return
    end
    
    % General case
    
    result = rf(0, m, 1);
      
end


