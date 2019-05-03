function result = mjcd( x, m)
%MJCD Compute value of the Jacobi elliptic function cd(x,m) for
%   argument |x|<inf and parameter |m|<inf. Returns NaN if any of
%   the arguments is invalid or convergenece failed. It is assumed that 
%   arguments are real scalars without check.
%
%   Functions called:
%       sncndn
%

    [ ~, cn, dn] = sncndn( x, 1 - m);
    result = cn/dn;
    
end

