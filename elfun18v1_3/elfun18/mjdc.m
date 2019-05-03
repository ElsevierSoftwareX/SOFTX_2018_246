function result = mjdc( x, m)
%MJDC Compute value of the Jacobi elliptic function dc(x,m) for
%   argument |x|<inf and parameter |m|<inf. Returns NaN if any of
%   the arguments is invalid or convergence failed. It is assumed that 
%   arguments are real scalars without check.
%
%   Functions called:
%       sncndn
%
    
    [ ~, cn, dn] = sncndn( x, 1 - m);
    result = dn/cn;
    
end

