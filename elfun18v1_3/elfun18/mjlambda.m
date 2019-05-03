function result = mjlambda( x, nu, m)
%MJLAMBDA Elliptic Lambda function (Jacobi's 2nd form of elliptic integral
% of the 3rd kind)
%
%                            x
%                           | |  
%                           |        dt
%       Lambda(x,nu,m)  =   |  ---------------
%                           |  1 - nu*sn(t,m)^2
%                         | | 
%                          0
%   Result:
%       mjlambda(x,k) -- real scalar or NaN if either argument is invalid 
%           or convergence failed.
%
%   Arguments: 
%       x   -- real scalar 
%       nu  -- real scalar, characteristics 
%       m   -- real scalar, parameter 
%
%   Functions called:
%       melK, melPi, mjsn 
%
%   Matlab functions called:
%       abs, floor, isinf, isnan, mod
%
%   References:
%   [1] Lawden, D.F., 1989. Elliptic functions and applications. 
%       Springer-Verlag, New York.
%
   
    % Check input
    
    if isnan(x) || isinf(x)  || isnan(nu) || ...
            isnan(m) || isinf(m) 
        result = NaN;
        return
    end
       
    % Special cases
    
    if isinf(nu)
        result = 0; % ?? nu < 0
        return
    end
    
    if x == 0
        result = 0;
        return
    end

    if nu == 0 
        result = x;
        return
    end
       
    if nu == 1 && m == 0
      if abs(x) <= pi/2
            result = tan(x);
       else
            result = NaN;
       end
       return
    end

    
    if m == 1
        if nu == 1
            result = x/2 + sinh(2*x)/4;
        elseif nu > 0
            if nu < 1 || (nu > 1 && abs(x) < atanh(1/sqrt(nu)))
                result = (x - sqrt(nu)*atanh(sqrt(nu)*tanh(x)))/(1-nu);
            else
                result = NaN;
            end
        else
            result = (x + sqrt(-nu)*atan(sqrt(-nu)*tanh(x)))/(1-nu);
        end
        return
    end

    %{
    if m == 0
        if nu < 1
            result = atan(sqrt(1 - nu)*tan(x))/sqrt(1 - nu);
        else
            if abs(x) <= atan(1/sqrt(nu - 1))
            result = atanh(sqrt(nu - 1)*tan(x))/sqrt(nu - 1);    
            else
                result = NaN;
            end
        end
        return
    end
    %}

    if m > 1   
        K = melK(1/m)/sqrt(m);
        if abs(x) < K
            result = mjlambda(x*sqrt(m),nu/m,1/m)/sqrt(m);
        else
            result = NaN;
        end
        return
    end
    
    
    if nu >= 1
        % here m < 1 !!!
        % non-periodic function
        K = melK(m);
        if abs(x) > K 
            result = NaN;
            return
        end
        t = mjsn(x,m);
        if nu*t*t > 1 
            result = NaN;
            return
        end
        result = melPi(t,nu,m);
        return
    end
    %}
    
    
    % General case ([1] Eq. 3.7.9)
    
    % Here m < 1 and nu < 1
     
    s = sign(x);
    x = abs(x);     
       
    % quasi-periodic function
    K = melK(m);
    n = fix(x/K);
    x = x - n*K;
    if mod(n,2) == 0
        result = n*mcelPi(nu,m) + melPi(mjsn(x,m),nu,m);
    else
        result = (n + 1)*mcelPi(nu,m) - melPi(mjsn(K - x,m),nu,m);
    end
    
    result = s*result;
    
end
