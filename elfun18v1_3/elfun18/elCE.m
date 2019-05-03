function result = elCE( k )
%ELCE Evaluates complementary complete elliptic integrals of the 2nd kind
%
%     E'(k) = E(k')  
%
%   Result:
%       E'(k) -- real scalar or NaN if either argument is invalid 
%           or convergenece failed.
%
%   Arguments:
%       k    -- real scalar, modulus 0 <= k < inf
%
%   Functions called:
%       melCE
%
    
    result = melCE(k^2);

end



