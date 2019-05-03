function result = elC( k)
%ELC Evaluates the complete elliptic integral C.
%
%            1
%           | |  
%           |            t^2*(1 - t^2) dt
%   C(k) =  |  --------------------------------- = ((2 - k^2)*K - 2*E)/k^4
%           |  sqrt(1 - t^2)*sqrt(1 - k^2*t^2)^3 
%         | | 
%          0
%
%   Result:
%       C(k) -- real scalar or NaN if argument is invalid or convergenece
%           failed.
%
%   Arguments:
%       k    -- real scalar, modulus |k|<= 1
%
%   Functions called:
%       melC
%
%   Matlab functions called:
%       NONE

    result = melC( k^2);
    
end



