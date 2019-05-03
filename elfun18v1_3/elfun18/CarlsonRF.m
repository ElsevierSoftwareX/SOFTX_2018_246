function result = CarlsonRF( X, Y, Z )
%CARLSONRF Carlson symetric elliptic integral RF
%   CARLSONRF(X,Y,Z) is the Carlson elliptic integral RF of the 
%   elements of X, Y and Z. X, Y and Z must be real and of the same 
%   size or any of them can be scalar. The elements of X, Y, Z must be  
%   non-negative. 
%
%   See also
%       CARLSONRC, CARLSONRD, CARLSONRG, CARLSONRJ

%   CARLSONRF is a wrapper function which mimics the elemental behaviour
%   of function RF.

%   Functions called:
%       rf, ufun3

    if nargin < 3
        error('Not enough input arguments.');
    end

    result = ufun3(@rf, X, Y, Z);
    
end

