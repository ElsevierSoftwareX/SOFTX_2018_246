function result = melCE( m )
%MCELCE Evaluates complementary complete elliptic integrals of the 2nd kind
%
%     E'(m) = E(m')  
%
%   Result:
%       mcelCE(m) -- real scalar or NaN if argument is invalid 
%           or convergenece failed.
%
%   Arguments:
%       m    -- parameter, real scalar m >= 0
%
%   Functions called:
%       rg 
%
%   Matlab functions called:
%       log, isinf, isnan, pi, sqrt
%
%   Reference:
%   [1] B.C.Carlson,"Computing Elliptic Integrals by Duplication", Numer. 
%       Math. 33, 1979, pp 1-16.
%   [2] B.C.Carlson,"Numerical computation of real or complex elliptic 
%       integrals", Numerical Algorithms 10, 1995, pp 13-26.
%
    
    % Check input

    if isnan(m) || m < 0
        result = NaN;
        return
    end
    
    % Special cases

    if isinf(m)
        result = inf;
        return
    end
    
    if m == 0
        result = 1;
        return
    end
      
   %%{
    if m < 1e-16
        a = log(16/m);
        result = 1 + m*(0.25*(a - 1));
        return
    end
    %}
    
    if m == 1
        result = pi/2;
        return
    end
    
    %%{
    if m > 2e6
        b = log(16*(m - 1));
        a = sqrt(m - 1);
        result = a + 1/4*(b + 1)/a - 1/32*(b - 3/2)/a^3;
        return
    end
    %}
    
    % General case
    
    %result =  rf(0,m,1) - (1 - m)*rd(0,m,1)/3; % [1] 4.6
    
    result = 2*rg( 0, m, 1); % [2] 4.2
    
end



