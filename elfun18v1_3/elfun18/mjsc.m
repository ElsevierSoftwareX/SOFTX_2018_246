function result = mjsc( x, m)
%MJSC Compute value of the Jacobi elliptic function sc(x,k) for
%   argument |x|<inf and parameter |m|<inf. Returns NaN if any of
%   the arguments is invalid or convergence failed. It is assumed that 
%   arguments are real scalars without check.
%
%   Functions called:
%       sncndn
%
    
    [sn, cn, ~] = sncndn( x, 1 - m);
    result = sn/cn;
    
end

