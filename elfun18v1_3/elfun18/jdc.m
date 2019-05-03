function result = jdc( x, k)
%JDC Compute value of the Jacobi elliptic function dc(x,k) for
%   argument |x|<inf and elliptic modulus |k|<inf. Returns NaN if any of
%   the arguments is invalid. It is assumed that arguments are real scalars
%   without check.
%
%   Functions called:
%       sncndn
%

    [ ~, cn, dn] = sncndn( x, (1 - k)*(1 + k));
    result = dn/cn;
    
end

