function result = mEllipticC( M )
%MELLIPTICC  Elliptic integral C. 
%   MELLIPTICC(M) complete elliptic integral C of the elements of M.
%   The elements of M must all be real. 

%   See also
%       EllipticC

%   MELLIPTICC is a wrapper function which mimics the elemental behaviour
%   of function melC.

%   Functions called:
%       mcelC, melC, ufun1, ufun2

    if nargin < 1
        error('Not enough input arguments.');
    end
    
    result = ufun1(@melC, M);
    
end

