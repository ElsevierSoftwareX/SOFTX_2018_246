function result = mjsd( x, m)
%MJSD Compute value of the Jacobi elliptic function sd(x,k) for
%   argument |x|<inf and parameter |m|<inf. Returns NaN if any of
%   the arguments is invalid or convergence failed. It is assumed that 
%   arguments are real scalars without check.
%
%   Functions called:
%       sncndn

    [ sn, ~, dn] = sncndn( x, 1 - m);
    result = sn/dn;
    
end

