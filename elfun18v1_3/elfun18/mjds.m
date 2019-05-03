function result = mjds( x, m)
%MJDS Compute value of the Jacobi elliptic function ds(x,m) for
%   argument |x|<inf and parameter |m|<inf. Returns NaN if any of
%   the arguments is invalid or convergence failed. It is assumed that 
%   arguments are real scalars without check.
%
%   Functions called:
%       sncndn
%

    [ sn, ~, dn] = sncndn( x, 1 - m);
    result = dn/sn;
    
end

