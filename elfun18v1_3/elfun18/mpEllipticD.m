function result = mpEllipticD( Phi, M )
%MPELLIPTICD  Legendre elliptic integral D. 
%   MPELLIPTICD(Phi,M) is elliptic integral  D of the elements of Phi 
%   (argument) and M (parameter). Phi and M must be real and the same size
%   or any of them can be scalar.
%
%   MPELLIPTICD(M) is the complete elliptic integral B of the
%   elements of M. The elements of M must all be real.

%   See also
%       pEllipticD

%   MPELLIPTICD is a wrapper function which mimics the elemental behaviour
%   of function mpelD.

%   Functions called:
%       mpelD, mcelD, ufun1, ufun2

    if nargin < 1
        error('Not enough input arguments.');
    end
    
    if nargin == 1
        result = ufun1(@mcelD, Phi);
    else
        result = ufun2(@mpelD, Phi, M);
    end
    
end

