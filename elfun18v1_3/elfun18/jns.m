function result = jns( x, k)
%JNS Compute value of the Jacobi elliptic function ns(x,k) for
%   argument |x|<inf and elliptic modulus |k|<inf. Returns NaN if any of
%   the arguments is invalid. It is assumed that arguments are real scalars
%   without check.
%
%   Functions called:
%       sncndn
%
    
    [ sn, ~, ~] = sncndn( x, (1 - k)*(1 + k));
    result = 1/sn;

end

