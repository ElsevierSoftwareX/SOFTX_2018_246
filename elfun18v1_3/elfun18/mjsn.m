function  result  = mjsn( x, m)
%MJSN Compute value of the Jacobi elliptic function sn(x,m) for
%   argument |x|<inf and parameter |m|<inf. Returns NaN if any of
%   the arguments is invalid or convergence failed. It is assumed that 
%   arguments are real scalars without check.
%
%   Functions called:
%       sncndn
%

    % Calculation
    [result, ~, ~] = sncndn( x, 1 - m);
    
end

