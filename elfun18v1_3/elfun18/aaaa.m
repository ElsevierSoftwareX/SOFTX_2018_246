% ELLIPTIC INTEGRALS AND ELLIPTIC FUNCTIONS FOR REAL ARGUMENTS
% ============================================================
%
% Version: jan 2018
%
% Burlisch's elliptic integrals
% -----------------------------
% BulirschCEL( KC, P, A, B )    General complete elliptic integral
% BulirschCEL1( KC )            Complete elliptic integral of the first kind
% BulirschCEL2( KC, A, B )      Complete elliptic integral of the second kind
% BulirschCEL3( KC, P )         Complete elliptic integral of the third kind
% BulirschEL1( X, KC )          Elliptic integral of the first kind
% BulirschEL2( X, KC, A, B )    Elliptic integral of the second kind
% BulirschEL3( X, KC, P )       Elliptic integral of the third kind

% Carlson's elliptic integrals
% -----------------------------
% CarlsonRC( X, Y )             Elliptic integral RC
% CarlsonRD( X, Y, Z)           Symetric elliptic integral RD
% CarlsonRF( X, Y, Z )          Symetric elliptic integral RF
% CarlsonRG( X, Y, Z )          Symetric elliptic integral RG
% CarlsonRJ( X, Y, Z, P )       Symetric elliptic integral RJ

%******************************************************************
% Note
%   If parameter M is used instead of modulus K then the name of the
%   function begin with 'm'. E.g. EllipticB(K) vs mEllipticB(M)
% *****************************************************************

% Complete elliptic integrals
% ---------------------------
% EllipticB(K)          Complete elliptic integral B
% EllipticC(K)          Complete elliptic integral C
% EllipticD(K)          Complete elliptic integral D
% EllipticK(K)          Complete elliptic integral of the first kind
% EllipticE(K)          Complete elliptic integrals of the second kind
% EllipticPi(N,K)       Complete elliptic integrals of the third kind

% Complementary complete elliptic integrals
% ------------------------------------------
% EllipticCK(K)         Complementary comp. ell. integral of the first kind
% EllipticCE(K)         Complementary comp. ell. integral of the second kind
% EllipticCPi(N,K)      Complementary comp. ell. integral of the third kind

% Jacobi form of elliptic integrals 
% ---------------------------------
% EllipticB(X,K)        Incomplete elliptic integral B
% EllipticD(X,K)        Incomplete elliptic integral D
% EllipticF(X,K)        Incomplete elliptic integral of the first kind
% EllipticE(X,K)        Incomplete elliptic integrals of the second kind
% EllipticPi(X,N,K)     Incomplete elliptic integrals of the third kind

% Legendre form of elliptic integrals
% -----------------------------------
% pEllipticB(PHI,K)     Incomplete elliptic integral B
% pEllipticD(PHI,K)     Incomplete elliptic integral D
% pEllipticF(PHI,K)     Incomplete elliptic integral of the first kind
% pEllipticE(PHI,K)     Incomplete elliptic integrals of the second kind
% pEllipticPi(PHI,N,K)  Incomplete elliptic integrals of the third kind

% Jacobi second form of elliptic integrals
% -----------------------------------------
% JacobiEpsilon(X,K)    Jacobi Epsilon function (el. int. of 2nd kind)
% JacobiZeta(X,K)       Jacobi Zeta function  ( periodic part of Eps)
% JacobiLambda(X,N,K)   Jacobi Lambda function  ( el. int. of 3rd kind)
% JacobiOmega(X,N,K)    Jacobi Omega function ( periodic part of Lambda)

% Heuman form of elliptic integrals
% ---------------------------------
% HeumanLambda0(PHI,K)  Heuman's Lambda0 function (compl.el.int. of 3rd kd.)

% Jacobi elliptic functions
% -------------------------
% JacobiAM(X,K)         Jacobi amplitude function am
% JacobiSN(X,K)         Jacobi elliptic function sn
% JacobiCN(X,K)         Jacobi elliptic function cn
% JacobiDN(X,K)         Jacobi elliptic function dn
% JacobiCD(X,K)         Jacobi elliptic function cd
% JacobiSD(X,K)         Jacobi elliptic function sd
% JacobiND(X,K)         Jacobi elliptic function nd
% JacobiDC(X,K)         Jacobi elliptic function dc
% JacobiNC(X,K)         Jacobi elliptic function nc
% JacobiSC(X,K)         Jacobi elliptic function sc
% JacobiNS(X,K)         Jacobi elliptic function ns
% JacobiDS(X,K)         Jacobi elliptic function ds
% JacobiCS(X,K)         Jacobi elliptic function cs

