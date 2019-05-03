function result = el3( x, kc, p )
%EL3 Evaluates the incomplete Bulirsch's elliptic integral of 3rd kind
%
%                     x
%                    | |  
%                    |            (1 + t^2) dt
%   el3(x,kc,p)  =   |  -----------------------------------------
%                    |  (1 + p*t^2)*sqrt((1 + t^2)*(1 + kc^2*t^2)) 
%                  | | 
%                   0
%
%   Result:
%       el3(x,kc,p) -- real scalar or NaN if either argument is invalid or
%           convergence failed. If p < 0 the result is Cauchy PV.
%
%   Arguments: 
%       x   -- real scalar
%       kc  -- real scalar, complementary modulus 
%       p   -- real scalar 
%
%   Functions called:
%       cel3, el1 
%
%   Matlab functions called:
%       abs, asinh, atan, atanh, isinf, isnan, log, sign, sinh, sqrt,
%       zeros
%
%   References:
%   [1] R. Bulirsch -- Numerical calculation of elliptic
%       integrals and elliptic functions. III, Numerische Mathematik 13,
%       1969, pp 305 - 315
%
   
   % Check input
   
   if isnan(x) || isnan(kc) || isnan(p)
       result = NaN;
       return
   end
      
   % Special cases
   
   if x == 0
       result = 0;
       return
   end
   
   if isinf(x) % || abs(x) > 1e-16*max(1,1/abs(kc))
       result = sign(x)*cel3(kc,p);
       return
   end
   
   %if p == 1
   %    result = el1(x,kc);
   %    return
   %end
      
   kc = abs(kc);
   
   if kc == 1 %&& p >= 0  % calculated by Maple
       if p < 0
           q = sqrt(-p);
           result = real(atanh(q*x)/q); % complex number if qx > 1
       elseif p == 0
           result = x;
       else
           q = sqrt(p);
           result = atan(q*x)/q;
       end
       return
   end
   
   % General case is translation of Algol procedure el3 from [1].
   % Special cases kc = 0, p <= 0 are included
   
   % D  = 16; % number of digits
   % CA = 10^(-D/2);
   % CB = 10^(-(D+2));
   % ND = D - 2;
   CA = 0.5e-8;
   CB = 1e-18;
   ND = 14;
   
   % main algorithm
   hh = x*x;
   f  = p*hh;
   if kc == 0
       s = CA/(1 + abs(x));
   else
       s = kc;
   end
   t  = s*s;
   pm = 0.5*t;
   e  = hh*t;
   z  = abs(f);
   r  = abs(p);
   h  = 1 + hh;
   
   if e < 0.1 && z < 0.1 && t < 1 && r < 1
       % special case small
       rb = zeros(ND,1);
       ra = zeros(ND,1);
       rr = zeros(ND,1);
       for k = 2:ND
           rb(k) = 0.5/k;
           ra(k) = 1 - rb(k);
       end
       zd = 0.5/(ND + 1);
       s = p + pm;
       for k = 2:ND
           rr(k) = s;
           pm = pm*t*ra(k);
           s  = s*p + pm;
       end
       u = s*zd;
       s = u;
       bo = false;
       for k = ND:-1:2
           u = u + (rr(k) - u)*rb(k);
           bo = ~bo;
           if bo
               v = -u;
           else
               v = u;
           end
           s = s*hh + v;
       end
       if bo
           s = -s;
       end
       u = (u + 1)*0.5;
       result = (u - s*h)*sqrt(h)*x + u*asinh(x);
       return
   end
   
   % check
   w = 1 + f;
   if w == 0
       result = NaN;
       return
   end
   
   if p == 0
       p1 = CB/hh;
   else
       p1 = p;
   end
   s = abs(s);
   y = abs(x);
   g = p1 - 1;
   if g == 0
       g = CB;
   end
   f = p1 - t;
   if f == 0
       f = CB*t;
   end
   am = 1 - t;
   ap = 1 + e;
   r  = p1*h;
   fa = g/(f*p1);
   bo = fa > 0;
   fa = abs(fa);
   pz = abs(g*f);
   de = sqrt(pz);
   q  = sqrt(abs(p1));
   if pm > 0.5
       pm = 0.5;
   end
   pm = p1 - pm;
   if pm >= 0
       u = sqrt(r*ap);
       v = y*de;
       if g < 0
           v = -v;
       end
       d = 1/q;
       c = 1;
   else
       u  = sqrt(h*ap*pz);
       ye = y*q;
       v  = am*ye;
       q  = -de/g;
       d  = -am/de;
       c  = 0;
       pz = ap - r;
   end
   
   if bo
       bk = false;
       r = v/u;
       z = 1;
       k = 1;
       if pm < 0
           h = y*sqrt(h/(ap*fa));
           h = 1/h - h;
           z = h - r - r;
           r = 2 + r*h;
           if r == 0
               r = CB;
           end
           if z == 0
               z = h*CB;
           end
           r = r/z;
           z = r;
           w = pz;
       end
       u = u/w;
       v = v/w;
   else
       t = u + abs(v);
       bk = true;
       if p1 < 0
           de = v/pz;
           ye = u*ye;
           ye = ye + ye;
           u  = t/pz;
           v  = (-f - g*e)/t;
           t  = pz*abs(w);
           z  = (hh*r*f - g*ap + ye)/t;
           ye = ye/t;
       else
           de = v/w;
           ye = 0;
           u  = (e + p1)/t;
           v  = t/w;
           z  = 1;
       end
       if s > 1
           h = u;
           u = v;
           v = h;
       end
   end
   
   y = 1/y;
   e = s;
   n = 1;
   t = 1;
   m = 0;
   j = m;
   while true
       y = y - e/y;
       if y == 0
           y = sqrt(e)*CB;
       end
       f = c;
       c = d/q + c;
       g = e/q;
       d = f*g + d;
       d = d + d;
       q = g + q;
       g = t;
       t = s + t;
       n = n + n;
       m = m + m;
       if bo
           if z < 0
               m = k + m;
           end
           k = sign(r);
           h = e/(u*u + v*v);
           u = u*(1 + h);
           v = v*(1 - h);
       else
           r = u/v;
           h = z*r;
           z = h*z;
           hh = e/v;
           if bk
               de = de/u;
               ye = ye*(h + 1/h) + de*(1 + r);
               de = de*(u - hh);
               bk = abs(ye) < 1;
           else
               if isinf(z)
                   result = NaN;
                   return
               end
               [z, k] = crack(z);
               m = m + k;
           end
       end
       
       if abs(g - s) <= CA*g
           break
       end
       
       if bo
           g  = (1/r - r)/2;
           hh = u + v*g;
           h  = g*u - v;
           if hh == 0
               hh = u*CB;
           end
           if h == 0
               h = v*CB;
           end
           z = r*h;
           r = hh/h;
       else
           u = u + e/u;
           v = v + hh;
       end
       if isinf(s)
           result = NaN;
           return
       end
       s = sqrt(e);
       s = s + s;
       e = s*t;
       j = j + j;
       if y < 0
           j = 1 + j;
       end
   end
   
   if y < 0
       j = 1 + j;
   end
   e = atan(t/y) + pi*j;
   e = e*(c*t + d)/(t*(t + q));
   if bo
       h = v/(t + u);
       z = 1 - r*h;
       h = r + h;
       if z == 0
           z = CB;
       end
       if z < 0
           m = m + sign(h);
       end
       s = atan(h/z) + m*pi;
   else
       if bk
           s = asinh(ye);
       else
           s = log(z) + m*log(2);
       end
       s = s/2;
   end
   e = (e + sqrt(fa)*s)/n;
   if x > 0
       y = e;
   else
       y = -e;
   end
   
   result = y;
   
end

function [ m, k ] = crack( x )
% Decomposition of floating point number z to m*2^k

    b = 0.6931471805599453094172; % = log(2) with 22 digits !!!
    a = log(x);
    k = floor(a/b) + 1;
    a = a - k*b;
    m = exp(a);
end

