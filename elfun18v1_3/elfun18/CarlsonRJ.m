function result = CarlsonRJ( X, Y, Z, P )
%CARLSONRG Carlson symetric elliptic integral RJ.
%   CARLSONRG(X,Y,Z,P) is the Carlson elliptic integral RJ of the 
%   elements of X,Y,Z and P. X, Y, Z and P must be real and of the same 
%   size or any of them can be scalar. The elements of X,Y,Z must be 
%   non-negative. 
%
%   See also
%       CARLSONRC, CARLSONRD, CARLSONRF, CARLSONRG

%   CARLSONRJ is a wrapper function which mimics the elemental behaviour
%   of function RJ.

%   Functions called:
%       rj, ufun4

    if nargin < 4
        error('Not enough input arguments.');
    end

    result = ufun4(@rj, X, Y, Z, P);
    
end