% InverseJacobiAM(X,K)  Inverse Jacobi amplitude function am
% InverseJacobiSN(X,K)  Inverse Jacobi elliptic function sn
% InverseJacobiCN(X,K)  Inverse Jacobi elliptic function cn
% InverseJacobiDN(X,K)  Inverse Jacobi elliptic function dn
% InverseJacobiCD(X,K)  Inverse Jacobi elliptic function cd
% InverseJacobiSD(X,K)  Inverse Jacobi elliptic function sd
% InverseJacobiND(X,K)  Inverse Jacobi elliptic function nd
% InverseJacobiDC(X,K)  Inverse Jacobi elliptic function dc
% InverseJacobiNC(X,K)  Inverse Jacobi elliptic function nc
% InverseJacobiSC(X,K)  Inverse Jacobi elliptic function sc
% InverseJacobiNS(X,K)  Inverse Jacobi elliptic function ns
% InverseJacobiDS(X,K)  Inverse Jacobi elliptic function ds
% InverseJacobiCS(X,K)  Inverse Jacobi elliptic function cs

% Jacobi Theta Functions
% ------------------------
% EllipticNome(K)       Nome function
% EllipticModulus(Q)    Modulus function
% JacobiTheta1(X,Q)     Jacobi theta function theta1
% JacobiTheta2(X,Q)     Jacobi theta function theta2
% JacobiTheta3(X,Q)     Jacobi theta function theta3
% JacobiTheta4(X,Q)     Jacobi theta function theta4

% Lemniscate functions
% ---------------------
% GaussCL(X)            Lemniscate cos
% GaussSL(X)            Lemniscate sin
% InverseGaussCL(X)     Inverse lemniscate cos
% InverseGaussSL(X)     Inverse lemniscate sin

% Misc. functions
% ---------------
% GausAGM(X,Y)          Gauss' arithmetic geometric mean
% GudermanGD(X)         Gudermannian function gd
% InverseGudermannGD(X) Inverse of Gudermannian function gd

% NOTES:
%
%   **********************************************************************
%   Computation of the value of a function is restricted to a domain where
%   the function has real values. Thus for example complete elliptic 
%   integrals are calculated for modulus |k|<=1 and parameter -inf<m<=1. 
%   **********************************************************************
%
%   The functions are available in two levels.
%       low    level functions with scalar arguments 
%       higher level functions with matrix arguments 

%   Most of low level functions are based on Matlab translations of Algol 
%   procedures from [1-3], Pascal procedures from [4], and Fortran 
%   functions from [5].
%
%   Low level Jacobi functions are wrappers calling 'sncndn' which is 
%   translation of Algol procedure sncndn from [1]. 
%
%   Jacobi theta functions are translation of Pascal procedures from [4].
%
%   It is assumed that the input arguments of low level functions are 
%   real scalars without check. 
%

%   High level functions are wrappers which mimics an elemental 
%   beghaviour of the function by calling the functions ufun1, ufun2, 
%   ufun3, ufun4. Here the term 'elemental' is borwed from Fortran i.e. 
%   it means that a high  level functions may be called with a matrix 
%   arguments of the same size (or any of them can be scalar) in which case
%   a function will be applied element-wise, with a conforming matrix 
%   return value.
%
%   All higher level functions check input ( matrix class and number of 
%   arguments). 

%
%   References
%   ----------
%   [1] R. Bulirsch, "Numerical calculation of elliptic integrals and 
%       elliptic functions", Numerische Mathematik 7, 1965, pp 78-90
%   [2] R. Bulirsch, "Numerical calculation of elliptic integrals and 
%       elliptic functions. II", Numerische Mathematik 7, 1965, pp 353-354
%   [3] R. Bulirsch, "Numerical calculation of elliptic integrals and 
%       elliptic functions. III", Numerische Mathematik 13,1969, pp 305-315
%   [4] W.Ehrhardt, "The AMath and DMath Special functions", 2016
%   [5] W.H.Press et al., "Numerical Recipes in Fortran 90", 2nd ed., 
%       Cambridge, 1996
%


%   Naming conventions
%   ------------------
%
%   For each level the following naming convention was adopted:
%       function begin with 'm'  use the parameter m instead of modulus k
%       functions begin with 'p' use the argument phi instead of of x
%       function begin with 'mp' use the argument phi instead of of x and
%       the parameter m instead of modulus k.
%
%   Examples:
%       Low level name for Jacobian sn function is 'jsn' and higher level
%       name is 'JacobiSN'. If the parameter m is used then the names are
%       'mjsn' and 'mJacobiSN'.
%       Low level name for elliptic integral of first kind is 'elF'. If the
%       parameter is used then name is 'melF'. If Legendre form is used
%       then names are eather 'pelF' or 'mpelF'.


