function result = EllipticNome( M )
%ELLIPTICNOME Elliptic nome function. 
%   ELLIPTICNOME(M) is the elliptic nome of the elements of the parameter
%   M. 

%   MELLIPTICNOME is a wrapper function which mimics the elemental 
%   behaviour of the function melnome.

%   Functions called:
%       melnome, ufun1

    if nargin < 1
        error('Not enough input arguments.');
    end
    
    result = ufun1(@melnome, M);
    
end

