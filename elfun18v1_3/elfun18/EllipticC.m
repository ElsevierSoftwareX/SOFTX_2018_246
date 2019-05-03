function result = EllipticC( K )
%ELLIPTICC  Elliptic integral C. 
%   ELLIPTICC(K) complete elliptic integral C of the elements of K.
%   The elements of K must all be real. 

%   See also
%       mEllipticC

%   ELLIPTICC is a wrapper function which mimics the elemental behaviour
%   of functions celC.

%   Functions called:
%       elC, ufun1, ufun2

    if nargin < 1
        error('Not enough input arguments.');
    end
    
    result = ufun1(@elC, K);
    
end

