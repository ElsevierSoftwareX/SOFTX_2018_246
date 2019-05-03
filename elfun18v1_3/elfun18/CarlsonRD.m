function result = CarlsonRD( X, Y, Z )
%CARLSONRD Carlson symetric elliptic integral RD. 
%   CARLSONRD(X,Y,Z) is the Carlson elliptic integral RD of the 
%   elements of X, Y and Z. X, Y and Z must be real and of the same 
%   size or any of them can be scalar. The elements of X, Y, Z must be
%   non-negative. 
%
%   See also
%       CARLSONRC, CARLSONRF, CARLSONRG, CARLSONRJ

%   CARLSONRD is a wrapper function which mimics the elemental behaviour
%   of function RD.

%   Functions called:
%       rd, ufun3

    if nargin < 3
        error('Not enough input arguments.');
    end

    result = ufun3(@rd, X, Y, Z);
    
end

