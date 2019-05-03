function result = mjnd( x, m)
%MJND Compute value of the Jacobi elliptic function nd(x,k) for
%   argument |x|<inf and parameter |m|<inf. Returns NaN if any of
%   the arguments is invalid or convergence failed. It is assumed that 
%   arguments are real scalars without check.
%
%   Functions called:
%       sncndn
    
    [~, ~, dn] = sncndn( x, 1 - m);
    result = 1/dn;

end

