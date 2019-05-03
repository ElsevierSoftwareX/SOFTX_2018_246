function result = CarlsonRG( X, Y, Z )
%CARLSONRG Carlson symetric elliptic integral RG.
%   CARLSONRG(X,Y,Z) is the Carlson elliptic integral RG of the 
%   elements of X,Y and Z. X, Y and Z must all be real and of the same size 
%   or any of them can be scalar. The elements of X, Y, Z must be 
%   non-negative.
%
%   See also
%       CARLSONRC, CARLSONRD, CARLSONRF, CARLSONRJ

%   CARLSONRG is a wraopper function which mimics the elemental behaviour
%   of function RG.

%   Functions called:
%       rg, ufun3

    if nargin < 3
        error('Not enough input arguments.');
    end

    result = ufun3(@rg, X, Y, Z);
    
end

