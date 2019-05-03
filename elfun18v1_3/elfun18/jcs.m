function result = jcs( x, k)
%JCS Compute value of the Jacobi elliptic function cs(x,k) for
%   argument |x|<inf and elliptic modulus |k|<inf. Returns NaN if any of
%   the arguments is invalid. It is assumed that arguments are real scalars
%   without check.
%
%   Functions called:
%       sncndn
%
    

    [ sn, cn, ~] = sncndn( x, (1 - k)*(1 + k));
   
    result = cn/sn;
    
end

