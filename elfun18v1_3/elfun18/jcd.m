function result = jcd( x, k)
%JCD Compute value of the Jacobi elliptic function cd(x,k) for
%   argument |x|<inf and elliptic modulus |k|<inf. Returns NaN if any of
%   the arguments is invalid or convergenece failed. It is assumed that 
%   arguments are real scalars without check.
%
%   Functions called:
%       sncndn
%
%   Matlab functions called:
%       NONE

    [ ~, cn, dn] = sncndn( x, (1 - k)*(1 + k));
    result = cn/dn;
    
end

