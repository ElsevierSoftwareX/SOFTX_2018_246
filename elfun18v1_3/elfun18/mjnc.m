function result = mjnc( x, m)
%MJNC Compute value of the Jacobi elliptic function nc(x,m) for
%   argument |x|<inf and parameter |m|<inf. Returns NaN if any of
%   the arguments is invalid or convergence failed. It is assumed that 
%   arguments are real scalars without check.
%
%   Functions called:
%       sncndn
%
    
    [~, cn, ~] = sncndn( x, 1 - m);
    result = 1/cn;

end

