function result = mjns( x, m)
%MJNS Compute value of the Jacobi elliptic function ns(x,k) for
%   argument |x|<inf and parameter |m|<inf. Returns NaN if any of
%   the arguments is invalid or convergence failed. It is assumed that 
%   arguments are real scalars without check.
%
%   Functions called:
%       sncndn
%
    
    [ sn, ~, ~] = sncndn( x, 1 - m);
    result = 1/sn;

end

