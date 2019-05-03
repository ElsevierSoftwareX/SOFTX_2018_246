function result = jepsilon( x, k)
%JEPSILON Compute value of the Jacobi elliptic function epsilon(x,k) for
%   argument |x|<inf and elliptic modulus |k|<inf. Returns NaN if any of
%   the arguments is invalid. It is assumed that arguments are real scalars
%   without check.
%
%   Functions called:
%       mjepsilon

    result = mjepsilon( x, k^2);
    
end