% LOW LEVEL FUNCTIONS
% *******************
%
% Bulirsch elliptic integrals
% ===========================
%
%   kc -- complementary modulus
%
%    Incomplete          Complete
%    ----------------------------------
%    el1(x,kc)           cel1(kc)
%    el2(x,kc,a,b)       cel2(kc,a,b)
%    el3(x,kc,p)         cel3(kc,p)
%                        cel(kc,p,a,b) 
%
% Carlson elliptic integrals
% ==========================
%
%   rc(x,y)
%   rd(x,y,z)
%   rf(x,y,z)
%   rg(x,y,z)
%   rj(x,y,z,p)
%
% Elliptic integrals (Jacobi form)
% ================================
%
%   k -- modulus, n -- characteristic
%
%   Incomplete      Complete        Complementary complete
%   -------------------------------------------------------
%   elE(x,k)        elE(k)          elCE(k)
%   elF(x,k)        elK(k)          elCK(k)
%   elPi(x,n,k)     elPi(n,k)       elCPi(n,k)
%
%   Incomplete      Complete
%   -------------------------------
%   elB(x,k)        elB(k)
%                   elC(k)
%   elD(x,k)        elD(k)
%
%   m = k^2 -- parameter, n -- characteristic
%
%   Incomplete          Complete       Complementary complete
%   -----------------------------------------------
%   melE(x,m)           melE(m)        melCE(m)
%   melF(x,m)           melK(m)        melCK(m)
%   melPi(x,n,m)        melPi(n,m)     melCPi(n,m)
%
%   Incomplete          Complete
%   --------------------------------
%   melB(x,m)           melB(m)
%                       melC(m)
%   melD(x,m)           melD(m)
%
% Elliptic integrals (Legendre form)
% ==================================
%
%   phi - amplitude = asin(x), n - characteristic, k - modulus 
%     
%   pelE(phi,k)      
%   pelF(phi,k)     
%   pelPi(phi,n,k)   
%
%   m = k^2 - parameter  -inf<m<=1
%
%   mpelE(phi,m)      
%   mpelF(phi,m)     
%   mpelPi(phi,n,m)   
%
% Elliptic integrals (Jacobi 2nd form)
% ====================================
%
%   n - characteristic <=1, k - modulus |k|<=1, z = sn(x,k)
%     
%   jepsilon(z,k)  -- Jacobi Epsilon function (ell. int of 2nd kind)
%   jlambda(z,n,k) -- Jacobi Lambda function  (ell. int of 3rd kind) 
%
%   Periodic part:
%   jzeta(z,k)
%   jomega(z,n,k)
%
%   m = k^2 - parameter  -inf<m<=1
%
%   Integral           Periodic part
%   --------------------------------
%   mjeps(z,m)         mjzeta(z,m) 
%   mjlambda(z,n,m)    mjomega(z,n,m)   
%
%   Related functions
%
%   pjzeta(phi,k)   -- Jacobi Zeta function
%   plambda0(phi,k) -- Heuman Lambda function 
%

% Misc. functions
% ===============
%
%   gAGM(x,y)       -- arithmetic-geometric mean
%
%   gd(x)   igd(x)  -- Gudermann function and it inverse
%
%   gcl(x)  igcl(x) -- Lemniscate functions and it inverses
%   gsl(x)  igsl(x)
%

% JACOBI ELLIPTIC FUNCTIONS
% ==========================
%
%   k -- modulus
%
%   jsn(x,k)   jns(x,k)
%   jcn(x,k)   jnc(x,k)
%   jdn(x,k)   jnd(x,k)
%
%   jsc(x,k)   jcs(x,k)
%   jcd(x,k)   jdc(x,k)
%   jds(x,k)   jsd(x,k)
%
%   m = k^2 -- parameter
%
%   mjsn(x,m)   mjns(x,m)
%   mjcn(x,m)   mjnc(x,m)
%   mjdn(x,m)   mjnd(x,m)
%
%   mjsc(x,m)   mjcs(x,m)
%   mjcd(x,m)   mjdc(x,m)
%   mjds(x,m)   mjsd(x,m)
%

% Inverse Jacobi elliptic functions
% =================================
%
%   k -- modulus
%
%   ijsn(x,k)   ijns(x,k)
%   ijcn(x,k)   ijnc(x,k)
%   ijdn(x,k)   ijnd(x,k)
%
%   ijsc(x,k)   ijcs(x,k)
%   ijcd(x,k)   ijdc(x,k)
%   ijds(x,k)   ijsd(x,k)
%
%   m = k^2 -- parameter
%
%   mijsn(x,m)   mijns(x,m)
%   mijcn(x,m)   mijnc(x,m)
%   mijdn(x,m)   mijnd(x,m)
%
%   mijsc(x,m)   mijcs(x,m)
%   mijcd(x,m)   mijdc(x,m)
%   mijds(x,m)   mijsd(x,m)
%

% Jacobi amplitude functions
%
%   k -- modulus
%
%   jam(x,k)    
%
%   m = k^2 -- parameter
%
%   mjam(x,m)


% JACOBI THETA FUNCTIONS
% =======================
%
%   k -- modulus, q -- nome, n = 1..4
%
%   jtheta1(x,q), jtheta2(x,q),jtheta3(x,q),jtheta4(x,q)
%   elmodulus(k), elnome(k), melnome(m)
%

