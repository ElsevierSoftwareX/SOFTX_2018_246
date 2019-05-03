function result = elCPi( nu, k)
%CELCPI Evaluates complementary complete elliptic integrals of the 3th kind
%
%     P'i(nu,k) = Pi(nu,1 - k) 
%
%   Result:
%       celCPi(nu,k) -- real scalar or NaN if either argument is invalid 
%           or convergenece failed.
%
%   Arguments:
%       n    -- real scalar, characteristics, n <= 1
%       k    -- real scalar, modulus 0 <= k < inf
%
%   Functions called:
%       melCPi
%

    result = melCPi( nu, k^2);
    
end

