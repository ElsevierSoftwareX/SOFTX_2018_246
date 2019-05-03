% elfun18 is a collection of Matlab functions that enable the computation of 
% wide set of Elliptic integrals, Jacobi's elliptic functions and Jacobi's 
% theta functions i.e. almost all given in handbooks ([2],[4],[5],[7]).

% Elfun18 has two levels: higher level functions with matrix
% arguments and low level functions with scalar arguments. Each function is
% available eather with the modulus k or parameter m as argument. In later
% case the function name begin with m. Incomplete elliptic integrals are 
% given in Jacobi form, Legendre form and Jacobi's second form (Epsilon 
% function [7] and Lambda functions [3]).

% There are many libraries that include elliptic integrals and elliptic
% functions (see below Internet sources). However each of these libraries  
% has limitations in the set of functions or in the choice of function  
% arguments. The widest range of functions among the libraries is 
% provided by AMath/DAMath.

% Folders
% =========

% Folder elfun18 contains elfun18 functions set.
% To use elfun18 functions set add folder elfun18 to Matlab search path. 

% Folder doc contains elfun18 reference manual (Matlab live scripts)

% Folder examples contains varoous examples
% Folder examples\gui contains interactive function viewer (Matlab R2017a 
% or higher). Calculator (fields x and k/m) accept regular Matlab expressions.

% Folder examples\plot contains a set srcipts which reproduce graphs of elliptic
% functions from literature ( [2], [6],[7]).

% Folder examples\test_accuracy contains a set of comparsion test with Matlab's
% ellipke, ellipj functions, and Matlab's symbolic toolbox elliptic
% functions (Matlab R2017a or higher). 

% Folder \examples test_timing contains a set of scripts which compare computation 
% time of elfun18 functions with Matlab's ellipke, ellipj functions, 
% and Matlab's symbolic toolbox elliptic functions (Matlab R2017a or higher). 

% Folder examples\test_verification contains a set which verifies various functional
% relations from literature ([1],[2], [7]).

% References
% ==========
%
% [1] Byrd, P.F., Friedman, M.D., 1971. Handbook of elliptic integrals 
%   for engineers and scientists, 2d ed. Springer-Verlag, Berlin, New York,.
% [2] Carlson, B.C., 2010. Elliptic Integrals, in: Olver, F.W.J.,
%   National Institute of Standards and Technology (U.S.) (Eds.). 
%   Cambridge University Press : NIST, Cambridge ; New York, pp. xv, 951 p.
% [3] Lawden, D.F., 1989. Elliptic functions and applications. 
%   Springer-Verlag, New York.
% [4] Milne-Thomson, L.M., 1972. Elliptic Integrals, in: Abramowitz, M.,
%   Stegun, I.A. (Eds.), Handbook of Mathematical Functions, Dover, 
%   Mineola, N.Y., p. 1046 S.
% [5] Milne-Thomson, L.M., 1972. Jacobian Elliptic Functions and Theta 
%   Functions, in: Abramowitz, M., Stegun, I.A. (Eds.), Handbook of
%   Mathematical Functions. Dover, Mineola, N.Y.
% [6] Oldham, K.B., Myland, J.C., Spanier, J., 2009. Atlas of functions 
%   with Equator, the atlas function calculator, 2nd ed. Springer, New York.
% [7] Reinhardt, W.P., Walker, P.L., 2010. Jacobian Elliptic Functions, 
%   in: Olver, F.W.J. (Ed.), NIST handbook of mathematical functions. 
%   Cambridge University Press : NIST, Cambridge ; New York, pp. xv, 951 p.

% Internet sources
% ================
% AMath/DAMath (Pascla) 
%   http://www.wolfgang-ehrhardt.de/amath_functions.html
% BOOST (C++) 
%   http://www.boost.org/doc/libs/1_53_0/libs/math/doc/sf_and_dist/html/math_toolkit/special/
% CERN (Fortran 77)
%   https://root.cern.ch/doc/v608/group__SpecFunc.html
% DATAPLOT (Fortran 77)  
%   http://www.itl.nist.gov/div898/software/dataplot/elli_fun.htm
% SLATEC (Fortan 77)
%   http://sdphca.ucsd.edu/slatec_source/TOC.htm
% Mathematics Source Library (C++) 
%   http://www.mymathlib.com/functions/elliptic_integrals.html
%   http://www.mymathlib.com/functions/elliptic_functions.html
% MPMATH (Pyton)  
%   http://docs.sympy.org/0.7.1/modules/mpmath/functions/elliptic.html

